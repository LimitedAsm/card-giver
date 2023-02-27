import 'package:card_giver/widgets/card_element.dart';
import 'package:card_giver/widgets/dialogs/edit/divider.dart';
import 'package:card_giver/widgets/dialogs/edit/image.dart';
import 'package:card_giver/widgets/dialogs/edit/link.dart';
import 'package:card_giver/widgets/dialogs/edit/main.dart';
import 'package:card_giver/widgets/dialogs/edit/text.dart';

import 'package:flutter/material.dart';

editElementState({
  required BuildContext context,
  required ElementType type,
  required state,
}) async {
  switch (type) {
    case ElementType.text:
      return await EditTextDialog(
        context: context,
        state: state,
      ).show();
    case ElementType.main:
      return await EditMainDialog(
        context: context,
        state: state,
      ).show();
    case ElementType.divider:
      return await EditDividerDialog(
        context: context,
        state: state,
      ).show();
    case ElementType.link:
      return await EditLinkDialog(
        context: context,
        state: state,
      ).show();
    case ElementType.image:
      return await EditImageDialog(
        context: context,
        state: state,
      ).show();
  }
}
