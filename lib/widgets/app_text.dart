import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  const AppText({
    Key? key,
    required this.text,
    this.fontColor = Colors.white,
    this.fontSize = 15,
    this.fontWeight = FontWeight.normal,
    this.textOverflow = TextOverflow.visible,
    this.textAlign = TextAlign.start,
    this.fontStyle = FontStyle.normal,
    this.textDecoration = TextDecoration.none,
    this.fontFamily,
    this.maxLines,
    this.decorationThickness,
  }) : super(key: key);

  final String text;
  final Color fontColor;
  final double fontSize;
  final FontWeight fontWeight;
  final TextOverflow textOverflow;
  final TextAlign textAlign;
  final FontStyle fontStyle;
  final int? maxLines;
  final TextDecoration? textDecoration;
  final String? fontFamily;
  final double? decorationThickness;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: textOverflow,
      textAlign: textAlign,
      maxLines: maxLines,
      style: TextStyle(
          color: fontColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
          letterSpacing: -0.32,
          fontStyle: fontStyle,
          decoration: textDecoration,
          decorationThickness: decorationThickness,
          fontFamily: fontFamily),
    );
  }
}
