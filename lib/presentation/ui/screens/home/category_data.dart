import 'package:ecommerse/presentation/ui/resourses/app_images.dart';

class CategoryData {
  String name;
  String icon;
  CategoryData({
    required this.name,
    required this.icon,
  });
}

List<CategoryData> categorydata = [
  CategoryData(name: 'Clothes', icon: AppImages.clothes),
  CategoryData(name: 'Laptop', icon: AppImages.laptopIcon),
  CategoryData(name: 'Bag', icon: AppImages.bag),
  CategoryData(name: 'Shoes', icon: AppImages.shoes),
];
