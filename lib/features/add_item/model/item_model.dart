class Item {
  final int id;
  final String title;
  final String color;
  final String price;
  final String type;
  final String quantity;

  Item(
      {required this.id,
      required this.title,
      required this.color,
      required this.type,
      required this.price,
      required this.quantity});

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'],
      title: map['title'],
      color: map['color'] ?? '0',
      price: map['price'],
      type: map['type'],
      quantity: map['quantity'],
    );
  }
}
