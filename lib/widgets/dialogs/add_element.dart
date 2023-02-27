import 'package:card_giver/utils/create_element.dart';
import 'package:card_giver/widgets/card_element.dart';
import 'package:flutter/material.dart';

class AddElementDialog {
  Future showDialog(BuildContext context) {
    return showGeneralDialog(
      barrierLabel: "showGeneralDialog",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.6),
      transitionDuration: const Duration(milliseconds: 400),
      context: context,
      pageBuilder: (context, _, __) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: _buildDialogContent(context),
        );
      },
      transitionBuilder: (_, animation, __, child) {
        return SlideTransition(
          position: Tween(
            begin: const Offset(0, 1),
            end: const Offset(0, 0),
          ).animate(animation),
          child: child,
        );
      },
    );
  }

  Widget _buildDialogContent(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        width: double.infinity,
        clipBehavior: Clip.antiAlias,
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Column(
          children: [
            _buildDecorations(context),
            _buildLinks(context),
          ],
        ),
      ),
    );
  }

  Widget _buildLinks(BuildContext context) {
    return Row(
      children: [
        _buildElementButton(
          icon: Icons.insert_link_rounded,
          name: 'Link',
          context: context,
          type: ElementType.link,
        ),
        const Expanded(
          flex: 1,
          child: SizedBox(),
        ),
        const Expanded(
          flex: 1,
          child: SizedBox(),
        ),
      ],
    );
  }

  Widget _buildDecorations(BuildContext context) {
    return Row(
      children: [
        _buildElementButton(
          icon: Icons.text_fields_rounded,
          name: 'Text field',
          context: context,
          type: ElementType.text,
        ),
        _buildElementButton(
          icon: Icons.image_outlined,
          name: 'Image',
          context: context,
          type: ElementType.image,
        ),
        _buildElementButton(
          icon: Icons.stacked_line_chart_rounded,
          name: 'Divider',
          context: context,
          type: ElementType.divider,
        ),
      ],
    );
  }

  Widget _buildElementButton({
    required IconData icon,
    required String name,
    required BuildContext context,
    required ElementType type,
  }) {
    _createElement() async {
      CardElement? newElement =
          await createElement(type: type, context: context);
      if (newElement != null) {
        Navigator.pop(context, newElement);
      }
    }

    return Expanded(
      flex: 1,
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          margin: const EdgeInsets.all(5),
          child: OutlinedButton(
            onPressed: _createElement,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon),
                Text(name),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
