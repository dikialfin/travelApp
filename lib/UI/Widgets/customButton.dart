import 'package:flutter/material.dart';
import 'package:airplane/Shared/theme.dart';

class CustomButton extends StatelessWidget {
  final Text textButton;
  final Function() actionButton;
  final double width;
  final EdgeInsets margin;

  const CustomButton(
      {Key? key,
      required this.textButton,
      required this.actionButton,
      this.width = double.infinity,
      required this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 55,
      margin: margin,
      child: TextButton(
          onPressed: actionButton,
          child: textButton,
          style: TextButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(defaultRadius)))),
    );
  }
}
