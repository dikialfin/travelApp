import 'package:equatable/equatable.dart';

class DestinationModel extends Equatable {
  // membuat property sesuai dengan field yang ada pada database destination
  final String id;
  final String city;
  final String imageUrl;
  final String name;
  final int price;
  final double rating;

  DestinationModel(
      {required this.id,
      this.city = '',
      this.imageUrl = '',
      this.name = '',
      this.price = 0,
      this.rating = 0.0});

  factory DestinationModel.fromJson(String id, Map<String, dynamic> json) =>
      DestinationModel(
          id: id,
          city: json['city'],
          imageUrl: json['imageUrl'],
          name: json['name'],
          price: json['price'],
          rating: json['rating']);

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, city, imageUrl, rating, price];
}
