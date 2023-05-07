import 'package:ecommerse/presentation/ui/resourses/app_images.dart';

class OnBoardingData {
  String title;
  String subtitle;
  String imageurl;
  OnBoardingData({
    required this.title,
    required this.subtitle,
    required this.imageurl,
  });
}

List<OnBoardingData> onboardingdata = [
  OnBoardingData(
    title: 'Discover New Products',
    subtitle: '''Many new products are discovered by 
people simply happening upon them 
while being out and about in the 
world.''',
    imageurl: AppImages.onBoarding1,
  ),
  OnBoardingData(
    title: 'Earn Points For Shopping',
    subtitle: '''The purpose of reward points is to provide
an incentive for customers to make
repeat purchases.''',
    imageurl: AppImages.onBoarding2,
  ),
  OnBoardingData(
    title: 'Get Fast Local Delivery',
    subtitle: '''Wow Express offers cash on delivery
services and fast delivery services
so that your customers.''',
    imageurl: AppImages.onBoarding3,
  ),
];
