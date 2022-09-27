import 'package:airplane/Models/destination_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class DestinationService {
  CollectionReference _destinationReff =
      FirebaseFirestore.instance.collection('destinations');

  // method ini di gunakan untuk mengambil data dari firestore database
  Future<List<DestinationModel>> fetchDestinations() async {
    try {
      QuerySnapshot resultData = await _destinationReff.get();
      List<DestinationModel> destinations = resultData.docs.map((e) {
        return DestinationModel.fromJson(
            e.id, e.data() as Map<String, dynamic>);
      }).toList();
      print(destinations);
      return destinations;
    } catch (e) {
      throw e;
    }
  }
}
