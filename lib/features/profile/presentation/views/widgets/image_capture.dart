import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:size_config/size_config.dart';

/// Widget to capture and crop the image
class ImageCapture extends StatefulWidget {
  ImageCapture({Key? key}) : super(key: key);
  @override
  createState() => _ImageCaptureState();
}

class _ImageCaptureState extends State<ImageCapture> {
  /// Active image file
  XFile? _imageFile;

  /// Cropper plugin
  Future<void> _cropImage({CropStyle cropStyle = CropStyle.rectangle}) async {
    CroppedFile? croppedImage = await ImageCropper()
        .cropImage(cropStyle: cropStyle, sourcePath: _imageFile!.path);
    if (croppedImage != null) {
      setState(() {
        _imageFile = XFile(croppedImage.path);
      });
    }
  }

  /// Select an image via gallery or camera
  Future<void> _pickImage(ImageSource source) async {
    XFile? selected = await ImagePicker().pickImage(source: source);

    setState(() {
      _imageFile = selected;
    });
  }

  /// Remove image
  void _clear() {
    setState(() => _imageFile = null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Select an image from the camera or gallery
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 100.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.photo_camera),
                iconSize: 38,
                onPressed: () => _pickImage(ImageSource.camera),
              ),
              IconButton(
                icon: const Icon(Icons.photo_library),
                iconSize: 38,
                onPressed: () => _pickImage(ImageSource.gallery),
              ),
            ],
          ),
        ),
      ),

      // Preview the image and crop it
      body: ListView(
        children: <Widget>[
          if (_imageFile != null) ...[
            Image.file(File(_imageFile!.path)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                TextButton(
                  onPressed: _cropImage,
                  child: const Icon(
                    Icons.crop,
                    size: 30,
                  ),
                ),
                TextButton(
                  onPressed: _clear,
                  child: const Icon(
                    Icons.refresh,
                    size: 30,
                  ),
                ),
                TextButton(
                  child: const Icon(
                    Icons.done,
                    size: 30,
                  ),
                  onPressed: () {}, //_saveImage
                ),
              ],
            ),

            //  Uploader(file: _imageFile)
          ]
        ],
      ),
    );
  }

  // Future<void> _saveImage() async {
  //   // await SqlDb()
  //   //     .update('Images', {'image': _imageFile!.path}, 'id = ${widget.noteId}');
  //   if (widget.noteModel.id == 0) {
  //     try {
  //       await SqlDb().insert('Images', {'id': 0, 'image': _imageFile!.path});
  //     } on Exception {
  //       int response = await SqlDb().updateData('''
  //       UPDATE Images
  //       SET image = '${_imageFile!.path}'
  //       WHERE id = 0
  //     ''');
  //       //print('response: $response');
  //     }
  //     Navigator.pushReplacement(
  //         context, MaterialPageRoute(builder: (context) => const HomePage()));
  //   } else {
  //     int response = await SqlDb().insert(
  //         'Images', {'image': _imageFile!.path, 'noteId': widget.noteModel.id});
  //     //print('response $response');
  //     Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(
  //             builder: (context) => NotePage(
  //                   noteModel: widget.noteModel,
  //                 )));
  //   }

  // }
}
