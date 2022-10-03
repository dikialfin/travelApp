import 'package:airplane/Models/transaction_model.dart';
import 'package:airplane/UI/Widgets/customButton.dart';
import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/cubit/transaction_cubit.dart';
import 'package:flutter/material.dart';
import 'package:airplane/Shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CheckoutPage extends StatelessWidget {
  final TransactionModel transaction;
  const CheckoutPage({Key? key, required this.transaction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget destinationCity() {
      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(defaultRadius),
                  image: DecorationImage(
                      image: NetworkImage(transaction.destination.imageUrl),
                      fit: BoxFit.cover)),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transaction.destination.name,
                    style: blackTextStyle.copyWith(
                        fontWeight: medium, fontSize: 18),
                  ),
                  Text(
                    transaction.destination.city,
                    style:
                        greyTextStyle.copyWith(fontWeight: light, fontSize: 14),
                  )
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 5),
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage('assets/img/icons/icon_star.png'))),
                  ),
                  Text(
                    (transaction.destination.rating).toString(),
                    style: blackTextStyle.copyWith(fontWeight: medium),
                  )
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget detailBooking(
        {required String tittle,
        required String subTittle,
        required TextStyle styleText}) {
      return Container(
        margin: EdgeInsets.only(top: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(children: [
                Container(
                  margin: EdgeInsets.only(right: 6),
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage('assets/img/icons/icon_check.png'))),
                ),
                Text(
                  tittle,
                  style: blackTextStyle.copyWith(fontWeight: regular),
                )
              ]),
            ),
            Text(
              subTittle,
              style: styleText.copyWith(fontWeight: semiBold),
            )
          ],
        ),
      );
    }

    Widget cardDetailBooking() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 24),
        decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(defaultRadius)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // Tujuan destinasi
          destinationCity(),
          // Booking Detail
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              'Booking Details',
              style:
                  blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
            ),
          ),
          detailBooking(
              tittle: 'Traveler',
              subTittle: '${transaction.totalTraveler} person',
              styleText: blackTextStyle),
          detailBooking(
              tittle: 'Seat',
              subTittle: transaction.selectedSeat,
              styleText: blackTextStyle),
          detailBooking(
              tittle: 'Insurance',
              subTittle: transaction.insurance ? 'YES' : 'NO',
              styleText: transaction.insurance ? greenTextStyle : redTextStyle),
          detailBooking(
              tittle: 'Refundable',
              subTittle: transaction.refundable ? 'YES' : 'NO',
              styleText:
                  transaction.refundable ? greenTextStyle : redTextStyle),
          detailBooking(
              tittle: 'VAT',
              subTittle: '${(transaction.vat * 100).toStringAsFixed(0)}%',
              styleText: blackTextStyle),
          detailBooking(
              tittle: 'Price',
              subTittle: NumberFormat.currency(
                      decimalDigits: 0, locale: 'ID', symbol: 'IDR ')
                  .format(transaction.price),
              styleText: blackTextStyle),
          detailBooking(
              tittle: 'Grand Total',
              subTittle: NumberFormat.currency(
                      decimalDigits: 0, locale: 'ID', symbol: 'IDR ')
                  .format(transaction.grandTotal),
              styleText: purpleTextStyle),
        ]),
      );
    }

    Widget cardPaymentDetail() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 24),
              margin: EdgeInsets.only(top: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(defaultRadius),
                  color: whiteColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // card
                  Container(
                    child: Text('Payment Details',
                        style: blackTextStyle.copyWith(
                            fontWeight: semiBold, fontSize: 18)),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 16),
                        width: 100,
                        height: 70,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/img/card.png'))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              width: 24,
                              height: 24,
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
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            NumberFormat.currency(
                                    decimalDigits: 0,
                                    locale: 'ID',
                                    symbol: 'IDR ')
                                .format(state.user.balance),
                            style: blackTextStyle.copyWith(
                                fontWeight: medium, fontSize: 18),
                          ),
                          Text(
                            'Current Balance',
                            style: greyTextStyle.copyWith(
                                fontWeight: light, fontSize: 14),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            );
          }
          return SizedBox();
        },
      );
    }

    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 30),
        child: Column(children: [
          // Image logo destination
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 20, bottom: 15),
              width: 291,
              height: 65,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image:
                          AssetImage('assets/img/logo/logo_destination.png'))),
            ),
          ),
          // City destination
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Keberangkatan
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CGK',
                    style: blackTextStyle.copyWith(
                        fontWeight: semiBold, fontSize: 24),
                  ),
                  Text(
                    'Tangerang',
                    style: greyTextStyle.copyWith(fontWeight: light),
                  ),
                ],
              ),
              // Tujuan
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'CGK',
                    style: blackTextStyle.copyWith(
                        fontWeight: semiBold, fontSize: 24),
                  ),
                  Text(
                    'Tangerang',
                    style: greyTextStyle.copyWith(fontWeight: light),
                  ),
                ],
              )
            ],
          ),
          //  Card detail Booking
          cardDetailBooking(),
          // Card Payment Detail
          cardPaymentDetail(),
          // Button
          BlocConsumer<TransactionCubit, TransactionState>(
            listener: (context, state) {
              if (state is TransactionSuccess) {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/success-page', (route) => false);
              } else if (state is TransactionFailed) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(state.error),
                  backgroundColor: redColor,
                ));
              }
            },
            builder: (context, state) {
              if (state is TransactionLoading) {
                return CircularProgressIndicator();
              }

              return CustomButton(
                  textButton: Text(
                    'Pay Now',
                    style: whiteTextStyle.copyWith(
                        fontWeight: medium, fontSize: 18),
                  ),
                  actionButton: () {
                    context
                        .read<TransactionCubit>()
                        .createTransaction(transaction);
                  },
                  margin: EdgeInsets.only(top: 30));
            },
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'Terms And Conditions',
            style: greyTextStyle.copyWith(
                fontWeight: light,
                fontSize: 16,
                decoration: TextDecoration.underline),
          )
        ]),
      )),
    );
  }
}
