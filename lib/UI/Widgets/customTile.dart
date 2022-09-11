import 'package:flutter/material.dart';
import 'package:airplane/Shared/theme.dart';

class CustomTile extends StatelessWidget {
  final String urlImg, tittleTile, cityTile;
  final double rating;

  const CustomTile(
      {Key? key,
      required this.urlImg,
      required this.tittleTile,
      required this.cityTile,
      this.rating = 0.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget imageTileWidget() {
      return Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(defaultRadius),
            image: DecorationImage(image: AssetImage(urlImg))),
      );
    }

    Widget tittleTileWidget() {
      return Expanded(
        child: Column(
          children: [
            Text(
              tittleTile,
              style: blackTextStyle.copyWith(fontWeight: medium, fontSize: 18),
            ),
            Text(cityTile, style: greyTextStyle),
          ],
        ),
      );
    }

    Widget ratingTile() {
      return Row(children: [
        Container(
          width: 24,
          height: 24,
          margin: EdgeInsets.only(right: 5),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/img/icons/icon_star.png'))),
        ),
        Text(
          rating.toString(),
          style: blackTextStyle.copyWith(fontWeight: medium),
        )
      ]);
    }

    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.all(10),
      height: 90,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultRadius),
          color: whiteColor),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [imageTileWidget(), tittleTileWidget(), ratingTile()]),
    );
  }
}
