import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imagepicker/controller/imagepicker_controller.dart';

class ImagePickerScreen extends StatelessWidget {
  const ImagePickerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ImagePickerController>(
      init: Get.put(ImagePickerController()),
      builder: (imagePickerController) {
        return Scaffold(
          backgroundColor: Colors.yellow.shade800,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                imagePickerController.selectedImagePath == ''
                    ? Image.asset(
                        'assets/images/image_placeholder.png',
                        height: 200,
                        width: 200,
                        fit: BoxFit.fill,
                      )
                    : Image.file(
                        File(imagePickerController.selectedImagePath),
                        height: 200,
                        width: 200,
                        fit: BoxFit.fill,
                      ),
                const Text(
                  'Select Image',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.all(20),
                    ),
                    textStyle: MaterialStateProperty.all(
                      const TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                  onPressed: () async {
                    selectImage(context, imagePickerController);
                  },
                  child: const Text('Select'),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> selectImage(
      BuildContext context, ImagePickerController imagePickerController) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: SizedBox(
            height: 180,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  const Text(
                    'Select Image From !',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          imagePickerController.gallerySelect(context);
                        },
                        child: Card(
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/gallery.png',
                                  height: 60,
                                  width: 60,
                                ),
                                const Text('Gallery'),
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          imagePickerController.cameraSelect(context);
                        },
                        child: Card(
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/camera.png',
                                  height: 60,
                                  width: 60,
                                ),
                                const Text('Camera'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
