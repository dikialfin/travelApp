import 'package:airplane/UI/Widgets/customBoxSelectSeat.dart';
import 'package:airplane/UI/Widgets/customButton.dart';
import 'package:flutter/material.dart';
import 'package:airplane/Shared/theme.dart';

class SelectSeat extends StatelessWidget {
  const SelectSeat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget indicatorSeat(
        {required int statusCode, required String statusName}) {
      Color containerColor = colorTransparent;
      Color borderColor = colorTransparent;

      switch (statusCode) {
        case 0:
          containerColor = availableColor;
          borderColor = primaryColor;
          break;
        case 1:
          containerColor = primaryColor;
          borderColor = primaryColor;
          break;
        case 2:
          containerColor = unavailableColor;
          break;
        default:
          containerColor = unavailableColor;
      }

      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Row(
          children: [
            Container(
              height: 16,
              width: 16,
              margin: EdgeInsets.only(
                right: 6,
              ),
              decoration: BoxDecoration(
                  color: containerColor,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: borderColor)),
            ),
            Text(statusName)
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 24),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // Tittle page
          Text(
            'Select Your\nFavorite Seat',
            style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 24),
          ),
          // Seat Indicator
          Row(
            children: [
              Container(
                  margin: EdgeInsets.only(right: 30),
                  child: indicatorSeat(statusCode: 0, statusName: 'Available')),
              Container(
                  margin: EdgeInsets.only(right: 30),
                  child: indicatorSeat(statusCode: 1, statusName: 'Selected')),
              Container(
                  margin: EdgeInsets.only(right: 30),
                  child:
                      indicatorSeat(statusCode: 2, statusName: 'Unavailable')),
            ],
          ),
          // Card Select Seat
          Container(
            margin: EdgeInsets.only(top: 30),
            width: double.infinity,
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(defaultRadius),
            ),
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 24),
            child: Column(children: [
              // Seat Initial
              Row(
                children: [
                  CustomBoxSelectSeat(
                    statusCode: 3,
                    text: 'A',
                  ),
                  CustomBoxSelectSeat(
                    statusCode: 3,
                    text: 'B',
                  ),
                  CustomBoxSelectSeat(
                    statusCode: 3,
                    text: '',
                  ),
                  CustomBoxSelectSeat(
                    statusCode: 3,
                    text: 'C',
                  ),
                  CustomBoxSelectSeat(
                    statusCode: 3,
                    text: 'D',
                  ),
                ],
              ),
              // Seat Number Postion
              Row(
                children: [
                  CustomBoxSelectSeat(
                    statusCode: 2,
                    text: '',
                    idSeat: 'A1',
                  ),
                  CustomBoxSelectSeat(
                    statusCode: 2,
                    text: '',
                    idSeat: 'B1',
                  ),
                  CustomBoxSelectSeat(
                    statusCode: 3,
                    text: '1',
                  ),
                  CustomBoxSelectSeat(
                    statusCode: 0,
                    text: '',
                    idSeat: 'C1',
                  ),
                  CustomBoxSelectSeat(
                    statusCode: 2,
                    text: '',
                    idSeat: 'D1',
                  ),
                ],
              ),
              Row(
                children: [
                  CustomBoxSelectSeat(
                    statusCode: 0,
                    text: '',
                    idSeat: 'A2',
                  ),
                  CustomBoxSelectSeat(
                    statusCode: 0,
                    text: '',
                    idSeat: 'B2',
                  ),
                  CustomBoxSelectSeat(
                    statusCode: 3,
                    text: '2',
                  ),
                  CustomBoxSelectSeat(
                    statusCode: 0,
                    text: '',
                    idSeat: 'C2',
                  ),
                  CustomBoxSelectSeat(
                    statusCode: 2,
                    text: '',
                    idSeat: 'D2',
                  ),
                ],
              ),
              Row(
                children: [
                  CustomBoxSelectSeat(
                    statusCode: 1,
                    text: 'YOU',
                    idSeat: 'A3',
                  ),
                  CustomBoxSelectSeat(
                    statusCode: 1,
                    text: 'YOU',
                    idSeat: 'B3',
                  ),
                  CustomBoxSelectSeat(
                    statusCode: 3,
                    text: '3',
                  ),
                  CustomBoxSelectSeat(
                    statusCode: 0,
                    text: '',
                    idSeat: 'C3',
                  ),
                  CustomBoxSelectSeat(
                    statusCode: 0,
                    text: '',
                  ),
                ],
              ),
              Row(
                children: [
                  CustomBoxSelectSeat(
                    statusCode: 0,
                    text: '',
                    idSeat: 'A4',
                  ),
                  CustomBoxSelectSeat(
                    statusCode: 2,
                    text: '',
                    idSeat: 'B4',
                  ),
                  CustomBoxSelectSeat(
                    statusCode: 3,
                    text: '4',
                  ),
                  CustomBoxSelectSeat(
                    statusCode: 0,
                    text: '',
                    idSeat: 'C4',
                  ),
                  CustomBoxSelectSeat(
                    statusCode: 0,
                    text: '',
                    idSeat: 'D4',
                  ),
                ],
              ),
              Row(
                children: [
                  CustomBoxSelectSeat(
                    statusCode: 0,
                    text: '',
                    idSeat: 'A5',
                  ),
                  CustomBoxSelectSeat(
                    statusCode: 0,
                    text: '',
                    idSeat: 'B5',
                  ),
                  CustomBoxSelectSeat(
                    statusCode: 3,
                    text: '5',
                  ),
                  CustomBoxSelectSeat(
                    statusCode: 2,
                    text: '',
                    idSeat: 'C5',
                  ),
                  CustomBoxSelectSeat(
                    statusCode: 0,
                    text: '',
                    idSeat: 'D5',
                  ),
                ],
              ),
              // Total Price Section
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Your Seat',
                        style: greyTextStyle.copyWith(fontWeight: light),
                      ),
                      Text(
                        'A3, B3',
                        style: blackTextStyle.copyWith(
                            fontWeight: medium, fontSize: 16),
                      ),
                    ]),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: greyTextStyle.copyWith(fontWeight: light),
                      ),
                      Text(
                        'IDR 540.000.000',
                        style: purpleTextStyle.copyWith(
                            fontWeight: semiBold, fontSize: 16),
                      ),
                    ]),
              )
            ]),
          ),
          // Button Continue Section
          CustomButton(
              textButton: Text(
                'Continue to Checkout',
                style:
                    whiteTextStyle.copyWith(fontWeight: medium, fontSize: 18),
              ),
              actionButton: () {
                Navigator.pushNamed(context, '/checkout');
              },
              margin: EdgeInsets.only(top: 30))
        ]),
      )),
    );
  }
}
