import 'package:flutter/widgets.dart';
import 'package:todo_list/components/todo-list/todo-list.state.dart';

class TodoList extends StatefulWidget {

  TodoList({
    @required this.todoList,
    @required this.onTodoRemove
  });

  final List todoList;
  final Function onTodoRemove;

  @override
  State<StatefulWidget> createState() {
    return (
      TodoListState(
        todoList: this.todoList,
        onTodoRemove: this.onTodoRemove
      )
    );
  }
  
  
}
