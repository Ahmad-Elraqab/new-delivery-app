import 'item_class.dart';

class Order {
  String userId;
  double totalPrice;
  String id;
  List<Item> items;
  String restaurantName;

  Order(
      {this.restaurantName, this.totalPrice, this.userId, this.id, this.items});
  Order.fromJson(Map<String, dynamic> json)
      : this(
          userId: json['userid'],
          id: json['id'],
          restaurantName: json['restaurantName'],
          totalPrice: json['totalPrice'],
          items:
              (json['items'] as List).map((doc) => Item.fromJson(doc)).toList(),
        );

  Map<String, dynamic> toJson() => {
        'id': id,
        'restaurantName': restaurantName,
        'totalPrice': totalPrice,
        'userid': userId,
        'items': items
      };
}
