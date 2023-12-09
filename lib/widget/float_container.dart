import 'package:arabic_font/arabic_font.dart';
import 'package:flutter/material.dart';

floatedContainer(
  String title,
  String details,
  String price,
  BuildContext context,
  String spent,
) {
  return Container(
    decoration: BoxDecoration(
        color: const Color.fromARGB(255, 158, 158, 158),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Text(
              title,
              style: const  ArabicTextStyle(
        arabicFont: ArabicFont.dinNextLTArabic,
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 15,
              ),
            ),
            Text(
              details,
              style: const  ArabicTextStyle(
        arabicFont: ArabicFont.dinNextLTArabic,
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 20,
              ),
            ),
          ],
        ),
        const VerticalDivider(
            color: Colors.black,
            thickness: 3,
            indent: 20,
            endIndent: 0,
            width: 20),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                spent,
                style: const  ArabicTextStyle(
        arabicFont: ArabicFont.dinNextLTArabic,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                price,
                style: const  ArabicTextStyle(
        arabicFont: ArabicFont.dinNextLTArabic,
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}