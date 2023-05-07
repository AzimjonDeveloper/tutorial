import 'package:ecommerse/presentation/ui/screens/loginpage/login_page.dart';
import 'package:flutter/material.dart';
import 'package:ecommerse/presentation/ui/resourses/app_styles.dart';
import 'package:ecommerse/presentation/ui/resourses/app_images.dart';
import 'package:ecommerse/presentation/ui/resourses/app_colors.dart';
import 'onboarding_data.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController controller = PageController();
  int pageIndex = 0;
  double width = 0;
  double height = 0;

  Widget _getspace() => SizedBox(
        height: height * 0.094,
      );
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.05,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SafeArea(child: SizedBox()),
                GestureDetector(
                  onTap: () {
                    if (pageIndex != onboardingdata.length - 1) {
                      setState(() {
                        pageIndex++;
                        controller.animateToPage(
                          pageIndex,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear,
                        );
                      });
                    } else {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) {
                            return LoginPage();
                          },
                        ),
                      );
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: height * 0.05),
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Next',
                      style: Styles.getTextActionStyle(),
                    ),
                  ),
                ),
                _getspace(),
                Expanded(
                  child: PageView(
                    controller: controller,
                    onPageChanged: (int index) {
                      setState(() {
                        pageIndex = index;
                      });
                    },
                    physics: const BouncingScrollPhysics(),
                    children: List.generate(
                      onboardingdata.length,
                      (index) => _getScreen(onboardingdata[index]),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _getDots(onboardingdata.length, pageIndex),
                ),
                const SizedBox(
                  height: 60,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _getScreen(OnBoardingData data) {
    return Column(
      children: [
        Image.asset(
          data.imageurl,
          width: width * 0.75,
        ),
        _getspace(),
        Text(
          data.title,
          style: Styles.getOnBoardingTitleStyle(),
        ),
        const SizedBox(
          height: 24,
        ),
        Text(data.subtitle,
            style: Styles.getOnBoardingSubTitleStyle(),
            textAlign: TextAlign.center),
      ],
    );
  }

  List<Widget> _getDots(int n, int activeindex) {
    return List.generate(
      n,
      (index) {
        return Container(
          width: 12,
          height: 12,
          margin: const EdgeInsets.symmetric(
            horizontal: 4,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: activeindex == index
                ? AppColors.primaryColor
                : AppColors.primaryColor.withOpacity(0.4),
          ),
        );
      },
    );
  }
}
