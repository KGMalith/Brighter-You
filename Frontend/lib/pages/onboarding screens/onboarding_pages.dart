import 'package:brighter_you/config.dart';
import 'package:brighter_you/main.dart';
import 'package:brighter_you/models/onboard_data.dart';
import 'package:brighter_you/pages/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../widgets/widgets.dart';

class OnboardingPages extends StatefulWidget {
  const OnboardingPages({Key? key}) : super(key: key);

  @override
  _OnboardingPagesState createState() => _OnboardingPagesState();
}

class _OnboardingPagesState extends State<OnboardingPages> {
  int currentPage = 0;

  PageController _pageController = PageController(initialPage: 0);

  AnimatedContainer dotIndicator(index) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(right: 5),
      duration: const Duration(microseconds: 400),
      height: 12,
      width: 12,
      decoration: BoxDecoration(
          color: currentPage == index
              ? const Color.fromRGBO(47, 128, 237, 1)
              : const Color.fromRGBO(196, 196, 196, 1),
          shape: BoxShape.circle),
    );
  }

  Future setSeenOnBoard() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    seenOnBoard = await pref.setBool('seenOnBoard', true);
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    setSeenOnBoard();
  }

  @override
  Widget build(BuildContext context) {
    //initialize size config
    SizeConfig().init(context);
    double sizeH = SizeConfig.blockSizeH!;
    double sizeV = SizeConfig.blockSizeV!;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            flex: 9,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              itemCount: onboardingContents.length,
              itemBuilder: (context, index) => Column(
                children: [
                  SizedBox(
                    height: sizeH * 3,
                  ),
                  Container(
                    height: sizeH * 50,
                    width: sizeV * 70,
                    child: Image.asset(
                      onboardingContents[index].image,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Text(onboardingContents[index].title,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(79, 79, 79, 1),
                      ))),
                  SizedBox(
                    height: sizeH * 4,
                  ),
                  Container(
                    width: sizeV * 80,
                    child: Text(onboardingContents[index].description,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(130, 130, 130, 1),
                        ))),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  currentPage == onboardingContents.length - 1
                      ? ButtonText(
                          buttonName: 'Get Started',
                          bgColor: const Color.fromRGBO(47, 128, 237, 1),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          })
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            OnBoardNavBtn(
                              name: 'Skip',
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginScreen()));
                              },
                            ),
                            Row(
                                children: List.generate(
                                    onboardingContents.length,
                                    (index) => dotIndicator(index))),
                            OnBoardNavBtn(
                              name: 'Next',
                              onPressed: () {
                                _pageController.nextPage(
                                    duration: Duration(microseconds: 400),
                                    curve: Curves.easeInOut);
                              },
                            ),
                          ],
                        ),
                ],
              ))
        ],
      )),
    );
  }
}
