import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:master_go_replication/auth/signup_screen.dart';
import 'package:master_go_replication/onboard/onboard_model.dart';

class OnboardScreens extends StatefulWidget {
  const OnboardScreens({super.key});

  @override
  State<OnboardScreens> createState() => _OnboardScreensState();
}

class _OnboardScreensState extends State<OnboardScreens> {
  PageController pageController = PageController(initialPage: 0);
  int currentIndex = 0;
  List<OnboardModel> screens = [
    OnboardModel(
      header: "Proven\n specialists",
      imagePath: "assets/images/o1.png",
      body: "We check each specialist before \nhe starts work",
    ),
    OnboardModel(
        header: "Honest \nratings",
        imagePath: "assets/images/o2.png",
        body: "We carefully check each specialist\n and put honest ratings"),
    OnboardModel(
        header: "Insured \norders",
        imagePath: "assets/images/o3.png",
        body: "We insure each order for\n the amount of \$500"),
    OnboardModel(
        header: "Create \norder",
        imagePath: "assets/images/o4.png",
        body: "It's easy, just click on the plus"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          PageView.builder(
              controller: pageController,
              itemCount: screens.length,
              onPageChanged: (i) {
                setState(() {
                  currentIndex = i;
                });
              },
              itemBuilder: (context, index) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          screens[index].header,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 36,
                              color: HexColor("#525464")),
                        ),
                        Image.asset(screens[index].imagePath),
                        Text(
                          screens[index].body,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: HexColor("#525464"), fontSize: 18),
                        ),
                        currentIndex != 3
                            ? DotsIndicator(
                                dotsCount: screens.length,
                                position: currentIndex,
                                decorator: DotsDecorator(
                                  activeColor: Colors.grey,
                                  size: const Size.square(9.0),
                                  activeSize: const Size(18.0, 9.0),
                                  activeShape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0)),
                                ),
                              )
                            : const SizedBox(),
                        currentIndex != 3
                            ? InkWell(
                                onTap: () => pageController.nextPage(
                                    curve: Curves.easeIn,
                                    duration:
                                        const Duration(milliseconds: 400)),
                                child: Container(
                                  height: 60,
                                  width: 320,
                                  color: HexColor("#20C3AF"),
                                  child: const Center(
                                    child: Text(
                                      "Next",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ))
                            : ElevatedButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SignupScreen()));
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: HexColor("#20C3AF"),
                                    shape: const CircleBorder(),
                                    minimumSize: const Size(70, 70)),
                                child: const Icon(
                                  size: 30,
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              )
                      ],
                    ),
                  ),
                );
              }),
        ],
      )),
    );
  }
}
