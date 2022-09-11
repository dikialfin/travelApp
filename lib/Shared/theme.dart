/* File ini di gunakan untuk menyimpan variable yang berisikan warna, fontstyle, dll. sehingga dapat di gunakan berulang kali */

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// 0x => artinya kita ingin menggunakan hex color
//ff => opacity warna 100%
Color primaryColor = Color(0xff5C40CC);
Color blackColor = Color(0xff1F1449);
Color whiteColor = Color(0xffFFFFFF);
Color greyColor = Color(0xff9698A9);
Color greenColor = Color(0xff0EC3AE);
Color redColor = Color(0xffEB70A5);
Color bgColor = Color(0xffFAFAFA);
Color colorTransparent = Colors.transparent;

TextStyle blackTextStyle = GoogleFonts.poppins(color: blackColor);
TextStyle whiteTextStyle = GoogleFonts.poppins(color: whiteColor);
TextStyle greyTextStyle = GoogleFonts.poppins(color: greyColor);
TextStyle greenTextStyle = GoogleFonts.poppins(color: greenColor);
TextStyle redTextStyle = GoogleFonts.poppins(color: redColor);
TextStyle purpleTextStyle = GoogleFonts.poppins(color: primaryColor);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w300;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
FontWeight black = FontWeight.w900;

double defaultMargin = 24.0;
double defaultRadius = 17.0;
