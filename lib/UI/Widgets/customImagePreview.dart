import 'package:flutter/material.dart';
import 'package:airplane/Shared/theme.dart';

class CustomImagePreview extends StatelessWidget {
  final urlImage;

  const CustomImagePreview({Key? key, required this.urlImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(urlImage)),
          borderRadius: BorderRadius.circular(18)),
    );
  }
}
