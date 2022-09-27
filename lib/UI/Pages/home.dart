import 'package:airplane/UI/Pages/detail_page.dart';
import 'package:airplane/UI/Pages/settings_page.dart';
import 'package:airplane/UI/Pages/transaction_page.dart';
import 'package:airplane/UI/Pages/wallet_page.dart';
import 'package:airplane/UI/Widgets/customCard.dart';
import 'package:airplane/UI/Widgets/customTile.dart';
import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/cubit/destination_cubit.dart';
import 'package:flutter/material.dart';
import 'package:airplane/Shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Models/destination_model.dart';

class Home extends StatefulWidget {
  final int currentIndex;
  const Home({Key? key, required this.currentIndex}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // fetching data ketika halaman pertama kali di buka
  @override
  void initState() {
    context.read<DestinationCubit>().fetchDestinations();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              padding:
                  EdgeInsets.symmetric(vertical: 30, horizontal: defaultMargin),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Howdy,\n${state.user.name}',
                            style: blackTextStyle.copyWith(
                                fontWeight: semiBold, fontSize: 24)),
                        Text(
                          'Where to fly today?',
                          style: greyTextStyle.copyWith(
                              fontWeight: light, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/img/img_profile.png')),
                        shape: BoxShape.circle),
                  )
                ],
              ),
            );
          } else {
            return SizedBox();
          }
        },
      );
    }

    Widget popularDestination(List<DestinationModel> destinations) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: destinations.map((DestinationModel destination) {
            return CustomCard(
                destinations: destination,
                action: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DetailPage()));
                });
          }).toList(),
        ),
      );
    }

    Widget newDestination() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        margin: EdgeInsets.only(top: 30, bottom: 120),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'New This Year',
            style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 18),
          ),
          CustomTile(
            urlImg: 'assets/img/contents/destination6.png',
            tittleTile: 'Danau Beratan',
            cityTile: 'Singajara',
            rating: 4.5,
          ),
          CustomTile(
            urlImg: 'assets/img/contents/destination7.png',
            tittleTile: 'Sydney Opera',
            cityTile: 'Australia',
            rating: 4.7,
          ),
          CustomTile(
            urlImg: 'assets/img/contents/destination8.png',
            tittleTile: 'Roma',
            cityTile: 'Italy',
            rating: 4.8,
          ),
          CustomTile(
            urlImg: 'assets/img/contents/destination9.png',
            tittleTile: 'Payung Teduh',
            cityTile: 'Singapore',
            rating: 4.5,
          ),
        ]),
      );
    }

    // pengkondisian untuk route page nya
    // switch (currentIndex) {
    //   case 0:
    //     return ListView(
    //       children: [header(), popularDestination(), newDestination()],
    //     );
    //   case 1:
    //     return TransactionPage();
    //   case 2:
    //     return WalletPage();
    //   case 3:
    //     return SettingsPage();
    //   default:
    //     return ListView(
    //       children: [header(), popularDestination(), newDestination()],
    //     );
    // }
    switch (widget.currentIndex) {
      case 1:
        return TransactionPage();
      case 2:
        return WalletPage();
      case 3:
        return SettingsPage();
      case 0:
      default:
        return BlocConsumer<DestinationCubit, DestinationState>(
          listener: (context, state) {
            if (state is DestinationFailed) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.error),
                backgroundColor: redColor,
              ));
            }
          },
          builder: (context, state) {
            if (state is DestinationSuccess) {
              return ListView(
                children: [
                  header(),
                  popularDestination(state.destination),
                  newDestination()
                ],
              );
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          },
        );
    }
  }
}
