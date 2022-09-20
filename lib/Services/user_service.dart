import 'package:airplane/Models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  // jangan lupa tambahkan collection users juga ke console di database firebase nya
  // hapus juga isi collection bawaan nya
  CollectionReference _userReference =
      FirebaseFirestore.instance.collection('users');

  // method untuk melakukan insert ke firebase database nya
  Future<void> setUser(UserModel user) async {
    try {
      _userReference.doc(user.id).set({
        'email': user.email,
        'name': user.name,
        'hobby': user.hobby,
        'balance': user.balance
      });
    } catch (e) {
      throw e;
    }
  }
}
