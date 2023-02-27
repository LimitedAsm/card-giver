import 'package:card_giver/types/divider_element.dart';
import 'package:flutter/material.dart';

class DividerElement extends StatelessWidget {
  const DividerElement({
    Key? key,
    required this.state,
  }) : super(key: key);

  final DividerElementState state;

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: state.height,
      thickness: state.thickness,
    );
  }
}
