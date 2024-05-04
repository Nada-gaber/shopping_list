import 'package:flutter/material.dart';
import 'package:shopping_list/widget/text_style.dart';

addToCartContainer(BuildContext context, void Function()? onTap) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: MediaQuery.of(context).size.width * 0.6,
      decoration: const BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10), bottomRight: Radius.circular(10))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          textStyle('add to cart', 25, FontWeight.bold, Colors.white, context,
              0, TextAlign.right,
              top: 5, bottom: 10, left: 10),
          const Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
          ),
        ],
      ),
    ),
  );
}
