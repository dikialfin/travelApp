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

  // methode untuk mengambil data user berdasarkan id nya
  Future<UserModel> getUserById(String id) async {
    try {
      DocumentSnapshot userData = await _userReference.doc(id).get();
      return UserModel(
          id: id,
          email: userData['email'],
          name: userData['name'],
          balance: userData['balance'],
          hobby: userData['hobby']);
    } catch (e) {
      throw e;
    }
  }
}
