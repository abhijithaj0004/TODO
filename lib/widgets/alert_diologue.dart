// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:todo_app/widgets/buttons.dart';

class DiologueBox extends StatelessWidget {
  TextEditingController controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DiologueBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 241, 230, 135),
      content: TextFormField(
        controller: controller,
        decoration: const InputDecoration(
            hintText: 'Task Name', border: OutlineInputBorder()),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Buttons(text: 'SAVE,', onpressed: onSave),
            Buttons(text: 'CANCEL', onpressed: onCancel),
          ],
        )
      ],
    );
  }
}
