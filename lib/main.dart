import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopping_list/shoppinglist.dart';

void main() {
  runApp(const ShoppingListApp());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
    statusBarColor: Color(0xFFF6F6F6),
  ));
}

