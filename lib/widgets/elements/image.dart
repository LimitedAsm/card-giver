import 'dart:io';

import 'package:card_giver/types/image_element.dart';
import 'package:card_giver/ui_constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ImageElement extends StatelessWidget {
  const ImageElement({Key? key, required this.state}) : super(key: key);
  final ImageElementState state;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: elementCardColor,
      child: kIsWeb
          ? Image.network(state.image.path)
          : Image.file(File(state.image.path)),
    );
  }
}
