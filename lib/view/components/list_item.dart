import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/todo_model.dart';
import '../../providers/todo_provider.dart';

class ListItem extends StatelessWidget {
  const ListItem({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    Todo todoItem = context.watch<TodoProvider>().todos[index];

    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
            Text(
              "delete",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              width: 16,
            )
          ],
        ),
      ),
      onDismissed: (_) {
        context.read<TodoProvider>().removeTodoAtIndex(index);
      },
      child: Card(
          child: CheckboxListTile(
        onChanged: (_) {
          context.read<TodoProvider>().updateIsDoneAtIndex(index);
        },
        value: todoItem.isDone,
        title: Text(
          todoItem.title,
          style: todoItem.isDone
              ? const TextStyle(decoration: TextDecoration.lineThrough)
              : null,
        ),
      )),
    );
  }
}
