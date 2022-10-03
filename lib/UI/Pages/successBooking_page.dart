import 'package:airplane/UI/Pages/home.dart';
import 'package:airplane/UI/Widgets/customButton.dart';
import 'package:airplane/cubit/page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:airplane/Shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuccessBookingPage extends StatelessWidget {
  const SuccessBookingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/img/logo/logo_calendar.png'))),
            ),
            SizedBox(
              height: 80,
            ),
            Text(
              'Well Booked 😍',
              style:
                  blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 32),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Areyou ready to explore the new\nworld of experiences?',
              style: greyTextStyle.copyWith(
                fontWeight: light,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            CustomButton(
              textButton: Text(
                'My Bookings',
                style:
                    whiteTextStyle.copyWith(fontWeight: medium, fontSize: 18),
              ),
              actionButton: () {
                context.read<PageCubit>().setPage(1);
                Navigator.pushNamedAndRemoveUntil(
                    context, '/home-page', (route) => false);
              },
              margin: EdgeInsets.only(top: 64),
              width: 220,
            )
          ],
        ),
      ),
    );
  }
}
