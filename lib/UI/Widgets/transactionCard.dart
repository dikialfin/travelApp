import 'package:airplane/Models/transaction_model.dart';
import 'package:airplane/Shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel transaction;
  const TransactionCard(this.transaction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 24),
      decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(defaultRadius)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // Booking Detail
        Container(
          margin: EdgeInsets.only(top: 20),
          child: Text(
            'Booking Details',
            style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
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
            styleText: transaction.refundable ? greenTextStyle : redTextStyle),
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
}
