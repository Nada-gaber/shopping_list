import 'package:arabic_font/arabic_font.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list/widget/text_style.dart';

import '../features/add_item/model/item_model.dart';

class TaskTile extends StatelessWidget {
  final Item task;
  final void Function()? onPressed;
  final Icon icon;

  const TaskTile(this.task, this.onPressed, this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.35),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(6),
          color: _getBGClr('${task.color ?? '1'}'),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            textStyle(task.title ?? "", 20, FontWeight.bold, Colors.white,
                context, 0, TextAlign.right,
                top: 0, bottom: 0, left: 0),
            const SizedBox(
              width: 20,
            ),
            Column(
              children: [
                Text(
                  task.price,
                  style: const ArabicTextStyle(
                    arabicFont: ArabicFont.dinNextLTArabic,
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 25,
                  ),
                ),
                const Text(
                  'price',
                  style: ArabicTextStyle(
                    arabicFont: ArabicFont.dinNextLTArabic,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                )
              ],
            ),
            Column(
              children: [
                Text(
                  task.quantity,
                  style: const ArabicTextStyle(
                    arabicFont: ArabicFont.dinNextLTArabic,
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 25,
                  ),
                ),
                Text(
                  task.type,
                  style: const ArabicTextStyle(
                    arabicFont: ArabicFont.dinNextLTArabic,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            IconButton(
              onPressed: onPressed,
              icon: icon,
              color: Colors.white,
              iconSize: 30,
            ),
          ],
        ),
      ),
    );
  }

  _getBGClr(String no) {
    switch (no) {
      case '0':
        return const Color(0xFF91CD76);
      case '1':
        return const Color(0xFFF89500);
      case '2':
        return const Color(0xFF38B6FF);
      case '3':
        return const Color(0xFFFF6270);
      case '4':
        return const Color(0xFFEEA775);
      case '5':
        return const Color(0xFFFF7058);
      case '6':
        return Colors.grey.shade800;

      default:
        return Colors.amber;
    }
  }
}
