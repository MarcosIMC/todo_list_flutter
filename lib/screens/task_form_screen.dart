import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/models/categories.dart';
import 'package:todo_list/providers/task_provider.dart';

import '../models/task.dart';

class TaskFormScreen extends StatefulWidget {
  final Task? task;

  const TaskFormScreen({super.key, this.task});

  @override
  State<TaskFormScreen> createState() => _TaskFormScreenState();
}

class _TaskFormScreenState extends State<TaskFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _title;
  late Categories _category;
  late bool _isEditing = false;

  @override
  void initState() {
    super.initState();

    if (widget.task != null) {
      _isEditing = true;
      _title = TextEditingController(text: widget.task!.title);
      _category = widget.task!.category;
    } else {
      _title = TextEditingController(text: '');
      _category = Categories.OCIO;
    }
  }


  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context, listen: false); 
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditing ? 'Editar tarea' : 'Crear tarea'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: _title,
                    decoration: const InputDecoration(
                      labelText: 'Título'
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Inserta un título';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20,),
                  DropdownButtonFormField<Categories>(
                      decoration: InputDecoration(
                        labelText: 'Seleccione una categoría'
                      ),
                    value: _category,
                    items: Categories.values.map((Categories category) {
                      return DropdownMenuItem(
                        value: category,
                        child: Text(category.name),
                      );
                    }).toList(),
                    onChanged: (Categories? value) {
                        _category = value!;
                    },
                    validator: (value) {
                        if (value == null) {
                          _category = Categories.OCIO;
                        }
                    },
                    onSaved: (value) {
                        _category = value!;
                    },
                  ),
                  const SizedBox(height: 20,),
                  ElevatedButton(
                      onPressed: () {
                        if(_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          if(_isEditing) {
                            taskProvider.editTask(widget.task!.id, _title.text, _category);
                          } else {
                            taskProvider.addTask(_title.text, _category);
                          }
                          Navigator.pop(context);
                        }
                      },
                      child: Text(_isEditing ? 'Guardar cambios' : 'Añadir tarea')
                  )
                ],
              )
          ),
      ),
    );
  }
}
