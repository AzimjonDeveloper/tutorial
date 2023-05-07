import 'package:flutter/material.dart';
import 'package:ecommerse/presentation/ui/resourses/app_images.dart';

class Product {
  int mark;
  String name;
  double price;
  String imageUrl;
  GestureTapCallback onTap;
  Product({
    required this.name,
    required this.imageUrl,
    required this.mark,
    required this.price,
    required this.onTap,
  });

  static List<Product> itemsdata = [
    Product(
      onTap: () {},
      name: 'Apple Macbook',
      imageUrl: AppImages.laptop,
      mark: 4,
      price: 1200,
    ),
    Product(
      onTap: () {},
      name: 'Apple Watch',
      imageUrl: AppImages.watch,
      mark: 5,
      price: 400,
    ),
    Product(
      onTap: () {},
      name: 'Trainers',
      imageUrl: AppImages.trainers,
      mark: 3,
      price: 200,
    ),
    Product(
      onTap: () {},
      name: 'Backpack',
      imageUrl: AppImages.backpack,
      mark: 4,
      price: 1200,
    ),
    Product(
      onTap: () {},
      name: 'Apple Macbook',
      imageUrl: AppImages.laptop,
      mark: 4,
      price: 1200,
    ),
    Product(
      onTap: () {},
      name: 'Apple Watch',
      imageUrl: AppImages.watch,
      mark: 5,
      price: 400,
    ),
    Product(
      onTap: () {},
      name: 'Trainers',
      imageUrl: AppImages.trainers,
      mark: 3,
      price: 200,
    ),
    Product(
      onTap: () {},
      name: 'Backpack',
      imageUrl: AppImages.backpack,
      mark: 4,
      price: 1200,
    ),
    Product(
      onTap: () {},
      name: 'Apple Macbook',
      imageUrl: AppImages.laptop,
      mark: 4,
      price: 1200,
    ),
    Product(
      onTap: () {},
      name: 'Apple Watch',
      imageUrl: AppImages.watch,
      mark: 5,
      price: 400,
    ),
    Product(
      onTap: () {},
      name: 'Trainers',
      imageUrl: AppImages.trainers,
      mark: 3,
      price: 200,
    ),
    Product(
      onTap: () {},
      name: 'Backpack',
      imageUrl: AppImages.backpack,
      mark: 4,
      price: 1200,
    ),
  ];
}
