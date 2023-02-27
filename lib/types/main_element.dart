import 'package:image_picker/image_picker.dart';

class MainElementState {
  MainElementState({required this.name, required this.about, this.avatar});
  String name;
  String about;
  XFile? avatar;
}
