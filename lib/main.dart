import 'package:airplane/UI/Pages/bonus_page.dart';
import 'package:airplane/UI/Pages/chekcout_page.dart';
import 'package:airplane/UI/Pages/get_started_page.dart';
import 'package:airplane/UI/Pages/home_page.dart';
import 'package:airplane/UI/Pages/select_seat.dart';
import 'package:airplane/UI/Pages/signin_page.dart';
import 'package:airplane/UI/Pages/signup_page.dart';
import 'package:airplane/UI/Pages/successBooking_page.dart';
import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/cubit/destination_cubit.dart';
import 'package:airplane/cubit/page_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'UI/Pages/splash_page.dart';

// void main() => runApp(MyApp());

void main() async {
  // kode ini berasal dari dokumentasi cloud_firestore
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // TANPA MENGGUNAKAN ROUTES
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     home: SplashPage(),
  //   );
  // }

  // DENGAN MENGGUNAKAN ROUTES
  // ini berguna ketika di aplikasi kita tedapat banyak routes
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PageCubit()),
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => DestinationCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/get-started': (context) => GetStartedPage(),
          '/signup': (context) => SignUpPage(),
          '/signin': (context) => SignInPage(),
          '/bonus-page': (context) => BonusPage(),
          '/home-page': (context) => HomePage(),
          '/select-seat': (context) => SelectSeat(),
          '/checkout': (context) => CheckoutPage(),
          '/success-page': (context) => SuccessBookingPage()
        },
      ),
    );
  }
}
