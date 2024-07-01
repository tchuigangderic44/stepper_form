import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String text;
  final double size;
  final Color? color;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;
  final bool? multiLines;
  final TextAlign? textAlign;
  final TextDecoration? decoration;

  const MyText({
    super.key,
    this.color = const Color(0xFF414141), 
    required this.text,
    required this.size,
    this.fontWeight,
    this.multiLines = false,
    this.overflow = TextOverflow.ellipsis, 
    this.textAlign = TextAlign.start,
    this.decoration
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: multiLines! ? 10 : 1,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontFamily: 'poppins',
        fontSize: size,
        fontWeight: fontWeight ?? FontWeight.normal,
        decoration: decoration
      ),
    );
  }
}