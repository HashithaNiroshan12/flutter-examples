class Dish {
  String name;
  String description;
  double price;

  Dish({
    required this.name,
    required this.description,
    required this.price,
  });

  factory Dish.fromMap(Map<String, dynamic> json) => Dish(
        name: json['name'],
        description: json['description'],
        price: json['price'],
      );
}
