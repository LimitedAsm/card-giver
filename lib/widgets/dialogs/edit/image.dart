import 'package:card_giver/types/image_element.dart';
import 'package:card_giver/utils/utils.dart';
import 'package:flutter/material.dart';

import 'package:card_giver/widgets/dialogs/edit_element.dart';
import 'package:image_picker/image_picker.dart';

class EditImageDialog {
  EditImageDialog({
    required this.context,
    required this.state,
  });

  final BuildContext context;
  final ImageElementState state;

  Future show() {
    return showEditDialog(
      context: context,
      content: _buildEditor(),
      result: state,
    );
  }

  Widget _buildEditor() {
    return Material(
      child: OutlinedButton(
        onPressed: () async {
          XFile? image = await pickImage();
          if (image != null) {
            state.image = image;
          }
        },
        child: const Text('Change image'),
      ),
    );
  }
}
