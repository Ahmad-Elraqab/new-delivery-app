class Item {
  String restaurantId;
  String id;
  String menuId;
  String itemCategory;
  String itemName;
  String itemImage;
  String itemDescription;
  double itemPrice;
  double totalPrice;
  int itemCount;
  bool isOrdered;

  Item({
    this.restaurantId,
    this.itemCategory,
    this.id,
    this.itemDescription,
    this.itemName,
    this.itemPrice,
    this.itemImage,
    this.isOrdered,
    this.itemCount,
    this.menuId,
    this.totalPrice,
  });

  Item.fromJson(Map<String, dynamic> json)
      : this(
          restaurantId: json['restaurantId'],
          itemCategory: json['itemCategory'],
          id: json['id'],
          itemDescription: json['itemDescription'],
          itemName: json['itemName'],
          itemPrice: json['itemPrice'].toDouble(),
          itemImage: json['itemImage'],
          isOrdered: json['isOrdered'],
          menuId: json['menuId'],
          itemCount: json['itemCount'],
          totalPrice:
              json['totalPrice'] == null ? 0.0 : json['totalPrice'].toDouble(),
        );

  Map<String, dynamic> toJson() => {
        'restaurantId': restaurantId,
        'itemCategory': itemCategory,
        'id': id,
        'itemDescription': itemDescription,
        'itemName': itemName,
        'itemPrice': itemPrice,
        'itemImage': itemImage,
        'isOrdered': isOrdered,
        'itemCount': itemCount,
        'menuId': menuId,
        'totalPrice': totalPrice,
      };
}
