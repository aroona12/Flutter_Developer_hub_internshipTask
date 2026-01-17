import 'package:flutter/material.dart';
import 'dart:collection';
import 'package:uuid/uuid.dart';

import '../models/task_model.dart';

class TaskProvider with ChangeNotifier {
  final List<Task> _tasks = [];

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  void addTask(String title, String description) {
    _tasks.add(Task(
      id: const Uuid().v4(),
      title: title,
      description: description,
    ));
    notifyListeners();
  }

  void updateTask(String id, String title, String description) {
    final index = _tasks.indexWhere((task) => task.id == id);
    if (index != -1) {
      _tasks[index].title = title;
      _tasks[index].description = description;
      notifyListeners();
    }
  }

  void toggleComplete(String id) {
    final index = _tasks.indexWhere((task) => task.id == id);
    if (index != -1) {
      _tasks[index].isCompleted = !_tasks[index].isCompleted;
      notifyListeners();
    }
  }

  void deleteTask(String id) {
    _tasks.removeWhere((task) => task.id == id);
    notifyListeners();
  }
}
