import 'package:flutter/material.dart';

class CreateTodoPopup extends StatefulWidget {
  const CreateTodoPopup({super.key});

  @override
  State<CreateTodoPopup> createState() => _CreateTodoPopupState();
}

class _CreateTodoPopupState extends State<CreateTodoPopup> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Write what you want to do',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: _descriptionController,
            decoration: const InputDecoration(
              label: Text('Description'),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              final TodoData todoData = (
                title: _titleController.text,
                description: _descriptionController.text,
              );
              Navigator.of(context).pop(todoData);
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}

typedef TodoData = ({
  String title,
  String description,
});
