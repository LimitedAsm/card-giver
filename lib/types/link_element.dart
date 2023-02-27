import 'package:any_link_preview/any_link_preview.dart';

class LinkElementState {
  LinkElementState({
    required link,
    this.hasPreview = true,
  }) {
    this.link = link;
  }

  late String _link;

  String get link => _link;

  set link(String link) {
    _link = link;
    if (isValidLink) {
      AnyLinkPreview.getMetadata(link: link).then(
        (metadata) {
          if (metadata?.image != null) {
            _hasImage = true;
          }
        },
      );
    }
  }

  bool get isValidLink => AnyLinkPreview.isValidLink(link);

  bool hasPreview;

  bool _hasImage = false;

  bool get hasImage {
    return _hasImage;
  }
}
