import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StaticValues {
  static final AppColors colors = Get.find();
}

class AppColors {
  final primaryColor = const  Color(0xFF003654);
  final primaryColor100 = const  Color(0xFFCCD7DD);
  final secondaryColor = const Color(0xFFF7E401);
  final inactiveColor = const Color(0xFFB8B8B8);
  final thirdColor = const Color(0xFFFFC5A3);
  final textColor = const Color(0xFF414141);
  final secondTextColor = const Color(0xFF5A5A5A);
  final inactiveTextColor = const Color(0xFFA0A0A0);
}