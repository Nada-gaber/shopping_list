import 'package:flutter/material.dart';
import 'package:shopping_list/features/add_item/ui/widgets/add_to_cart.dart';
import 'package:shopping_list/features/add_item/ui/widgets/color_pallete.dart';
import 'package:shopping_list/features/add_item/ui/widgets/dropdown_menu.dart';
import 'package:shopping_list/widget/text_style.dart';
import 'package:shopping_list/widget/textfield.dart';

class AddItem extends StatefulWidget {
  final TextEditingController itemController;
  final TextEditingController type;
  final TextEditingController quantity;
  final TextEditingController price;
  final TextEditingController selectedColor;

  final void Function()? onPressed;
  const AddItem({
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
            DropDownMenu(
              type: widget.type,
            ),
            textStyle('Category :', 20, FontWeight.bold, Colors.black54,
                context, 0, TextAlign.right,
                top: 20, bottom: 10, left: 15),
            ColorPalleta(selectedColor: widget.selectedColor),
            const SizedBox(
              height: 10,
            ),
            addToCartContainer(context, widget.onPressed)
          ],
        ),
      ),
    );
  }
}
