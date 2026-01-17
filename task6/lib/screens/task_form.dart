import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task_model.dart';
import '../provider/task_provider.dart';

class TaskFormScreen extends StatefulWidget {
  final Task? existingTask;
  const TaskFormScreen({super.key, this.existingTask});

  @override
  State<TaskFormScreen> createState() => _TaskFormScreenState();
}

class _TaskFormScreenState extends State<TaskFormScreen> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';

  @override
  void initState() {
    super.initState();
    if (widget.existingTask != null) {
      title = widget.existingTask!.title;
      description = widget.existingTask!.description;
    }
  }

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final provider = Provider.of<TaskProvider>(context, listen: false);
      if (widget.existingTask == null) {
        provider.addTask(title, description);
      } else {
        provider.updateTask(widget.existingTask!.id, title, description);
      }
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.existingTask == null ? 'Add Task' : 'Edit Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: title,
                decoration: const InputDecoration(labelText: 'Title'),
                validator: (value) =>
                value!.isEmpty ? 'Please enter a title' : null,
                onSaved: (value) => title = value!,
              ),
              TextFormField(
                initialValue: description,
                decoration: const InputDecoration(labelText: 'Description'),
                validator: (value) =>
                value!.isEmpty ? 'Please enter a description' : null,
                onSaved: (value) => description = value!,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveForm,
                child: const Text('Save Task'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
