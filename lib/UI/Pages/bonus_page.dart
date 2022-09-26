import 'package:airplane/UI/Widgets/customButton.dart';
import 'package:airplane/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Shared/theme.dart';

class BonusPage extends StatelessWidget {
  const BonusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget bonusCard() {
      return Container(
        width: 300.0,
        height: 211.0,
        margin: EdgeInsets.only(top: 100),
        padding: EdgeInsets.all(defaultMargin),
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/img/card.png')),
            boxShadow: [
              BoxShadow(
                  color: primaryColor.withOpacity(0.8),
                  blurRadius: 50,
                  offset: Offset(0, 10))
            ]),
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state is AuthSuccess) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    // expanded di gunakan untuk memposisikan widget pada ruang kosong
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Name',
                              style: whiteTextStyle.copyWith(
                                  fontWeight: light, fontSize: 14)),
                          Text(
                            '${state.user.name}',
                            style: whiteTextStyle.copyWith(
                                fontWeight: light, fontSize: 20),
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 24.0,
                      height: 24.0,
                      margin: EdgeInsets.only(right: 6),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/img/logo/logo_airplane.png'))),
                    ),
                    Text(
                      'Pay',
                      style: whiteTextStyle.copyWith(
                          fontWeight: medium, fontSize: 16),
                    )
                  ]),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Balance',
                    style: whiteTextStyle.copyWith(
                        fontWeight: light, fontSize: 14.0),
                  ),
                  Text(
                    'IDR ${state.user.balance}',
                    style: whiteTextStyle.copyWith(
                        fontWeight: medium, fontSize: 26),
                  )
                ],
              );
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    // expanded di gunakan untuk memposisikan widget pada ruang kosong
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Name',
                              style: whiteTextStyle.copyWith(
                                  fontWeight: light, fontSize: 14)),
                          Text(
                            'anon',
                            style: whiteTextStyle.copyWith(
                                fontWeight: light, fontSize: 20),
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 24.0,
                      height: 24.0,
                      margin: EdgeInsets.only(right: 6),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/img/logo/logo_airplane.png'))),
                    ),
                    Text(
                      'Pay',
                      style: whiteTextStyle.copyWith(
                          fontWeight: medium, fontSize: 16),
                    )
                  ]),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Balance',
                    style: whiteTextStyle.copyWith(
                        fontWeight: light, fontSize: 14.0),
                  ),
                  Text(
                    'IDR 0',
                    style: whiteTextStyle.copyWith(
                        fontWeight: medium, fontSize: 26),
                  )
                ],
              );
            }
          },
        ),
      );
    }

    Widget titleText() {
      return Container(
        margin: EdgeInsets.only(top: 80),
        child: Column(children: [
          Text(
            'Big Bonus 🎉',
            style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 32),
          ),
          Text(
            'We give you early credit so that \n you can buy a flight ticket',
            style: greyTextStyle.copyWith(fontWeight: light, fontSize: 16),
            textAlign: TextAlign.center,
          )
        ]),
      );
    }

    Widget startNowButton() {
      return CustomButton(
        textButton: Text('Start Fly Now',
            style: whiteTextStyle.copyWith(fontWeight: medium, fontSize: 18)),
        actionButton: () {
          Navigator.pushNamedAndRemoveUntil(
              context, '/home-page', (route) => false);
          // Navigator.pushNamed(context, '/home-page');
        },
        margin: EdgeInsets.only(top: 50),
        width: 220.0,
      );
    }

    // Widget startNowButton() {
    //   return Container(
    //     width: 220,
    //     height: 55,
    //     margin: EdgeInsets.only(top: 50),
    //     child: TextButton(
    //         onPressed: () {
    //           Navigator.pushNamed(context, '/home-page');
    //         },
    //         child: Text('Start Fly Now',
    //             style:
    //                 whiteTextStyle.copyWith(fontWeight: medium, fontSize: 18)),
    //         style: TextButton.styleFrom(
    //             backgroundColor: primaryColor,
    //             shape: RoundedRectangleBorder(
    //                 borderRadius: BorderRadius.circular(defaultRadius)))),
    //   );
    // }

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Center(
        child: Column(children: [bonusCard(), titleText(), startNowButton()]),
      )),
    );
  }
}
