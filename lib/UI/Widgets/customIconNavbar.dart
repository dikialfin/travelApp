import 'package:flutter/material.dart';
import '../../Shared/theme.dart';

class CustomIconNavbar extends StatelessWidget {
  final String urlIcon;
  final bool isSelected;

  const CustomIconNavbar(
      {Key? key, required this.urlIcon, this.isSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: EdgeInsets.only(top: 18),
          height: 24,
          width: 24,
          decoration:
              BoxDecoration(image: DecorationImage(image: AssetImage(urlIcon))),
        ),
        Container(
          height: 2,
          width: 30,
          decoration: BoxDecoration(
              color: isSelected ? primaryColor : colorTransparent),
        )
      ],
    );
  }
}
