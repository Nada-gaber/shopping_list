 import 'package:flutter/material.dart';

import 'tabs_designs.dart';

appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: const Color(0xffF6F6F6),
      toolbarHeight: 12.0,
      bottom: TabBar(
        indicatorColor: const Color(0xffEFCB0F),
        indicatorWeight: 3,
        tabs: [
          Tab(
            height: 100,
            child: tabDesign('Shopping', Icons.shopping_cart_outlined),
          ),
          Tab(
              height: 100,
              child: tabDesign('Buying', Icons.shopping_bag_outlined)),
        ],
      ),
    );
  }