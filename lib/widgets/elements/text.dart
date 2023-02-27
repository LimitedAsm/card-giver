import 'package:card_giver/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:card_giver/types/text_element.dart';

class TextElement extends StatelessWidget {
  const TextElement({
    Key? key,
    required this.state,
  }) : super(key: key);

  final TextElementState state;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: elementCardColor,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Text(state.text),
      ),
    );
  }
}
