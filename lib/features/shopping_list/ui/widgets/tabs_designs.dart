import 'package:arabic_font/arabic_font.dart';
import 'package:flutter/material.dart';

tabDesign(String title, IconData icon) {
    return Column(
      children: [
        Icon(
          icon,
          color: const Color(0xffEFCB0F),
          size: 40,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          title,
          style: const ArabicTextStyle(
            arabicFont: ArabicFont.dinNextLTArabic,
            color: Colors.black38,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ],
    );
  }