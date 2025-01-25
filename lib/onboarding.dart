import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islame_c13_sunday/home/home.dart';

class OnboardingScreen extends StatelessWidget {
  static const String routeName = "/";

  const OnboardingScreen({super.key});

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/images/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    var bodyStyle = GoogleFonts.elMessiri(
        fontSize: 20.0, fontWeight: FontWeight.bold, color: Color(0XFFE2BE7F));

    var pageDecoration = PageDecoration(
      titleTextStyle: GoogleFonts.elMessiri(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
          color: Color(0xffE2BE7F)),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Color(0xff202020),
      imageFlex: 4,
      imagePadding: EdgeInsets.zero,
    );
    return IntroductionScreen(
      globalHeader: Image.asset(
        "assets/images/Logo.png",
      ),
      dotsFlex: 4,
      dotsDecorator: DotsDecorator(
          color: Color(0XFF707070),
          activeColor: Color(
            0XFFFFD482,
          )),
      globalBackgroundColor: const Color(0xff202020),
      onDone: () {
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      },
      done: Text(
        "finish",
        style: GoogleFonts.elMessiri(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Color(0xffE2BE7F)),
      ),
      showNextButton: true,
      next: Text(
        "Next",
        style: GoogleFonts.elMessiri(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Color(0xffE2BE7F)),
      ),
      showBackButton: true,
      back: Text(
        "Back",
        style: GoogleFonts.elMessiri(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Color(0xffE2BE7F)),
      ),
      pages: [
        PageViewModel(
          title: "Welcome to Islame App",
          body: "",
          image: _buildImage('onboarding1.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Welcome To Islami",
          body: "We Are Very Excited To Have You \nIn Our Community",
          image: _buildImage('onboarding2.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Reading the Quran",
          body: "Read, and your Lord is the Most \n Generous",
          image: _buildImage('onboarding3.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
            title: "Bearish",
            body: "Praise the name of your Lord, the\n Most High",
            image: _buildImage('onboarding4.png'),
            decoration: pageDecoration),
        PageViewModel(
            title: "Holy Quran Radio",
            body:
                "You can listen to the Holy Quran\n Radio through the application for\n free and easily",
            image: _buildImage('onboarding5.png'),
            decoration: pageDecoration,
        ),
      ],
    );
  }
}
