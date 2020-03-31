
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

  // fromMap()
  Item.fromJson(Map<String, dynamic> json){
    image_url = json['image_url'];
    name = json['name'];
    category = json['category'];
    description = json['description'];
    number = json['number'];
    price = json['price'];
  }

  // toJson()
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['image_url'] = image_url;
    map['name'] = name;
    map['category'] = category;
    map['description]'] = description;
    map['number'] = number;
    map['price'] = price;
    return map;
  }


  Item.fromMap(Map<String, dynamic> map){
    image_url = map['Image_Url'];
    name = map['Name'];
    category = map['Category'];
    description = map['Description'];
    number = map['Number'];
    price = map['Price'];
  }

}

