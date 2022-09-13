import 'package:airplane/UI/Widgets/customButton.dart';
import 'package:airplane/UI/Widgets/customImagePreview.dart';
import 'package:airplane/UI/Widgets/customInterest.dart';
import 'package:flutter/material.dart';
import 'package:airplane/Shared/theme.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget imgBanner() {
      return Container(
        width: double.infinity,
        height: 450,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/img/contents/destination1.png'))),
      );
    }

    Widget shadowWidget() {
      return Container(
        width: double.infinity,
        height: 450,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              whiteColor.withOpacity(0),
              Colors.black.withOpacity(0.9)
            ])),
      );
    }

    Widget contents() {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(children: [
          // Emblem Section
          Container(
            margin: EdgeInsets.only(top: 30),
            width: double.infinity,
            height: 24,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/img/img-emblem.png'))),
          ),
          // Tittle Section
          Container(
            margin: EdgeInsets.only(top: 260),
            child: Row(children: [
              // tittle and city
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lake Ciliwung',
                      style: whiteTextStyle.copyWith(
                          fontWeight: semiBold, fontSize: 24),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'Tangerang',
                      style: greyTextStyle.copyWith(
                          fontWeight: light, fontSize: 16),
                    ),
                  ],
                ),
              ),
              // rating
              Row(
                children: [
                  Image(
                    image: AssetImage('assets/img/icons/icon_star.png'),
                    height: 24,
                    width: 24,
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Text('4.8',
                      style: whiteTextStyle.copyWith(
                        fontWeight: medium,
                      ))
                ],
              )
            ]),
          ),
          // About Section
          Container(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 24),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(defaultRadius),
                color: whiteColor),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              // Tittle About
              Text(
                'About',
                style:
                    blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
              ),
              SizedBox(
                height: 5,
              ),
              // description
              Text(
                  'Berada di jalur jalan provinsi yang menghubungkan Denpasar Singaraja serta letaknya yang dekat dengan Kebun Raya Eka Karya menjadikan tempat Bali.',
                  style:
                      blackTextStyle.copyWith(fontWeight: regular, height: 2)),
              SizedBox(
                height: 20,
              ),
              Text(
                'Photos',
                style:
                    blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),
              // Photos Section
              Row(
                children: [
                  CustomImagePreview(
                      urlImage: 'assets/img/contents/img_photos1.png'),
                  CustomImagePreview(
                      urlImage: 'assets/img/contents/img_photos2.png'),
                  CustomImagePreview(
                      urlImage: 'assets/img/contents/img_photos3.png'),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Interests',
                style:
                    blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),
              // Interests Section
              Column(
                children: [
                  Row(
                    children: [
                      CustomInterest(interest: 'Kids Park'),
                      CustomInterest(interest: 'Honor Bridge'),
                    ],
                  ),
                  Row(
                    children: [
                      CustomInterest(interest: 'City Museum'),
                      CustomInterest(interest: 'Central Mall'),
                    ],
                  ),
                ],
              )
            ]),
          ),
          // Price Section
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 30, top: 30),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'IDR 2.500.000',
                        style: blackTextStyle.copyWith(
                            fontWeight: medium, fontSize: 18),
                      ),
                      Text(
                        'per orang',
                        style: greyTextStyle.copyWith(
                            fontWeight: light, fontSize: 14),
                      ),
                    ],
                  ),
                ),
                CustomButton(
                    textButton: Text(
                      'Book Now',
                      style: whiteTextStyle.copyWith(
                          fontWeight: medium, fontSize: 18),
                    ),
                    width: 170,
                    actionButton: () {
                      Navigator.pushNamed(context, '/select-seat');
                    },
                    margin: EdgeInsets.only(top: 0))
              ],
            ),
          )
        ]),
      );
    }

    return Scaffold(
        body: SingleChildScrollView(
            child: Stack(children: [imgBanner(), shadowWidget(), contents()])));
  }
}
