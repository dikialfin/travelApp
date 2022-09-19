import 'package:airplane/UI/Widgets/customButton.dart';
import 'package:flutter/material.dart';
import 'package:airplane/Shared/theme.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

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
                      image: AssetImage('assets/img/contents/destination1.png'),
                      fit: BoxFit.cover)),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Lake Ciliwung',
                    style: blackTextStyle.copyWith(
                        fontWeight: medium, fontSize: 18),
                  ),
                  Text(
                    'Tangerang',
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
                    '4.8',
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
              subTittle: '2 person',
              styleText: blackTextStyle),
          detailBooking(
              tittle: 'Seat', subTittle: 'A3, B3', styleText: blackTextStyle),
          detailBooking(
              tittle: 'Insurance', subTittle: 'YES', styleText: greenTextStyle),
          detailBooking(
              tittle: 'Refundable', subTittle: 'NO', styleText: redTextStyle),
          detailBooking(
              tittle: 'VAT', subTittle: '45%', styleText: blackTextStyle),
          detailBooking(
              tittle: 'Price',
              subTittle: 'IDR 8.500.690',
              styleText: blackTextStyle),
          detailBooking(
              tittle: 'Grand Total',
              subTittle: 'IDR 12.000.000',
              styleText: purpleTextStyle),
        ]),
      );
    }

    Widget cardPaymentDetail() {
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
                      'IDR 80.400.000',
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
          CustomButton(
              textButton: Text(
                'Pay Now',
                style:
                    whiteTextStyle.copyWith(fontWeight: medium, fontSize: 18),
              ),
              actionButton: () {
                Navigator.pushNamed(context, '/success-page');
              },
              margin: EdgeInsets.only(top: 30)),
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
