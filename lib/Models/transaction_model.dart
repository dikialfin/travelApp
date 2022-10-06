import 'package:airplane/Models/destination_model.dart';
import 'package:equatable/equatable.dart';

class TransactionModel extends Equatable {
  final String id;
  final DestinationModel destination;
  final int totalTraveler;
  final String selectedSeat;
  final bool insurance;
  final bool refundable;
  final double vat;
  final int price;
  final int grandTotal;

  TransactionModel(
      {required this.destination,
      this.id = '',
      this.totalTraveler = 0,
      this.selectedSeat = '',
      this.insurance = false,
      this.refundable = false,
      this.vat = 0,
      this.price = 0,
      this.grandTotal = 0});

  factory TransactionModel.fromJson(String id, Map<String, dynamic> json) =>
      TransactionModel(
          destination: DestinationModel.fromJson(
              json['destination']['id'], json['destination']),
          id: id,
          totalTraveler: json['amountOfTraveler'],
          selectedSeat: json['selectedSeat'],
          insurance: json['insurance'],
          refundable: json['refundable'],
          vat: json['vat'],
          price: json['price'],
          grandTotal: json['grandTotal']);

  @override
  // TODO: implement props
  List<Object?> get props => [
        destination,
        totalTraveler,
        selectedSeat,
        insurance,
        refundable,
        vat,
        price,
        grandTotal
      ];
}
