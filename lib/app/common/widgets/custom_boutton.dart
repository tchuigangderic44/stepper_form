import 'package:flutter/material.dart';
import 'package:stepper_form/app/common/utils/helper.dart';

import '../utils/static_values.dart';
import 'custom_text.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    required this.title, 
    required this.onTap,
    this.titleColor, 
    this.btnColor, 
    this.strokeColor,
    this.width,
    this.height,
    super.key, 
  });
  final VoidCallback onTap;
  final String title;
  final double? width, height;
  final Color? titleColor, strokeColor, btnColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? deviceSize.width,
        height: height ?? 50.hp,
        padding: EdgeInsets.symmetric(vertical: 15.vp, horizontal: 10.hp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: btnColor ?? StaticValues.colors.primaryColor,
          border: Border.all(
            color: strokeColor ?? Colors.transparent,
            width: 1.0
          )
        ),
        child: Center(child: MyText(
          text: title, 
          size: 16, 
          fontWeight: FontWeight.w500,
          color: titleColor ?? Colors.white,
          ),
        ),
      ),
    );
  }
}
class MySecondButton extends StatelessWidget {
  const MySecondButton({
    required this.title, 
    required this.onTap,
    this.titleColor, 
    this.btnColor, 
    this.strokeColor,
    this.width,
    this.height,
    super.key, 
  });
  final VoidCallback onTap;
  final Widget title;
  final double? width, height;
  final Color? titleColor, strokeColor, btnColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? deviceSize.width,
        height: height ?? 50.hp,
        padding: EdgeInsets.symmetric(vertical: 15.vp, horizontal: 10.hp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: btnColor ?? StaticValues.colors.primaryColor,
          border: Border.all(
            color: strokeColor ?? Colors.transparent,
            width: 1.0
          )
        ),
        child: title
      ),
    );
  }
}