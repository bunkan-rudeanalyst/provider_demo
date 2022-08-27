import 'package:flutter/material.dart';

import '../models/todo_model.dart';

class TodoProvider extends ChangeNotifier {
  List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  /// todoインスタンス一覧への追加
  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  /// todoインスタンス一覧から削除
  void removeTodoAtIndex(int index) {
    _todos.removeAt(index);
    notifyListeners();
  }

  /// todoインスタンスの更新
  void updateIsDoneAtIndex(int index) {
    _todos[index].isDone = !_todos[index].isDone;
    notifyListeners();
  }
}
