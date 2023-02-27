import 'package:flutter/material.dart';

import 'package:card_giver/types/text_element.dart';
import 'package:card_giver/widgets/dialogs/edit_element.dart';

class EditTextDialog {
  EditTextDialog({
    required this.context,
    required this.state,
  }) {
    _controller.text = state.text;
  }

  final BuildContext context;
  final TextElementState state;

  final TextEditingController _controller = TextEditingController();

  Future show() {
    return showEditDialog(
      context: context,
      content: _buildEditor(),
      result: state,
    );
  }

  Widget _buildEditor() {
    return Material(
      child: TextField(
        onChanged: (text) {
          state.text = text;
        },
        controller: _controller,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Text',
        ),
      ),
    );
  }
}
