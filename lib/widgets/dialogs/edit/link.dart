import 'package:card_giver/types/link_element.dart';
import 'package:flutter/material.dart';

import 'package:card_giver/widgets/dialogs/edit_element.dart';

class EditLinkDialog {
  EditLinkDialog({
    required this.context,
    required this.state,
  }) {
    _controller.text = state.link;
  }

  final BuildContext context;
  final LinkElementState state;

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
        onChanged: (link) {
          state.link = link;
        },
        controller: _controller,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Link',
        ),
      ),
    );
  }
}
