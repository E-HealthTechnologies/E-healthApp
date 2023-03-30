import 'package:e_health/Presentation/OnBoarding/pages/first_page.dart';
import 'package:e_health/Presentation/OnBoarding/pages/second_page.dart';
import 'package:e_health/Presentation/OnBoarding/pages/third_page.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => OnBoardingScreenState();
}

class OnBoardingScreenState extends State<OnBoardingScreen> {
  final pageController = PageController();//nothing
  final selectedIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Expanded(
              child: PageView(
            controller: pageController,
            physics: BouncingScrollPhysics(),
            children: [FirstPage(), SecondPage(), ThirdPage()],
            onPageChanged: (value) {
              selectedIndex.value = value;
            },
          )),
          ValueListenableBuilder(
              valueListenable: selectedIndex,
              builder: (context, indexIndicator, child) {
                return Wrap(
                  spacing: 8,
                  children: List.generate(
                    3,
                    (index) => AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      height: 8,
                      width: indexIndicator == index ? 20 : 8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: indexIndicator == index
                            ? Colors.black45
                            : Colors.black45.withOpacity(0.5),
                      ),
                    ),
                  ),
                );
              }),
          SizedBox(
            height: 40,
          ),
          Container(
            height: 70,
            padding: const EdgeInsets.only(left: 40, right: 25, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ValueListenableBuilder(
                    valueListenable: selectedIndex,
                    builder: (context, indexIndicator, child) {
                      if (indexIndicator != 2) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(context, '/pat/signIn');
                          },
                          child: Container(
                            child: Text(
                              'skip',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black54,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        );
                      }
                      return SizedBox(
                        height: 20,
                      );
                    }),
                ValueListenableBuilder(
                    valueListenable: selectedIndex,
                    builder: (context, indexIndicator, child) {
                      if (indexIndicator != 2) {
                        return SizedBox(
                          height: 60,
                          width: 80,
                          child: ElevatedButton(
                            onPressed: () {
                              final nextPage = selectedIndex.value + 1;
                              pageController.animateToPage(nextPage,
                                  duration: Duration(milliseconds: 400),
                                  curve: Curves.ease);
                            },
                            child: Icon(
                              Icons.arrow_forward_rounded,
                              color: Colors.blue,
                              size: 30,
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              elevation: 20,
                              shape: CircleBorder(),
                              shadowColor: Colors.black.withAlpha(150),
                            ),
                          ),
                        );
                      }
                      return SizedBox(
                        height: 40,
                      );
                    }),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          )
        ],
      ),
    ));
  }
}
