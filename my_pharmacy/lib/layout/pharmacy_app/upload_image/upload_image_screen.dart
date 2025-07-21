import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerBox extends StatelessWidget {
  final File? selectedImage;
  final VoidCallback onTap;

  ImagePickerBox({required this.selectedImage, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 120.0,
        height: 120.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: selectedImage != null
              ? DecorationImage(
            image: FileImage(selectedImage!),
            fit: BoxFit.cover,
          )
              : null,
        ),
        child: selectedImage == null
            ? Icon(Icons.add_a_photo, color: Colors.grey)
            : null,
      ),
    );
  }
}

