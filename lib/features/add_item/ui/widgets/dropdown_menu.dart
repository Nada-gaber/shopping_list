import 'package:arabic_font/arabic_font.dart';
import 'package:flutter/material.dart';

class DropDownMenu extends StatefulWidget {
    final TextEditingController type;

 const DropDownMenu({Key? key, required this.type}) : super(key: key);

  @override
  State<DropDownMenu> createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
  String? selectedType;
  List<String> itemsTypes = [
    'kilo',
    'gram',
    'bag',
    'litre',
    'box',
    'Package',
    'can',
  ]; @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: DropdownButtonFormField<String>(
        value: selectedType,
        items: itemsTypes.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (newValue) {
          setState(() {
            selectedType = newValue;
            widget.type.text = newValue!;
          });
        },
        decoration: const InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            fillColor: Colors.white,
            filled: true,
            labelText: 'Type',
            hintStyle: ArabicTextStyle(
              arabicFont: ArabicFont.dinNextLTArabic,
              color: Colors.grey,
              fontSize: 21,
            ),
            labelStyle: ArabicTextStyle(
              arabicFont: ArabicFont.dinNextLTArabic,
              color: Colors.black54,
              fontWeight: FontWeight.bold,
              fontSize: 27,
            ),
            hintText: 'Kilogram',
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.amber, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(10)))),
      ),
    );
  }
}