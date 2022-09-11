import 'package:airplane/UI/Pages/home.dart';
import 'package:airplane/UI/Widgets/customIconNavbar.dart';
import 'package:flutter/material.dart';
import '../../Shared/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget navbar() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 60,
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 24, vertical: 30),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(defaultRadius),
              color: whiteColor),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            CustomIconNavbar(
              urlIcon: 'assets/img/icons/icon_globe.png',
              isSelected: true,
            ),
            CustomIconNavbar(urlIcon: 'assets/img/icons/icon_book.png'),
            CustomIconNavbar(urlIcon: 'assets/img/icons/icon_card.png'),
            CustomIconNavbar(urlIcon: 'assets/img/icons/icon_settings.png'),
          ]),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [Home(), navbar()],
      )),
    );
  }
}
