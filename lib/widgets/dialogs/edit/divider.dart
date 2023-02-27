import 'package:card_giver/types/divider_element.dart';
import 'package:flutter/material.dart';

import 'package:card_giver/widgets/dialogs/edit_element.dart';
import 'package:flutter/services.dart';

class EditDividerDialog {
  EditDividerDialog({
    required this.context,
    required this.state,
  }) {
    if (state.height != null) {
      _heightController.text = state.height.toString();
    } else {
      _heightController.text = '0';
    }
    if (state.thickness != null) {
      _thicknessController.text = state.thickness.toString();
    } else {
      _thicknessController.text = '0';
    }
  }

  final BuildContext context;
  final DividerElementState state;

  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _thicknessController = TextEditingController();

  Future show() {
    return showEditDialog(
      context: context,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHeightField(),
          const SizedBox(height: 10),
          _buildThicknessField(),
        ],
      ),
      result: state,
    );
  }

  Widget _buildHeightField() {
    return _buildNumberField(
      onChanged: (String height) {
        if (height.isNotEmpty) {
          state.height = double.parse(height);
        } else {
          state.thickness = null;
        }
      },
      controller: _heightController,
      label: 'Height',
    );
  }

  Widget _buildThicknessField() {
    return _buildNumberField(
      onChanged: (thickness) {
        if (thickness.isNotEmpty) {
          state.thickness = double.parse(thickness);
        } else {
          state.thickness = null;
        }
      },
      controller: _thicknessController,
      label: 'Thickness',
    );
  }

  Widget _buildNumberField({onChanged, controller, label}) {
    return Material(
      child: TextField(
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        onChanged: onChanged,
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: label,
        ),
      ),
    );
  }
}
