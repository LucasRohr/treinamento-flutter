import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_list/components/todo-list/list-item/list-item.component.dart';
import 'package:todo_list/components/todo-list/todo-list.component.dart';

class TodoListState extends State<TodoList> {

  TodoListState({
    @required this.todoList,
    @required this.onTodoRemove
  });

  List todoList;
  final Function onTodoRemove;

  Widget renderListItem(context, index) {
    return (
      ListItem(
        item: this.todoList[index],
        todoList: this.todoList,
        index: index,
        onTodoRemove: this.onTodoRemove
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(

      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.only(top: 15),
      itemCount: this.todoList.length,
      itemBuilder: this.renderListItem

    );
  }

}
