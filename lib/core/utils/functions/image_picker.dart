import 'package:image_picker/image_picker.dart';

/// Select an image via gallery or camera
Future<XFile?> pickImage(ImageSource source) async {
  XFile? selected = await ImagePicker().pickImage(source: source);
  return selected;
}
