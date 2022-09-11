import 'package:flutter/material.dart';
import 'package:airplane/Shared/theme.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final String tittle;
  final bool hiddenText;

  const CustomTextFormField(
      {Key? key,
      required this.hintText,
      required this.tittle,
      this.hiddenText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          tittle,
          style: blackTextStyle.copyWith(fontWeight: regular, fontSize: 14),
        ),
        SizedBox(
          height: 6,
        ),
        TextFormField(
          obscureText: hiddenText,
          decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(defaultRadius)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(defaultRadius),
                  borderSide: BorderSide(color: primaryColor))),
        )
      ]),
    );
  }
}
