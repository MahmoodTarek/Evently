import 'dart:io';

import 'package:evently/utils/app_theme_extension.dart';
import 'package:flutter/material.dart';

class CirclePicture extends StatelessWidget {
  final String imagePath;
  final File? imageFile;

  const CirclePicture({super.key, required this.imagePath, this.imageFile});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 114,
      height: 114,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: context.colors.inputs,
        boxShadow: [
          BoxShadow(
            color: context.colors.stroke,
            spreadRadius: 0.8,
            blurRadius: 0.8,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: imageFile != null
          ? Image.file(imageFile!, fit: BoxFit.cover)
          : imagePath.startsWith('http')
          ? Image.network(imagePath, fit: BoxFit.cover)
          : Image.asset(imagePath, fit: BoxFit.cover),
    );
  }
}
