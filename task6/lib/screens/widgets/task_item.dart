import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/task_model.dart';
import '../../provider/task_provider.dart';
import '../task_form.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  const TaskItem({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TaskProvider>(context, listen: false);

    return Dismissible(
      key: ValueKey(task.id),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => provider.deleteTask(task.id),
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: Colors.red,
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: ListTile(
          leading: Checkbox(
            value: task.isCompleted,
            onChanged: (_) => provider.toggleComplete(task.id),
          ),
          title: Text(
            task.title,
            style: TextStyle(
              decoration:
              task.isCompleted ? TextDecoration.lineThrough : null,
            ),
          ),
          subtitle: Text(task.description),
          trailing: IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => TaskFormScreen(existingTask: task),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
