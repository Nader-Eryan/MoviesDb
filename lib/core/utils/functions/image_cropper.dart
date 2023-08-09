import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

/// Cropper plugin
Future<CroppedFile?> cropImage(XFile? imageFile,
    {CropStyle cropStyle = CropStyle.rectangle}) async {
  CroppedFile? croppedImage = await ImageCropper()
      .cropImage(cropStyle: cropStyle, sourcePath: imageFile!.path);
  return croppedImage;
}
