import 'package:flutter/material.dart';
import 'package:movies_app/slider/onbording_slider.dart';

class Onslider extends StatelessWidget {
  static const String routeName = "/";

  const Onslider({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff131213),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/OnboardingPic/onboarding1.png",
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withOpacity(.5),
          ),
          Positioned(
            bottom: 120,
            right: 20,
            left: 20,
            child: Column(
              children: [
                Text(
                  "Find Your Next\n Favorite Movie Here",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "Get access to a huge library of movies\n to suit all tastes. You will surely like it.",
                  style: TextStyle(
                    color: Colors.white.withOpacity(.5),
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Positioned(
              left: 10,
              right: 10,
              bottom: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffF6BD00),
                  padding: EdgeInsets.symmetric(horizontal: 8,vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)
                  )
                ),
                onPressed: () {
                  Navigator.pushNamed(context,OnboardingSlider1.routeName,);
                },
                child: Text(
                  "Explore Now",
                  style: TextStyle(fontSize: 26, color: Colors.black),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
