import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task6/screens/task_form.dart';
import 'package:task6/screens/widgets/task_item.dart';

import '../provider/task_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Management App'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: taskProvider.tasks.isEmpty
          ? const Center(child: Text('No tasks yet. Add some!'))
          : ListView.builder(
        itemCount: taskProvider.tasks.length,
        itemBuilder: (ctx, i) {
          final task = taskProvider.tasks[i];
          return TaskItem(task: task);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const TaskFormScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
