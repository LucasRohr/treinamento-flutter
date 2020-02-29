import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_list/components/todo-list/list-item/list-item.component.dart';
import 'package:todo_list/services/store-files.dart';

class ListItemState extends State<ListItem> {

  ListItemState({
    @required this.item,
    @required this.todoList,
    @required this.index,
    @required this.onTodoRemove
  });

  Map item;
  List todoList;
  final int index;
  final Function onTodoRemove;

  void checkListItem(bool newValue) {
    setState(() {
      this.item['ok'] = newValue;
      saveTodo(this.todoList);
    });
  }

  IconData renderItemAvatarIcon() {
    return this.item['ok'] ? Icons.check : Icons.error;
  }

  @override
  Widget build(BuildContext context) {
    return (

      Dismissible(
        key: Key(DateTime.now().millisecondsSinceEpoch.toString()),

        background: Container(
          color: Colors.red,
          child: Align(
            alignment: Alignment(-0.9, 0),
            child: Icon(Icons.delete, color: Colors.white),
          ),
        ),

        direction: DismissDirection.startToEnd,

        onDismissed: (direction) => this.onTodoRemove(this.item, this.index),

        child: Container(

          margin: EdgeInsets.only(top: 8, bottom: 8, left: 15, right: 15),

          child: CheckboxListTile(

            title: Text(
              this.item['title'],
              style: TextStyle(
                color: Colors.black,
                fontSize: 16
              ),
            ),

            onChanged: this.checkListItem,

            value: this.item['ok'],

            secondary: CircleAvatar(
              child: Icon(
                this.renderItemAvatarIcon(),
                color: Colors.red,
              ),

              backgroundColor: Colors.red[100],
            ),

            activeColor: Colors.transparent,

            checkColor: Colors.red,
          ),

        )
      )

    );
  }

}
