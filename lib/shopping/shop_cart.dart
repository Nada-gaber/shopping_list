import 'package:arabic_font/arabic_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:shopping_list/shopping/tasktile.dart';
import 'package:shopping_list/widget/float_container.dart';
import 'package:shopping_list/widget/text_style.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';
import '../features/add_item/model/item_model.dart';
import '../features/add_item/ui/add_item.dart';
import '../features/shopping_list/ui/widgets/shopping_list_appbar.dart';

class ShoppingList extends StatefulWidget {
  const ShoppingList({
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  late Database database;
  List<Item> _incompleteTasks = [];
  List<Item> _completedTasks = [];
  final TextEditingController itemController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController selectedColor = TextEditingController();
  double totalPrice = 0;
  double totalPrice2 = 0;

  @override
  void initState() {
    super.initState();
    initializeDatabase();
  }

  Future<void> initializeDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'tasks.db');

    database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE tasks(id INTEGER PRIMARY KEY, title TEXT, isComplete INTEGER, color TEXT, type TEXT, price TEXT , quantity TEXT)',
        );
      },
    );

    refreshTasks();
  }

  Future<void> addTask(String title, String color, String type, String price,
      String quantity) async {
    double priceValue = double.parse(price);
    setState(() {
      totalPrice += priceValue;
      totalPrice2 -= priceValue;
    });
    await database.insert(
      'tasks',
      {
        'title': title,
        'isComplete': 0,
        'color': color,
        'type': type,
        'price': price,
        'quantity': quantity,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    itemController.clear();
    priceController.clear();
    typeController.clear();
    quantityController.clear();
    selectedColor.clear();
    refreshTasks();
  }

  Future<void> refreshTasks() async {
    final items = await database.query('tasks');

    double totalIncompletePrice = 0.0;
    double totalcompletePrice = 0.0;

    setState(() {
      _incompleteTasks =
          items.where((item) => item['isComplete'] == 0).map((item) {
        totalIncompletePrice += double.parse(item['price'].toString());
        return Item.fromMap(item);
      }).toList();

      _completedTasks =
          items.where((item) => item['isComplete'] == 1).map((item) {
        totalcompletePrice += double.parse(item['price'].toString());
        return Item.fromMap(item);
      }).toList();

      totalPrice2 = totalcompletePrice;
      totalPrice = totalIncompletePrice;
    });
  }

  Future<void> completeTask(Item item) async {
    await database.update(
      'tasks',
      {
        'isComplete': 1,
        'color': 6,
      },
      where: 'id = ?',
      whereArgs: [item.id],
    );
    refreshTasks();
  }

  Future<void> deletTask(Item item) async {
    await database.delete(
      'tasks',
      where: 'id = ?',
      whereArgs: [item.id],
    );

    refreshTasks();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: appBar(),
        body: TabBarView(children: [
          Stack(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        'Shopping List',
                        style: ArabicTextStyle(
                          arabicFont: ArabicFont.dinNextLTArabic,
                          color: Colors.amber,
                          fontWeight: FontWeight.w600,
                          fontSize: 25,
                        ),
                      ),
                      MaterialButton(
                          shape: const RoundedRectangleBorder(),
                          color: Colors.amber,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddItem(
                                          itemController: itemController,
                                          onPressed: () {
                                            if (itemController.text.isEmpty ||
                                                typeController.text.isEmpty ||
                                                priceController.text.isEmpty ||
                                                quantityController
                                                    .text.isEmpty ||
                                                selectedColor.text.isEmpty) {
                                              Get.snackbar(
                                                'Warning',
                                                'you need to fill all request',
                                                snackPosition:
                                                    SnackPosition.TOP,
                                                backgroundColor: Colors.amber,
                                                icon: const Icon(Icons
                                                    .warning_amber_rounded),
                                              );
                                            } else if (int.tryParse(
                                                        priceController.text) ==
                                                    null &&
                                                double.tryParse(
                                                        priceController.text) ==
                                                    null) {
                                              Get.snackbar(
                                                'Alert',
                                                'write price number correct',
                                                snackPosition:
                                                    SnackPosition.TOP,
                                                backgroundColor: Colors.red,
                                                colorText: Colors.white,
                                                icon: const Icon(
                                                  Icons.warning_amber_rounded,
                                                  color: Colors.white,
                                                ),
                                              );
                                            } else if (int.tryParse(
                                                        quantityController
                                                            .text) ==
                                                    null &&
                                                double.tryParse(
                                                        quantityController
                                                            .text) ==
                                                    null) {
                                              Get.snackbar(
                                                'Alert',
                                                'write quantity number correct',
                                                snackPosition:
                                                    SnackPosition.TOP,
                                                backgroundColor: Colors.red,
                                                colorText: Colors.white,
                                                icon: const Icon(
                                                  Icons.warning_amber_rounded,
                                                  color: Colors.white,
                                                ),
                                              );
                                            } else {
                                              Navigator.of(context).pop();
                                              addTask(
                                                itemController.text,
                                                selectedColor.text,
                                                typeController.text,
                                                priceController.text,
                                                quantityController.text,
                                              );
                                            }
                                          },
                                          price: priceController,
                                          quantity: quantityController,
                                          selectedColor: selectedColor,
                                          type: typeController,
                                        )));
                          },
                          child: const Padding(
                            padding: EdgeInsets.only(bottom: 5),
                            child: Text(
                              'add Item',
                              style: ArabicTextStyle(
                                arabicFont: ArabicFont.dinNextLTArabic,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  tasksDesign(context),
                  const SizedBox(
                    height: 100,
                  )
                ],
              ),
              Positioned(
                  bottom: 4.0,
                  left: 0.0,
                  right: 0.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: floatedContainer(
                        'items Num',
                        '${_incompleteTasks.length}',
                        ' $totalPrice',
                        context,
                        'total price'),
                  )),
            ],
          ),
          Stack(
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  if (_completedTasks.isEmpty)
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: textStyle(
                              'buying list is empty',
                              15,
                              FontWeight.w600,
                              Colors.grey,
                              context,
                              0,
                              TextAlign.right,
                              top: 10,
                              bottom: 10,
                              left: 0),
                        ),
                      ],
                    )
                  else
                    Expanded(
                      child: ListView.builder(
                        itemCount: _completedTasks.length,
                        itemBuilder: (context, index) {
                          final item = _completedTasks[index];

                          return AnimationConfiguration.staggeredList(
                              position: index,
                              child: SlideAnimation(
                                child: FadeInAnimation(
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Row(
                                      children: [
                                        TaskTile(
                                          item,
                                          () async {
                                            deletTask(item);
                                          },
                                          const Icon(Icons.delete),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ));
                        },
                      ),
                    ),
                  const SizedBox(
                    height: 100,
                  )
                ],
              ),
              Positioned(
                  bottom: 4.0,
                  left: 0.0,
                  right: 0.0,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: floatedContainer(
                          'items Num',
                          '${_completedTasks.length}',
                          '$totalPrice2',
                          context,
                          'You spent'))),
            ],
          ),
        ]),
      ),
    );
  }

  tasksDesign(BuildContext context) {
    if (_incompleteTasks.isEmpty) {
      return Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.2,
          ),
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              'image/shopping.gif',
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.width * 0.43,
            ),
          ),
          textStyle('Shopping list is empty', 15, FontWeight.w600, Colors.grey,
              context, 0, TextAlign.right,
              top: 10, bottom: 10, left: 0),
        ],
      );
    } else {
      return Expanded(
        child: ListView.builder(
          itemCount: _incompleteTasks.length,
          itemBuilder: (context, index) {
            final item = _incompleteTasks[index];
            return AnimationConfiguration.staggeredList(
                position: index,
                child: SlideAnimation(
                  child: FadeInAnimation(
                    child: GestureDetector(
                      onTap: () async {
                        refreshTasks();
                      },
                      child: Row(
                        children: [
                          TaskTile(
                            item,
                            () async {
                              completeTask(item);
                            },
                            const Icon(Icons.done),
                          ),
                        ],
                      ),
                    ),
                  ),
                ));
          },
        ),
      );
    }
  }
}
