import 'package:flutter/material.dart';
import 'package:airplane/Shared/theme.dart';

class CustomBoxSelectSeat extends StatelessWidget {
  final int statusCode;
  final String text;

  const CustomBoxSelectSeat(
      {Key? key, required this.statusCode, this.text = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color containerColor = colorTransparent;
    Color borderColor = colorTransparent;

    switch (this.statusCode) {
      case 0:
        containerColor = availableColor;
        borderColor = primaryColor;
        break;
      case 1:
        containerColor = primaryColor;
        borderColor = primaryColor;
        break;
      case 2:
        containerColor = unavailableColor;
        break;
      case 3:
        containerColor = whiteColor;
        break;
      default:
        containerColor = unavailableColor;
    }

    TextStyle stringStyle = whiteTextStyle.copyWith(fontWeight: semiBold);
    if (statusCode == 3) {
      stringStyle = greyTextStyle.copyWith(fontWeight: regular, fontSize: 16);
    }

    return Container(
        margin: EdgeInsets.only(right: 10, top: 10),
        height: 48,
        width: 48,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: containerColor,
            border: Border.all(color: borderColor)),
        child: Center(
          child: Text(
            text,
            style: stringStyle,
          ),
        ));
  }
}
