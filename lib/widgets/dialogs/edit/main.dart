import 'package:card_giver/utils/utils.dart';
import 'package:flutter/material.dart';

import 'package:card_giver/types/main_element.dart';
import 'package:card_giver/widgets/dialogs/edit_element.dart';
import 'package:image_picker/image_picker.dart';

class EditMainDialog {
  EditMainDialog({required this.context, required this.state}) {
    _controllerName.text = state.name;
    _controllerAbout.text = state.about;
  }
  final BuildContext context;
  MainElementState state;

  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerAbout = TextEditingController();

  Future show() {
    return showEditDialog(
      context: context,
      content: Column(
        children: [
          _buildNameField(),
          const SizedBox(height: 10),
          _buildAboutField(),
          const SizedBox(height: 10),
          _buildAvatarLoad(),
        ],
        mainAxisSize: MainAxisSize.min,
      ),
      result: state,
    );
  }

  Widget _buildNameField() {
    return Material(
      child: TextField(
        controller: _controllerName,
        onChanged: (name) {
          state.name = name;
        },
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Name',
        ),
      ),
    );
  }

  Widget _buildAboutField() {
    return Material(
      child: TextField(
        controller: _controllerAbout,
        onChanged: (about) {
          state.about = about;
        },
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'About',
        ),
      ),
    );
  }

  Widget _buildAvatarLoad() {
    return OutlinedButton(
        onPressed: () async {
          XFile? image = await pickImage();
          if (image != null) {
            state.avatar = image;
          }
        },
        child: const Text('Load avatar'));
  }
}
