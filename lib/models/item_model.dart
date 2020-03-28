
class Item{
  String image_url;
  String name;
  String category;
  String description;
  int number;
  int price;

  Item({
    this.image_url,
    this.name,
    this.category,
    this.description,
    this.number,
    this.price,
  });

  Item.fromJson(Map<String, dynamic> json)
      : image_url = json['image_url'],
        name = json['name'],
        category = json['category'],
        description = json['description'],
        number = json['number'],
        price = json['price'];


  Map<String, dynamic> toJson() =>
      {
        'image_url': image_url,
        'name': name,
        'category': category,
        'description': description,
        'number': number,
        'price': price,
      };

}

