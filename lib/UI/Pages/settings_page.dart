import 'package:airplane/Shared/theme.dart';
import 'package:airplane/UI/Widgets/customButton.dart';
import 'package:airplane/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthInitial) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/signin', (route) => false);
            } else if (state is AuthFailed) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.error),
                backgroundColor: redColor,
              ));
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return CircularProgressIndicator();
            } else {
              return CustomButton(
                  textButton: Text(
                    'Logout',
                    style: whiteTextStyle,
                  ),
                  actionButton: () {
                    context.read<AuthCubit>().signOut();
                  },
                  margin: EdgeInsets.all(0),
                  width: 220);
            }
          },
        ),
      ),
    );
  }
}
