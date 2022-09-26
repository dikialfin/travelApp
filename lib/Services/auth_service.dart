import 'package:airplane/Models/user_model.dart';
import 'package:airplane/Services/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserModel> SignUp(
      {required String email,
      required String password,
      required String name,
      String hobby = ''}) async {
    try {
      // membuat user ke firebase auth
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      // membuat user ke firebase database
      UserModel user = UserModel(
          id: userCredential.user!.uid,
          email: email,
          name: name,
          hobby: hobby,
          balance: 280000000);

      await UserService().setUser(user);

      // jika semua proses insert nya selesai baru kita return user nya
      return user;
    } catch (e) {
      throw e;
    }
  }

  Future<UserModel> siginIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      UserModel userData =
          await UserService().getUserById(userCredential.user!.uid);
      return userData;
    } catch (e) {
      throw e;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw e;
    }
  }
}
