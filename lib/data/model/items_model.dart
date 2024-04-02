class ItemData {
  final int totalData;
  final List<Item> items;

  ItemData({
    required this.totalData,
    required this.items,
  });

  factory ItemData.fromJson(Map<String, dynamic> json) {
    return ItemData(
      totalData: json['totalData'],
      items: List<Item>.from(json['items'].map((x) => Item.fromJson(x))),
    );
  }
}

class Item {
  final String quantity;
  final String orderId;
  final String itemCode;
  final String? description;
  final String weight;
  final String picture;
  final int createdAt;
  final int deletedAt;
  final String itemName;
  final int deleted;
  final String? price;
  final String? customerId;
  final int id;
  final String? itemDescription;
  final int updatedAt;

  Item({
    required this.quantity,
    required this.orderId,
    required this.itemCode,
    required this.description,
    required this.weight,
    required this.picture,
    required this.createdAt,
    required this.deletedAt,
    required this.itemName,
    required this.deleted,
    required this.price,
    required this.customerId,
    required this.id,
    required this.itemDescription,
    required this.updatedAt,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      quantity: json['quantity'],
      orderId: json['orderId'],
      itemCode: json['itemCode'],
      description: json['description'],
      weight: json['weight'],
      picture: json['picture'],
      createdAt: json['createdAt'],
      deletedAt: json['deletedAt'],
      itemName: json['itemName'],
      deleted: json['deleted'],
      price: json['price'],
      customerId: json['customerId'],
      id: json['id'],
      itemDescription: json['itemDescription'],
      updatedAt: json['updatedAt'],
    );
  }
}
