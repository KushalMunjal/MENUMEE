import 'dart:io';

class Product {
  final String name;
  final String description;
  final double price;
  final File image;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });
}
