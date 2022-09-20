import 'package:airplane/UI/Widgets/customButton.dart';
import 'package:airplane/UI/Widgets/customTextFormField.dart';
import 'package:flutter/material.dart';
import '../../Shared/theme.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  // text editing controller untuk setiap form nya
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  TextEditingController hobbyController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    Widget titleWidget() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Text(
          'Join us and get \n your next journey',
          style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 24),
        ),
      );
    }

    Widget inputSection() {
      Widget fullName() {
        return CustomTextFormField(
          hintText: 'Your name',
          tittle: 'Full name',
          controller: nameController,
        );

        // KODE SEBELUM MEMBUAT CUSTOM WIDGET
        // return Container(
        //   margin: EdgeInsets.only(bottom: 20),
        //   child:
        //       Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        //     Text(
        //       'Full Name',
        //       style: blackTextStyle.copyWith(fontWeight: regular, fontSize: 14),
        //     ),
        //     SizedBox(
        //       height: 6,
        //     ),
        //     TextFormField(
        //       decoration: InputDecoration(
        //           hintText: 'Your name',
        //           border: OutlineInputBorder(
        //               borderRadius: BorderRadius.circular(defaultRadius)),
        //           focusedBorder: OutlineInputBorder(
        //               borderRadius: BorderRadius.circular(defaultRadius),
        //               borderSide: BorderSide(color: primaryColor))),
        //     )
        //   ]),
        // );
      }

      Widget emailAddress() {
        return CustomTextFormField(
          hintText: 'Your email address',
          tittle: 'Email Address',
          controller: emailController,
        );

        // KODE SEBELUM MEMBUAT CUSTOM WIDGET
        // return Container(
        //   margin: EdgeInsets.only(bottom: 20),
        //   child:
        //       Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        //     Text(
        //       'Email Address',
        //       style: blackTextStyle.copyWith(fontWeight: regular, fontSize: 14),
        //     ),
        //     SizedBox(
        //       height: 6,
        //     ),
        //     TextFormField(
        //       decoration: InputDecoration(
        //           hintText: 'Your email address',
        //           border: OutlineInputBorder(
        //               borderRadius: BorderRadius.circular(defaultRadius)),
        //           focusedBorder: OutlineInputBorder(
        //               borderRadius: BorderRadius.circular(defaultRadius),
        //               borderSide: BorderSide(color: primaryColor))),
        //     )
        //   ]),
        // );
      }

      Widget password() {
        return CustomTextFormField(
          hintText: 'Your password',
          tittle: 'Password',
          hiddenText: true,
          controller: passwordController,
        );

        // KODE SEBELUM MEMBUAT CUSTOM WIDGET
        // return Container(
        //   margin: EdgeInsets.only(bottom: 20),
        //   child:
        //       Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        //     Text(
        //       'Password',
        //       style: blackTextStyle.copyWith(fontWeight: regular, fontSize: 14),
        //     ),
        //     SizedBox(
        //       height: 6,
        //     ),
        //     TextFormField(
        //       obscureText: true,
        //       decoration: InputDecoration(
        //           hintText: 'Your password',
        //           border: OutlineInputBorder(
        //               borderRadius: BorderRadius.circular(defaultRadius)),
        //           focusedBorder: OutlineInputBorder(
        //               borderRadius: BorderRadius.circular(defaultRadius),
        //               borderSide: BorderSide(color: primaryColor))),
        //     )
        //   ]),
        // );
      }

      Widget hobby() {
        return CustomTextFormField(
          hintText: 'Your hobby',
          tittle: 'Hobby',
          controller: hobbyController,
        );

        // KODE SEBELUM MEMBUAT CUSTOM WIDGET
        // return Container(
        //   margin: EdgeInsets.only(bottom: 20),
        //   child:
        //       Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        //     Text(
        //       'Hobby',
        //       style: blackTextStyle.copyWith(fontWeight: regular, fontSize: 14),
        //     ),
        //     SizedBox(
        //       height: 6,
        //     ),
        //     TextFormField(
        //       decoration: InputDecoration(
        //           hintText: 'Your hobby',
        //           border: OutlineInputBorder(
        //               borderRadius: BorderRadius.circular(defaultRadius)),
        //           focusedBorder: OutlineInputBorder(
        //               borderRadius: BorderRadius.circular(defaultRadius),
        //               borderSide: BorderSide(color: primaryColor))),
        //     )
        //   ]),
        // );
      }

      Widget submitButton() {
        return CustomButton(
            textButton: Text(
              'Get Started',
              style: whiteTextStyle.copyWith(fontWeight: medium, fontSize: 18),
            ),
            actionButton: () {
              Navigator.pushNamed(context, '/bonus-page');
            },
            margin: EdgeInsets.only(top: 30.0));
      }

      // KODE SEBELUM MEMBUAT CUSTOM WIDGET
      // Widget submitButton() {
      //   return Container(
      //     width: double.infinity,
      //     height: 55,
      //     margin: EdgeInsets.only(top: 30.0),
      //     child: TextButton(
      //         onPressed: () {
      //           Navigator.pushNamed(context, '/bonus-page');
      //         },
      //         child: Text(
      //           'Get Started',
      //           style:
      //               whiteTextStyle.copyWith(fontWeight: medium, fontSize: 18),
      //         ),
      //         style: TextButton.styleFrom(
      //             backgroundColor: primaryColor,
      //             shape: RoundedRectangleBorder(
      //                 borderRadius: BorderRadius.circular(defaultRadius)))),
      //   );
      // }

      return Container(
        margin: EdgeInsets.only(top: 30.0),
        padding:
            EdgeInsets.symmetric(vertical: 30.0, horizontal: defaultMargin),
        decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(defaultRadius)),
        child: Column(children: [
          fullName(),
          emailAddress(),
          password(),
          hobby(),
          submitButton(),
        ]),
      );
    }

    Widget termsAndConditionBtn() {
      return Container(
        margin: EdgeInsets.only(top: 50),
        child: TextButton(
            onPressed: () {},
            child: Text(
              'Terms And Condition',
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
