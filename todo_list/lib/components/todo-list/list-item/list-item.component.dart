import 'package:flutter/widgets.dart';
import 'package:todo_list/components/todo-list/list-item/list-item.state.dart';

class ListItem extends StatefulWidget {

  ListItem({
    @required this.item,
    @required this.todoList,
    @required this.index,
    @required this.onTodoRemove
  });

  final Map item;
  final List todoList;
  final int index;
  final Function onTodoRemove;

  @override
  State<StatefulWidget> createState() {
    return (
      ListItemState(
        item: this.item,
        todoList: this.todoList,
        index: this.index,
        onTodoRemove: this.onTodoRemove
      )
    );
  }
  
}
