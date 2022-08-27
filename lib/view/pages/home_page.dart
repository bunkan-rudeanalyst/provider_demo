import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/models/todo_model.dart';
import 'package:provider_demo/providers/todo_provider.dart';
import 'package:provider_demo/view/components/list_item.dart';

import 'create_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Todo> todos = context.watch<TodoProvider>().todos;

    return Scaffold(
      body: todos.length > 0
          ? ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todoItem = todos[index];
                return ListItem(index: index);
              },
            )
          : const Center(
              child: Text(
                "no todo",
                style: TextStyle(fontSize: 32, color: Colors.grey),
              ),
            ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => CreatePage()));
          },
          label: Text("create")),
    );
  }
}
