import 'package:airplane/UI/Widgets/customButton.dart';
import 'package:flutter/material.dart';
import '../../Shared/theme.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              color: primaryColor,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/img/bg_getstarted.png'))),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Fly Like a Bird',
                style: whiteTextStyle.copyWith(
                    fontWeight: semiBold, fontSize: 32.0),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Explore new world with us and let \n yourself get an amazing experiences',
                style:
                    whiteTextStyle.copyWith(fontWeight: light, fontSize: 16.0),
                textAlign: TextAlign.center,
              ),
              // Container(
              //   height: 55.0,
              //   width: 220.0,
              //   margin: EdgeInsets.only(top: 50.0, bottom: 80.0),
              //   child: TextButton(
              //       style: TextButton.styleFrom(
              //           backgroundColor: primaryColor,
              //           shape: RoundedRectangleBorder(
              //               borderRadius:
              //                   BorderRadius.circular(defaultRadius))),
              //       onPressed: () {
              //         Navigator.pushNamed(context, '/signup');
              //       },
              //       child: Text(
              //         'Get Started',
              //         style: whiteTextStyle.copyWith(
              //             fontWeight: medium, fontSize: 18.0),
              //       )),
              // ),
              CustomButton(
                textButton: Text(
                  'Get Started',
                  style: whiteTextStyle.copyWith(
                      fontWeight: medium, fontSize: 18.0),
                ),
                actionButton: () {
                  Navigator.pushNamed(context, '/signup');
                },
                margin: EdgeInsets.only(top: 50.0, bottom: 80.0),
                width: 220.0,
              )
            ],
          ),
        )
      ]),
    );
  }
}
