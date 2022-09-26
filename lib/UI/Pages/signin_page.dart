import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/cubit/page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:airplane/Shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Widgets/customButton.dart';
import '../Widgets/customTextFormField.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    Widget titleWidget() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Text(
          'Signin and get \n your next journey',
          style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 24),
        ),
      );
    }

    Widget inputSection() {
      Widget email() {
        return CustomTextFormField(
          hintText: 'email',
          tittle: 'Email',
          controller: emailController,
        );
      }

      Widget password() {
        return CustomTextFormField(
          hintText: 'Your password',
          tittle: 'Password',
          hiddenText: true,
          controller: passwordController,
        );
      }

      Widget submitButton() {
        // bukus customButton nya dengan bloc consumer supaya kita bisa listen dan build
        return BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            // apakah auth nya sukses atau tidak
            if (state is AuthSuccess) {
              context.read<PageCubit>().setPage(0);
              Navigator.pushNamedAndRemoveUntil(
                  context, '/home-page', (route) => false);
            } else if (state is AuthFailed) {
              // build sebuah snackbar
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.error),
                backgroundColor: redColor,
              ));
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return CustomButton(
                textButton: Text(
                  'Signin',
                  style:
                      whiteTextStyle.copyWith(fontWeight: medium, fontSize: 18),
                ),
                actionButton: () {
                  context
                      .read<AuthCubit>()
                      .signIn(emailController.text, passwordController.text);
                },
                margin: EdgeInsets.only(top: 30.0));
          },
        );
      }

      return Container(
        margin: EdgeInsets.only(top: 30.0),
        padding:
            EdgeInsets.symmetric(vertical: 30.0, horizontal: defaultMargin),
        decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(defaultRadius)),
        child: Column(children: [
          email(),
          password(),
          submitButton(),
        ]),
      );
    }

    Widget termsAndConditionBtn() {
      return Container(
        margin: EdgeInsets.only(top: 50),
        child: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/signup');
            },
            child: Text(
              'Dont have account? register Now',
              style: greyTextStyle.copyWith(
                  fontWeight: light,
                  fontSize: 16,
                  decoration: TextDecoration.underline),
            )),
      );
    }

    return Scaffold(
      backgroundColor: bgColor,
      body: ListView(
        padding:
            EdgeInsets.symmetric(vertical: 30.0, horizontal: defaultMargin),
        children: [titleWidget(), inputSection(), termsAndConditionBtn()],
      ),
    );
  }
}
