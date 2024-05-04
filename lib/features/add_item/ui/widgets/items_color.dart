
import 'package:flutter/material.dart';

itemColor(int index) {
  return index == 0
      ? const Color(0xFF91CD76)
      : index == 1
          ? const Color(0xFFF89500)
          : index == 2
              ? const Color(0xFF38B6FF)
              : index == 3
                  ? const Color(0xFFFF6270)
                  : index == 4
                      ? const Color(0xFFEEA775)
                      : index == 5
                          ? const Color(0xFFFF7058)
                          : Colors.amber;
}