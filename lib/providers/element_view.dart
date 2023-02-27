import 'package:flutter/material.dart';

ViewTypes defaultViewType = ViewTypes.edit;

class ElementsView with ChangeNotifier {
  ViewTypes _type = defaultViewType;

  ViewTypes get type => _type;

  toggleType() {
    if (_type == ViewTypes.edit) {
      _type = ViewTypes.preview;
      notifyListeners();
    } else if (_type == ViewTypes.preview) {
      _type = ViewTypes.edit;
      notifyListeners();
    }
  }
}

enum ViewTypes {
  edit,
  preview,
}
