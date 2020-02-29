import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/components/button/button.component.dart';
import 'package:todo_list/components/input/input.component.dart';
import 'package:todo_list/components/todo-list/todo-list.component.dart';
import 'package:todo_list/pages/home/home.page.dart';
import 'package:todo_list/services/store-files.dart';

class HomeState extends State<Home> {

  TextEditingController todoInputController = new TextEditingController();

  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  List todoList = [];
  Map<String, dynamic> lastRemoved;
  int lastRemovedIndex;
  BuildContext snackContext;

  @override
  void initState() {
    super.initState();

    getTodoList().then((response) {
      setState(() {
        this.todoList = json.decode(response);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(
          'My TODO List',
          style: TextStyle(
            color: Colors.white
          ),
        ),

        centerTitle: true,
      ),

      body: Builder(
        builder: (context) {
          this.snackContext = context;
          return renderHomeBody();
        },
      )
    );
  }

  void handleTodoInputChange(String text) {
    this.todoInputController.text = text;
    this.todoInputController.selection = TextSelection(extentOffset: text.length, baseOffset: text.length);
  }

  String todoInputValidator(String text) {
    return text.isEmpty ? 'Insira uma tarefa primeiro' : null;
  }

  void addTodo() {
    setState(() {
      Map<String, dynamic> newTodo = new Map();
      newTodo['title'] = this.todoInputController.text;
      newTodo['ok'] = false;

      this.todoList.add(newTodo);
      saveTodo(this.todoList);

      this.todoInputController.text = '';
    });
  }

  void redoTodoRemove() {
    setState(() {
      this.todoList.insert(this.lastRemovedIndex, this.lastRemoved);
      saveTodo(this.todoList);
    });
  }

  void renderRemoveSnackbar(todoItem, index) {
    final snackbar = SnackBar(
      content: Text('Tarefa \"${todoItem['title']}\" removida!'),

      action: SnackBarAction(
        label: 'Desfazer',
        onPressed: this.redoTodoRemove,
      ),

      duration: Duration(seconds: 4),
    );

    Scaffold.of(this.snackContext).removeCurrentSnackBar(); 
    Scaffold.of(this.snackContext).showSnackBar(snackbar);
  }

  void removeTodo(todoItem, index) {
    setState(() {
      this.lastRemoved = Map.from(this.todoList[index]);
      this.lastRemovedIndex = index;
      this.todoList.removeAt(index);

      saveTodo(this.todoList);
      this.renderRemoveSnackbar(todoItem, index);
    });
  }

  void validateTodoAdd() {
    if(this.formKey.currentState.validate()) {
      this.addTodo();
    }
  }

  Widget renderForm() {
    return (
      Container(
        margin: EdgeInsets.only(top: 20, left: 18, right: 18),

        child: Form(

          key: this.formKey,

          child: Column(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: <Widget>[

              Container(
                child: Input(
                  controller: this.todoInputController,
                  placeholder: 'Digite uma tarefa',
                  type: TextInputType.text,
                  onChanged: this.handleTodoInputChange,
                  validator: this.todoInputValidator,
                ),

                margin: EdgeInsets.only(top: 10),
              ),

              Container(
                child: Button(
                  title: 'Adicionar',
                  onPressed: this.validateTodoAdd,
                ),

                margin: EdgeInsets.only(top: 20, bottom: 15),
              )

            ],

          ),

        )
      )
    );
  }

  Future<Null> onRefresh() async {
    await Future.delayed(Duration(seconds: 1));

    this.setState(() {
      this.todoList.sort((a, b) {
        if(a['ok'] && !b['ok']) {
          return 1;
        } else if(!a['ok'] && b['ok']) {
          return -1;
        }

        return 0;
      });

      saveTodo(this.todoList);
    });

    return null;
  }

  Widget renderTodoListView() {

    return (
      Expanded(
        child: RefreshIndicator(
          child: TodoList(
            todoList: this.todoList,
            onTodoRemove: this.removeTodo,
          ),

          onRefresh: this.onRefresh,

          color: Colors.red[400],
        )
      )
    );

  }

  Widget checkEmptyList() {
    if (this.todoList.length != 0) {
      return this.renderTodoListView();
    }

    return Container(
      margin: EdgeInsets.only(top: 50),
      height: 350,
      alignment: Alignment.center,

      child: Text(
        'Sem tarefas no momento!',
        style: TextStyle(
          color: Colors.red[400],
          fontSize: 22,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }

  Widget renderHomeBody() {
    return (
      Container(

          alignment: Alignment.topCenter,

          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,

            children: <Widget>[

              this.renderForm(),
              this.checkEmptyList()

            ],

          ),

        )
    );
  }

}