import 'package:card_giver/widgets/card_element.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:card_giver/providers/element_view.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class CardElementWrapper extends StatelessWidget {
  const CardElementWrapper({
    Key? key,
    required this.element,
    required this.startEdit,
    required this.deleteElement,
  }) : super(key: key);

  final CardElement element;
  final Function startEdit;
  final Function deleteElement;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ElementsView>(context);
    ViewTypes type = provider.type;

    return type == ViewTypes.preview
        ? CardElement.build(element: element)
        : Card(
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: element.type != ElementType.main
                      ? () => deleteElement()
                      : null,
                ),
                Expanded(child: CardElement.build(element: element)),
                Container(
                  margin: kIsWeb
                      ? const EdgeInsets.only(right: 25)
                      : EdgeInsets.zero,
                  child: IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      startEdit();
                    },
                  ),
                ),
              ],
            ),
          );
  }
}
