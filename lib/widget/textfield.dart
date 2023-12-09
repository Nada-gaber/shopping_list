import 'package:arabic_font/arabic_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

textfieldClassic(
  TextEditingController controller,
  String lable,
  String hint,
) {
  return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
    child: TextField(
      controller: controller,
      autofocus: false,
      maxLength: 10,
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          fillColor: Colors.white,
          filled: true,
          labelText: lable,
          hintStyle: const  ArabicTextStyle(
        arabicFont: ArabicFont.dinNextLTArabic,
            color: Colors.grey,
            fontSize: 21,
          ),
          labelStyle: const  ArabicTextStyle(
        arabicFont: ArabicFont.dinNextLTArabic,
            color: Colors.black54,
            fontWeight: FontWeight.bold,
            fontSize: 27,
          ),
          hintText: hint,
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.amber,width: 2),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey,width: 2),
              borderRadius: BorderRadius.all(Radius.circular(10)))),
    ),
  );
}



digitalTextField(
  String lable,
  String hint,
  TextEditingController controller,
) {
  return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
    child: TextField(
      autofocus: false,
      maxLength: 4,
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          fillColor: Colors.white,
          filled: true,
          labelText: lable,
          hintStyle: const  ArabicTextStyle(
        arabicFont: ArabicFont.dinNextLTArabic,
            color: Colors.grey,
            fontSize: 21,
          ),
          labelStyle: const  ArabicTextStyle(
        arabicFont: ArabicFont.dinNextLTArabic,
            color: Colors.black54,
            fontWeight: FontWeight.bold,
            fontSize: 27,
          ),
          hintText: hint,
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.amber, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          enabledBorder:const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(10))),),
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
      ],
      controller: controller,
    ),
  );
}
