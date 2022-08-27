import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/models/todo_model.dart';
import 'package:provider_demo/providers/todo_provider.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  late TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: TextFormField(
              onChanged: (value) => setState(() {}),
              controller: _controller,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("cancel")),
              const SizedBox(
                width: 20,
              ),
              TextButton(
                  onPressed: _controller.text.isNotEmpty
                      ? () {
                          context.read<TodoProvider>().addTodo(
                              Todo(title: _controller.text, isDone: false));
                          Navigator.of(context).pop();
                        }
                      : null,
                  child: Text("create")),
            ],
          ),
        ],
      ),
    );
  }
}
