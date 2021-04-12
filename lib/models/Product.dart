import 'package:flutter/material.dart';

class Product {
  final int id;
  final String title, description;
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
  final bool isFavourite, isPopular;

  Product({
    @required this.id,
    @required this.images,
    this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    @required this.title,
    @required this.price,
    @required this.description,
  });
}

// Our demo Products

List<Product> demoProducts = [
  Product(
    id: 1,
    images: [
      "https://www.world-grain.com/ext/resources/Article-Images/2018/10---October/Rice_AdobeStock_64819529_E.jpg?1540215545",
      "https://www.world-grain.com/ext/resources/Article-Images/2018/10---October/Rice_AdobeStock_64819529_E.jpg?1540215545",
    ],
    // colors: [
    //   Color(0xFFF6625E),
    //   Color(0xFF836DB8),
    //   Color(0xFFDECB9C),
    //   Colors.white,
    // ],
    title: "Rice",
    price: 2200,
    description: description,
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 2,
    images: [
      "https://images-na.ssl-images-amazon.com/images/I/71N2PFtrYcL._UL1500_.jpg",
      "https://images-na.ssl-images-amazon.com/images/I/71N2PFtrYcL._UL1500_.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Puma Shoes",
    price: 8000,
    description: "PUMA Men's Shoes - Shop from the latest collection of casual shoes, sports & running shoes for men. Free Shipping. 30 Days Easy Returns",
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  // Product(
  //   id: 2,
  //   images: [
  //     "assets/images/Image Popular Product 2.png",
  //   ],
  //   colors: [
  //     Color(0xFFF6625E),
  //     Color(0xFF836DB8),
  //     Color(0xFFDECB9C),
  //     Colors.white,
  //   ],
  //   title: "Nike Sport White - Man Pant",
  //   price: 50.5,
  //   description: description,
  //   rating: 4.1,
  //   isPopular: true,
  // ),
  // Product(
  //   id: 3,
  //   images: [
  //     "assets/images/glap.png",
  //   ],
  //   colors: [
  //     Color(0xFFF6625E),
  //     Color(0xFF836DB8),
  //     Color(0xFFDECB9C),
  //     Colors.white,
  //   ],
  //   title: "Gloves XC Omega - Polygon",
  //   price: 36.55,
  //   description: description,
  //   rating: 4.1,
  //   isFavourite: true,
  //   isPopular: true,
  // ),
  // Product(
  //   id: 4,
  //   images: [
  //     "assets/images/wireless headset.png",
  //   ],
  //   colors: [
  //     Color(0xFFF6625E),
  //     Color(0xFF836DB8),
  //     Color(0xFFDECB9C),
  //     Colors.white,
  //   ],
  //   title: "Logitech Head",
  //   price: 20.20,
  //   description: description,
  //   rating: 4.1,
  //   isFavourite: true,
  // ),
];

const String description =
    "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";
