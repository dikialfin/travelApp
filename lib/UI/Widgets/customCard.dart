import 'package:airplane/Models/destination_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:airplane/Shared/theme.dart';

class CustomCard extends StatelessWidget {
  final DestinationModel destinations;
  final Function() action;

  const CustomCard({Key? key, required this.destinations, required this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(
        height: 323,
        width: 200,
        color: whiteColor,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(left: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 220,
              width: 180,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(destinations.imageUrl)),
                  borderRadius: BorderRadius.circular(defaultRadius)),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: 30,
                  width: 55,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image(
                          image: AssetImage('assets/img/icons/icon_star.png'),
                          height: 24,
                          width: 24,
                        ),
                        Text(destinations.rating.toString())
                      ]),
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(defaultRadius))),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, top: 20),
              child: Text(
                destinations.name,
                style:
                    blackTextStyle.copyWith(fontWeight: medium, fontSize: 18),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, top: 5),
              child: Text(
                destinations.city,
                style: greyTextStyle.copyWith(fontWeight: light, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
