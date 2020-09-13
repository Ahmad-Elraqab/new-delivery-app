import 'item_class.dart';

class Order {
  String orderId;
  String userId;
  String itemId;
  String numberOfItems;
  double totalPrice;
  List<Item> items;

  Order(
      {this.orderId,
      this.itemId,
      this.totalPrice,
      this.userId,
      this.numberOfItems,
      this.items});
  Order.fromJson(Map<String, dynamic> json)
      : this(
          orderId: json['orderId'],
          userId: json['userid'],
          numberOfItems: json['numberOfItems'],
          itemId: json['itemId'],
          totalPrice: json['totalPrice'],
          items:
              (json['items'] as List).map((doc) => Item.fromJson(doc)).toList(),
        );

  Map<String, dynamic> toJson() => {
        'orderId': orderId,
        'numberOfItems': numberOfItems,
        'itemId': itemId,
        'totalPrice': totalPrice,
        'userid': userId,
        'items': items
      };
}
