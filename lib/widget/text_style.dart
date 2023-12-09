import 'package:arabic_font/arabic_font.dart';
import 'package:flutter/material.dart';

textStyle(String title, double fontSize, FontWeight fontWeight, Color color,
    BuildContext context, double containerWidth,TextAlign textAlign,
    {required double top, required double bottom, required double left}) {
  return Padding(
    padding: EdgeInsets.only(top: top, bottom: bottom, left: left),
    child: Text(
      title,
      textAlign: TextAlign.center,
      style:  ArabicTextStyle(
        arabicFont: ArabicFont.dinNextLTArabic,
        
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
    ),
  );
}



headText(String head, double fontSize, Color color) {
  return Padding(
    padding: const EdgeInsets.only(right: 10),
    child: Text(
      head,
      style:  ArabicTextStyle(
        arabicFont: ArabicFont.dinNextLTArabic,
          fontSize: fontSize,
          color: color,
          fontWeight: FontWeight.bold),
    ),
  );
}

titleStyle(
  String title,
  double top,
  double bottom,
) {
  return Padding(
    padding: EdgeInsets.only(top: top, bottom: bottom),
    child: Text(
      title,
      style: const  ArabicTextStyle(
        arabicFont: ArabicFont.dinNextLTArabic,
      
        color: Color(0xff403939),
        fontWeight: FontWeight.bold,
        fontSize: 27,
      ),
    ),
  );
}
