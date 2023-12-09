import 'package:arabic_font/arabic_font.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list/widget/text_style.dart';
import 'package:shopping_list/widget/textfield.dart';

// ignore: must_be_immutable
class AddItem extends StatefulWidget {
  TextEditingController itemController;
  TextEditingController type;
  TextEditingController quantity;
  TextEditingController price;
  TextEditingController selectedColor;

  void Function()? onPressed;
  AddItem({
    Key? key,
    required this.itemController,
    required this.type,
    required this.quantity,
    required this.price,
    required this.onPressed,
    required this.selectedColor,
  }) : super(key: key);

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  @override
  void initState() {
    super.initState();
    widget.itemController;
    widget.price;
    widget.type;
    widget.quantity;
    widget.selectedColor;
  }

  String? selectedType;
  List<String> itemsTypes = [
    'kilo',
    'gram',
    'bag',
    'litre',
    'box',
    'Package',
    'can',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F6F6),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            textfieldClassic(widget.itemController, 'Name', 'Write Item Name'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(child: digitalTextField('Price', '25', widget.price)),
                Expanded(
                    child:
                        digitalTextField('Quantity', '2.5', widget.quantity)),
              ],
            ),
            dropDown(),
             textStyle('Category :', 20, FontWeight.bold,
                  Colors.black54, context, 0, TextAlign.right,
                  top: 20, bottom: 10, left: 15),
            
            colorPalleta(),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: widget.onPressed,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                decoration: const BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    textStyle('add to cart', 25, FontWeight.bold, Colors.white,
                        context, 0, TextAlign.right,
                        top: 5, bottom: 10, left: 10),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  dropDown() {
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

  colorPalleta() {
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
                        border: Border.all(
                            color: index == 0
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
                                                    : Colors.amber),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: widget.selectedColor.text == index.toString()
                          ? Icon(
                              Icons.done,
                              color: index == 0
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
                                                      : Colors.amber,
                            )
                          : Center(
                              child: Column(
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: index == 0
                                            ? const Color(0xFF91CD76)
                                            : index == 1
                                                ? const Color(0xFFF89500)
                                                : index == 2
                                                    ? const Color(0xFF38B6FF)
                                                    : index == 3
                                                        ? const Color(
                                                            0xFFFF6270)
                                                        : index == 4
                                                            ? const Color(
                                                                0xFFEEA775)
                                                            : index == 5
                                                                ? const Color(
                                                                    0xFFFF7058)
                                                                : Colors.amber),
                                    child: FittedBox(
                                      fit: BoxFit.contain,
                                      child: Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Image.asset(
                                          index == 0
                                              ? 'image/veg.png'
                                              : index == 1
                                                  ? 'image/banana.png'
                                                  : index == 2
                                                      ? 'image/milk.png'
                                                      : index == 3
                                                          ? 'image/meat.png'
                                                          : index == 4
                                                              ? 'image/flour.png'
                                                              : 'image/chips.png',
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    index == 0
                                        ? 'veg'
                                        : index == 1
                                            ? 'fruit'
                                            : index == 2
                                                ? 'milk'
                                                : index == 3
                                                    ? 'meat'
                                                    : index == 4
                                                        ? 'market'
                                                        : 'snack',
                                    style: ArabicTextStyle(
                                      arabicFont: ArabicFont.dinNextLTArabic,
                                      color: index == 0
                                          ? const Color(0xFF91CD76)
                                          : index == 1
                                              ? const Color(0xFFF89500)
                                              : index == 2
                                                  ? const Color(0xFF38B6FF)
                                                  : index == 3
                                                      ? const Color(0xFFFF6270)
                                                      : index == 4
                                                          ? const Color(
                                                              0xFFEEA775)
                                                          : index == 5
                                                              ? const Color(
                                                                  0xFFFF7058)
                                                              : Colors.amber,
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
