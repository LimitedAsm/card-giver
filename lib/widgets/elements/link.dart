import 'package:any_link_preview/any_link_preview.dart';
import 'package:flutter/material.dart';
import 'package:card_giver/types/link_element.dart';

class LinkElement extends StatefulWidget {
  const LinkElement({
    Key? key,
    required this.state,
  }) : super(key: key);

  final LinkElementState state;

  @override
  State<LinkElement> createState() => _LinkElementState();
}

class _LinkElementState extends State<LinkElement> {
  late LinkElementState state;

  @override
  initState() {
    state = widget.state;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: AnyLinkPreview(
        link: state.link,
        displayDirection: UIDirection.uiDirectionHorizontal,
        showMultimedia: state.hasImage,
      ),
    );
  }
}
