import 'package:flutter/material.dart';

import '../models/todo_model.dart';

class TodoProvider extends ChangeNotifier {
  List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void removeTodoAtIndex(int index) {
    _todos.removeAt(index);
    notifyListeners();
  }

  void updateIsDone(int index) {
    _todos[index].isDone = !_todos[index].isDone;
    notifyListeners();
  }
}
