import 'dart:ffi';

import 'package:flutter/material.dart';

Future<void> showEditDialog(
    BuildContext context,
    int postId,
    String title,
    String initialValue,
    Function(String) onSave,
    ) async {
  TextEditingController controller = TextEditingController(text: initialValue);

  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(hintText: "Edit $title"),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              onSave(controller.text);
              Navigator.of(context).pop();
            },
            child: Text("Save"),
          ),
        ],
      );
    },
  );
}
