import 'package:flutter/material.dart';

showEditDialog(
    {required BuildContext context, required Widget? content, result}) {
  return showDialog(
    builder: (context) => AlertDialog(
      content: content,
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context, result);
          },
          child: const Text('OK'),
        ),
      ],
    ),
    context: context,
  );
}
