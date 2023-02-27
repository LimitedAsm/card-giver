import 'package:card_giver/widgets/elements/divider.dart';
import 'package:card_giver/widgets/elements/image.dart';
import 'package:card_giver/widgets/elements/link.dart';
import 'package:card_giver/widgets/elements/main.dart';
import 'package:card_giver/widgets/elements/text.dart';

class CardElement {
  CardElement({required this.type, required this.state});

  ElementType type;
  dynamic state;

  static build({required CardElement element}) {
    ElementType type = element.type;
    var state = element.state;

    switch (type) {
      case ElementType.text:
        return TextElement(
          state: state,
        );
      case ElementType.main:
        return MainElement(
          state: state,
        );
      case ElementType.divider:
        return DividerElement(
          state: state,
        );
      case ElementType.link:
        return LinkElement(
          state: state,
        );
      case ElementType.image:
        return ImageElement(
          state: state,
        );
    }
  }
}

enum ElementType {
  main,
  text,
  divider,
  link,
  image,
}
