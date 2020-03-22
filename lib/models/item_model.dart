import 'package:flutter/material.dart';


class Item{
  String imageUrl;
  String name;
  String category;
  int number;
  int price;

  Item({
    this.imageUrl,
    this.name,
    this.number,
    this.price,
    this.category,
  });
}


final List<Item> items = [
  Item(
    imageUrl: "assets/images/photo_2020-03-22_18-16-52.jpg",
    name: "دونه قهوه اندونزی",
    category: "Coffee bean",
    number: 10,
    price: 25500,
  ),
  Item(
    imageUrl: "assets/images/photo_2020-03-22_18-16-56.jpg",
    name: "قهوه ترک",
    category: "Coffee bean",
    number: 5,
    price: 10500,
  ),
  Item(
    imageUrl: "assets/images/photo_2020-03-22_18-16-59.jpg",
    name: "لاته",
    category: "Coffee bean",
    number: 8,
    price: 7000,
  ),
  Item(
    imageUrl: "assets/images/photo_2020-03-22_18-17-02.jpg",
    name: "هات چاکلت",
    category: "Coffee bean",
    number: 12,
    price: 25500,
  ),
  Item(
    imageUrl: "assets/images/photo_2020-03-22_18-17-05.jpg",
    name: "قهوه برزیل",
    category: "Coffee bean",
    number: 21,
    price: 25500,
  ),
];