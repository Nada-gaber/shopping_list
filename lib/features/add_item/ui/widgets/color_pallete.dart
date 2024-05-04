import 'package:arabic_font/arabic_font.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list/features/add_item/ui/widgets/items_color.dart';
import 'package:shopping_list/features/add_item/ui/widgets/items_images.dart';
import 'package:shopping_list/features/add_item/ui/widgets/items_name.dart';

class ColorPalleta extends StatefulWidget {
    final TextEditingController selectedColor;

  const ColorPalleta({Key? key, required this.selectedColor}) : super(key: key);

  @override
  State<ColorPalleta> createState() => _ColorPalletaState();
}

class _ColorPalletaState extends State<ColorPalleta> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 15),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.17,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Wrap(
                children: List<Widget>.generate(6, (int index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    widget.selectedColor.text = index.toString();
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: MediaQuery.of(context).size.height * 0.15,
                      decoration: BoxDecoration(
                        border: Border.all(color: itemColor(index)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: widget.selectedColor.text == index.toString()
                          ? Icon(
                              Icons.done,
                              color: itemColor(index),
                            )
                          : Center(
                              child: Column(
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: itemColor(index)),
                                    child: FittedBox(
                                      fit: BoxFit.contain,
                                      child: Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Image.asset(
                                          itemImage(index),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    itemName(index),
                                    style: ArabicTextStyle(
                                      arabicFont: ArabicFont.dinNextLTArabic,
                                      color: itemColor(index),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                ),
              );
            })),
          ],
        ),
      ),
    );
  }
}


