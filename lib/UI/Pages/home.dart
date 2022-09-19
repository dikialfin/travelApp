import 'package:airplane/UI/Pages/detail_page.dart';
import 'package:airplane/UI/Pages/settings_page.dart';
import 'package:airplane/UI/Pages/transaction_page.dart';
import 'package:airplane/UI/Pages/wallet_page.dart';
import 'package:airplane/UI/Widgets/customCard.dart';
import 'package:airplane/UI/Widgets/customTile.dart';
import 'package:flutter/material.dart';
import 'package:airplane/Shared/theme.dart';

class Home extends StatelessWidget {
  final int currentIndex;
  const Home({Key? key, required this.currentIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: defaultMargin),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Howdy,\nKezia Anne',
                      style: blackTextStyle.copyWith(
                          fontWeight: semiBold, fontSize: 24)),
                  Text(
                    'Where to fly today?',
                    style:
                        greyTextStyle.copyWith(fontWeight: light, fontSize: 16),
                  ),
                ],
              ),
            ),
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/img/img_profile.png')),
                  shape: BoxShape.circle),
            )
          ],
        ),
      );
    }

    Widget popularDestination() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            CustomCard(
                urlImage: 'assets/img/contents/destination1.png',
                tittle: 'Lake Ciliwung',
                city: 'Tangerang',
                rating: 5.0,
                action: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DetailPage()));
                }),
            CustomCard(
                urlImage: 'assets/img/contents/destination2.png',
                tittle: 'White Houses',
                city: 'Spain',
                rating: 4.9,
                action: () {}),
            CustomCard(
                urlImage: 'assets/img/contents/destination3.png',
                tittle: 'Hill Heyo',
                city: 'Monaco',
                rating: 4.8,
                action: () {}),
            CustomCard(
                urlImage: 'assets/img/contents/destination4.png',
                tittle: 'Menarra',
                city: 'Japan',
                rating: 4.7,
                action: () {}),
            CustomCard(
                urlImage: 'assets/img/contents/destination5.png',
                tittle: 'Payung Teduh',
                city: 'Singapore',
                rating: 4.6,
                action: () {}),
          ],
        ),
      );
    }

    Widget newDestination() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        margin: EdgeInsets.only(top: 30, bottom: 120),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'New This Year',
            style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 18),
          ),
          CustomTile(
            urlImg: 'assets/img/contents/destination6.png',
            tittleTile: 'Danau Beratan',
            cityTile: 'Singajara',
            rating: 4.5,
          ),
          CustomTile(
            urlImg: 'assets/img/contents/destination7.png',
            tittleTile: 'Sydney Opera',
            cityTile: 'Australia',
            rating: 4.7,
          ),
          CustomTile(
            urlImg: 'assets/img/contents/destination8.png',
            tittleTile: 'Roma',
            cityTile: 'Italy',
            rating: 4.8,
          ),
          CustomTile(
            urlImg: 'assets/img/contents/destination9.png',
            tittleTile: 'Payung Teduh',
            cityTile: 'Singapore',
            rating: 4.5,
          ),
        ]),
      );
    }

    // pengkondisian untuk route page nya
    switch (currentIndex) {
      case 0:
        return ListView(
          children: [header(), popularDestination(), newDestination()],
        );
      case 1:
        return TransactionPage();
      case 2:
        return WalletPage();
      case 3:
        return SettingsPage();
      default:
        return ListView(
          children: [header(), popularDestination(), newDestination()],
        );
    }
  }
}
