import 'dart:async';

import 'package:airplane/UI/Pages/get_started_page.dart';
import 'package:airplane/cubit/auth_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../Shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 5), () {
      // Routing Page :
      // Cara Ke 1
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => GetStartedPage()));

      // CARA KE 2
      // Navigator.pushNamed(context, '/get-started');

      // Course : 41 Splash Screen
      /* 
      pada course ini membahas ketika kita berhasil register dan masuk ke halaman hompage
      ktika aplikasi di restart dia akan kembali ke halaman get started harus nya tetap berada di hompage
      */
      // kita beri pengkondisian jika firebase auth nya memiliki user yang aktif
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        Navigator.pushNamedAndRemoveUntil(
            context, '/get-started', (route) => false);
      } else {
        context.read<AuthCubit>().getCurrentUser(user.uid);
        Navigator.pushNamedAndRemoveUntil(
            context, '/home-page', (route) => false);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            margin: EdgeInsets.only(bottom: 50.0),
            height: 100.0,
            width: 100.0,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/img/logo/logo_airplane.png'))),
          ),
          Text(
            'AIRPLANE',
            style: whiteTextStyle.copyWith(
                fontWeight: medium, letterSpacing: 10.0, fontSize: 32.0),
          ),
        ]),
      ),
    );
  }
}
