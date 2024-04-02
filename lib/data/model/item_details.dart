class ItemDetails {
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

  ItemDetails({
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

  factory ItemDetails.fromJson(Map<String, dynamic> json) {
    return ItemDetails(
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
