import 'package:airplane/Models/destination_model.dart';
import 'package:airplane/UI/Widgets/customBoxSelectSeat.dart';
import 'package:airplane/UI/Widgets/customButton.dart';
import 'package:airplane/cubit/seat_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:airplane/Shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class SelectSeat extends StatelessWidget {
  final DestinationModel destination;
  const SelectSeat({Key? key, required this.destination}) : super(key: key);

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
          BlocBuilder<SeatCubitCubit, List<String>>(builder: (context, state) {
            return Container(
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
                    Container(
                        margin: EdgeInsets.only(right: 10, top: 10),
                        height: 48,
                        width: 48,
                        child: Center(
                          child: Text('A'),
                        )),
                    Container(
                        margin: EdgeInsets.only(right: 10, top: 10),
                        height: 48,
                        width: 48,
                        child: Center(
                          child: Text('B'),
                        )),
                    Container(
                        margin: EdgeInsets.only(right: 10, top: 10),
                        height: 48,
                        width: 48,
                        child: Center(
                          child: Text(''),
                        )),
                    Container(
                        margin: EdgeInsets.only(right: 10, top: 10),
                        height: 48,
                        width: 48,
                        child: Center(
                          child: Text('C'),
                        )),
                    Container(
                        margin: EdgeInsets.only(right: 10, top: 10),
                        height: 48,
                        width: 48,
                        child: Center(
                          child: Text('D'),
                        )),
                  ],
                ),
                // Seat Number Postion
                Row(
                  children: [
                    CustomBoxSelectSeat(
                      idSeat: 'A1',
                      isAvailable: true,
                    ),
                    CustomBoxSelectSeat(
                      idSeat: 'B1',
                      isAvailable: false,
                    ),
                    Container(
                        margin: EdgeInsets.only(right: 10, top: 10),
                        height: 48,
                        width: 48,
                        child: Center(
                          child: Text('1'),
                        )),
                    CustomBoxSelectSeat(
                      idSeat: 'C1',
                      isAvailable: false,
                    ),
                    CustomBoxSelectSeat(
                      idSeat: 'D1',
                      isAvailable: false,
                    ),
                  ],
                ),
                Row(
                  children: [
                    CustomBoxSelectSeat(
                      idSeat: 'A2',
                      isAvailable: false,
                    ),
                    CustomBoxSelectSeat(
                      idSeat: 'B2',
                      isAvailable: true,
                    ),
                    Container(
                        margin: EdgeInsets.only(right: 10, top: 10),
                        height: 48,
                        width: 48,
                        child: Center(
                          child: Text('2'),
                        )),
                    CustomBoxSelectSeat(
                      idSeat: 'C2',
                      isAvailable: false,
                    ),
                    CustomBoxSelectSeat(
                      idSeat: 'D2',
                      isAvailable: false,
                    ),
                  ],
                ),
                Row(
                  children: [
                    CustomBoxSelectSeat(
                      idSeat: 'A3',
                      isAvailable: false,
                    ),
                    CustomBoxSelectSeat(
                      idSeat: 'B3',
                      isAvailable: false,
                    ),
                    Container(
                        margin: EdgeInsets.only(right: 10, top: 10),
                        height: 48,
                        width: 48,
                        child: Center(
                          child: Text('3'),
                        )),
                    CustomBoxSelectSeat(
                      idSeat: 'C3',
                      isAvailable: true,
                    ),
                    CustomBoxSelectSeat(
                      idSeat: 'D3',
                      isAvailable: false,
                    ),
                  ],
                ),
                Row(
                  children: [
                    CustomBoxSelectSeat(
                      idSeat: 'A4',
                      isAvailable: false,
                    ),
                    CustomBoxSelectSeat(
                      idSeat: 'B4',
                      isAvailable: false,
                    ),
                    Container(
                        margin: EdgeInsets.only(right: 10, top: 10),
                        height: 48,
                        width: 48,
                        child: Center(
                          child: Text('4'),
                        )),
                    CustomBoxSelectSeat(
                      idSeat: 'C4',
                      isAvailable: false,
                    ),
                    CustomBoxSelectSeat(
                      idSeat: 'D4',
                      isAvailable: true,
                    ),
                  ],
                ),
                Row(
                  children: [
                    CustomBoxSelectSeat(
                      idSeat: 'A5',
                      isAvailable: false,
                    ),
                    CustomBoxSelectSeat(
                      idSeat: 'B5',
                      isAvailable: false,
                    ),
                    Container(
                        margin: EdgeInsets.only(right: 10, top: 10),
                        height: 48,
                        width: 48,
                        child: Center(
                          child: Text('5'),
                        )),
                    CustomBoxSelectSeat(
                      idSeat: 'C5',
                      isAvailable: true,
                    ),
                    CustomBoxSelectSeat(
                      idSeat: 'D5',
                      isAvailable: false,
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
                          state.join(', '),
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
                          NumberFormat.currency(
                                  decimalDigits: 0,
                                  locale: 'ID',
                                  symbol: 'IDR ')
                              .format(state.length * destination.price),
                          style: purpleTextStyle.copyWith(
                              fontWeight: semiBold, fontSize: 16),
                        ),
                      ]),
                )
              ]),
            );
          }),
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
