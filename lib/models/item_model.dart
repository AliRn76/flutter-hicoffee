
class Item{
  String imageUrl;
  String name;
  String category;
  String description;
  int number;
  int price;

  Item({
    this.imageUrl,
    this.name,
    this.category,
    this.description,
    this.number,
    this.price,
  });

  Item.fromJson(Map<String, dynamic> json)
      : imageUrl = json['imageUrl'],
        name = json['name'],
        category = json['category'],
        description = json['description'],
        number = json['number'],
        price = json['price'];


  Map<String, dynamic> toJson() =>
      {
        'imageUrl': imageUrl,
        'name': name,
        'category': category,
        'description': description,
        'number': number,
        'price': price,
      };

}

