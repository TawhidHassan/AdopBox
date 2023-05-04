//==============custom text styles================
//------------------------------------------------

import 'dart:io';

import 'package:flutter/material.dart';

import '../Constants/Colors/app_colors.dart';

TextStyle regularText(double size, {Color color = textColor}) => TextStyle(
  fontSize: size,
  color: color,
  fontWeight: FontWeight.w400,
);

TextStyle mediumText(double size, {Color color = textColor}) => TextStyle(
  fontSize: size,
  color: color,
  fontWeight: FontWeight.w500,
);

TextStyle semiBoldText(double size, {Color color = textColor}) => TextStyle(
  fontSize: size,
  color: color,
  fontWeight: Platform.isIOS?FontWeight.w500:FontWeight.w600,
);

TextStyle boldText(double size, {Color color = textColor}) => TextStyle(
  fontSize: size,
  color: color,
  fontWeight: FontWeight.w700,
);

TextStyle extraBoldText(double size, {Color color = textColor}) => TextStyle(
  fontSize: size,
  color: color,
  fontWeight: FontWeight.w900,
);