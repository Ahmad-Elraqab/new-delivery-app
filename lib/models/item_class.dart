class Item {
  String restaurantId;
  String orderId;
  String itemId;
  String itemCategory;
  String itemName;
  String itemImage;
  String itemDescription;
  double itemPrice;
  bool isOrdered;

  Item({
    this.restaurantId,
    this.itemCategory,
    this.itemId,
    this.itemDescription,
    this.itemName,
    this.itemPrice,
    this.itemImage,
    this.isOrdered,
    this.orderId,
  });

  Item.fromJson(Map<String, dynamic> json)
      : this(
          restaurantId: json['restaurantId'],
          orderId: json['orderId'],
          itemCategory: json['itemCategory'],
          itemId: json['itemId'],
          itemDescription: json['itemDescription'],
          itemName: json['itemName'],
          itemPrice: json['itemPrice'],
          itemImage: json['itemImage'],
          isOrdered: json['isOrdered'],
        );

  Map<String, dynamic> toJson() => {
        'restaurantId': restaurantId,
        'orderId': orderId,
        'itemCategory': itemCategory,
        'itemId': itemId,
        'itemDescription': itemDescription,
        'itemName': itemName,
        'itemPrice': itemPrice,
        'itemImage': itemImage,
        'isOrdered': isOrdered,
      };
}
