class Item {
  String id;
  String menuId;
  bool isOrdered;
  int numberOfItems;
  String mealName;
  String image;
  String description;
  double price;
  String restaurantId;

  Item(
      {this.id,
      this.description,
      this.mealName,
      this.price,
      this.image,
      this.isOrdered,
      this.numberOfItems,
      this.restaurantId});

  Item.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          description: json['description'],
          mealName: json['mealName'],
          price: json['price'],
          image: json['image'],
          isOrdered: json['isOrdered'],
          numberOfItems: json['numberOfItems'],
          restaurantId: json['restaurantId'],
        );

  Map<String, dynamic> toJson() => {
        'id': id,
        'description': description,
        'mealName': mealName,
        'price': price,
        'image': image,
        'isOrdered': isOrdered,
        'menuId': menuId,
        'numberOfItems': numberOfItems,
        'restaurantId': restaurantId,
      };
}
