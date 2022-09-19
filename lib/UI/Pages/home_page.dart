import 'package:airplane/UI/Pages/home.dart';
import 'package:airplane/UI/Widgets/customIconNavbar.dart';
import 'package:airplane/cubit/page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Shared/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget navbar({int indexPage = 0}) {
      final int indexPage;
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
                index: 0, urlIcon: 'assets/img/icons/icon_globe.png'),
            CustomIconNavbar(
                index: 1, urlIcon: 'assets/img/icons/icon_book.png'),
            CustomIconNavbar(
                index: 2, urlIcon: 'assets/img/icons/icon_card.png'),
            CustomIconNavbar(
                index: 3, urlIcon: 'assets/img/icons/icon_settings.png'),
          ]),
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          body: SafeArea(
              child: Stack(
            children: [
              Home(currentIndex: currentIndex),
              navbar(indexPage: currentIndex)
            ],
          )),
        );
      },
    );
  }
}
