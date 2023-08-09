import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:size_config/size_config.dart';
import 'package:whats_for_tonight/core/utils/functions/image_cropper.dart';
import 'package:whats_for_tonight/core/widgets/back_arrow_icon.dart';

import '../../../../../core/utils/functions/image_picker.dart';

/// Widget to capture and crop the image
class ImageCapture extends StatefulWidget {
  const ImageCapture({Key? key}) : super(key: key);
  @override
  createState() => _ImageCaptureState();
}

class _ImageCaptureState extends State<ImageCapture> {
  /// Active image file
  XFile? _imageFile;

  /// Remove image
  void _clear() {
    setState(() => _imageFile = null);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100.h,
          leading: Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: BackArrowIcon(onPressed: () {
              Navigator.pop(context);
            }),
          ),
        ),
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
                  onPressed: () async {
                    XFile? selected = await pickImage(ImageSource.camera);
                    setState(() {
                      _imageFile = selected;
                    });
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.photo_library),
                  iconSize: 38,
                  onPressed: () async {
                    XFile? selected = await pickImage(ImageSource.gallery);
                    setState(() {
                      _imageFile = selected;
                    });
                  },
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
                    onPressed: (() async {
                      CroppedFile? croppedImage = await cropImage(_imageFile);
                      if (croppedImage != null) {
                        setState(() {
                          _imageFile = XFile(croppedImage.path);
                        });
                      }
                    }),
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
