import 'package:evently/utils/resources/app_styles.dart';
import 'package:evently/utils/screen_size.dart';
import 'package:flutter/material.dart';

class CustomEmptyScreen extends StatelessWidget {
  final String title;
  final String description;
  final String? image;
  final double? height;
  final double? width;

  const CustomEmptyScreen({
    super.key,
    required this.title,
    required this.description,
    this.image,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Column(
        mainAxisSize: .max,
        mainAxisAlignment: .center,
        crossAxisAlignment: .center,
        children: [
          if (image != null) Image.asset(image!),
          SizedBox(height: context.height * .02),
          Text(title, style: AppStyles.semiBold24(context: context).copyWith()),
          SizedBox(height: context.height * .01),
          Text(
            description,
            style: AppStyles.regular16(context: context).copyWith(),
          ),
        ],
      ),
    );
  }
}
