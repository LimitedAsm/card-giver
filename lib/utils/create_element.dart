import 'package:card_giver/types/divider_element.dart';
import 'package:card_giver/types/image_element.dart';
import 'package:card_giver/types/link_element.dart';
import 'package:card_giver/types/text_element.dart';
import 'package:card_giver/widgets/card_element.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:card_giver/utils/edit_element_state.dart';

createElement({
  required ElementType type,
  required BuildContext context,
}) async {
  switch (type) {
    case ElementType.text:
      TextElementState? state = TextElementState(text: '');
      state = await editElementState(
        context: context,
        type: type,
        state: state,
      );
      if (state != null) {
        CardElement newElement = CardElement(
          type: type,
          state: state,
        );
        return newElement;
      }
      break;
    case ElementType.divider:
      DividerElementState? state = DividerElementState();
      state = await editElementState(
        context: context,
        type: type,
        state: state,
      );
      if (state != null) {
        CardElement newElement = CardElement(
          type: type,
          state: state,
        );
        return newElement;
      }
      break;
    case ElementType.link:
      LinkElementState? state = LinkElementState(link: '');
      state = await editElementState(
        context: context,
        type: type,
        state: state,
      );
      if (state != null && state.isValidLink) {
        CardElement newElement = CardElement(
          type: type,
          state: state,
        );
        return newElement;
      }
      break;
    case ElementType.image:
      final ImagePicker _picker = ImagePicker();
      final XFile? image = await _picker.pickImage(source: ImageSource.camera);
      if (image != null) {
        ImageElementState state = ImageElementState(image: image);

        CardElement newElement = CardElement(
          type: type,
          state: state,
        );

        return newElement;
      }
      break;
    case ElementType.main:
      // TODO: Handle this case.
      break;
  }
}
