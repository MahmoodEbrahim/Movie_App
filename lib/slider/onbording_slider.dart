import 'package:flutter/material.dart';
import 'package:movies_app/login&register_screen/login_screen.dart';

class OnboardingSlider1 extends StatefulWidget {
  static const String routeName = "OnboardingSlider1";
  OnboardingSlider1({super.key});

  @override
  _OnboardingSlider1State createState() => _OnboardingSlider1State();
}

class _OnboardingSlider1State extends State<OnboardingSlider1> {
  final PageController _controller = PageController();
  int currentPage = 0;

  final List<String> images = [
    "assets/images/OnboardingPic/onboarding2.png",
    "assets/images/OnboardingPic/onboarding3.png",
    "assets/images/OnboardingPic/onboarding4.png",
    "assets/images/OnboardingPic/onboarding5.png",
    "assets/images/OnboardingPic/onboarding6.png",
  ];
//ودي عشان اللون الي ع الصوره
  final List<Color> overlayColors = [
    Color(0xff084250).withOpacity(.035),
    Color(0xff85210E).withOpacity(.05),
    Color(0xff4C2471).withOpacity(.05),
    Color(0xff601321).withOpacity(.05),
    Color(0xff2A2C30).withOpacity(.05),
  ];
// دي لسته للكلام والوصف عشان ننادي عليه تحت
  final List<Map<String, String>> pageData = [
    {
      "title": "Discover Movies",
      "description": "Explore a vast collection of movies in all\nqualities and genres. Find your next\nfavorite film with ease."
    },
    {
      "title": "Create Watchlists",
      "description": "Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres."
    },
    {
      "title": "Rate, Review, and Learn",
      "description": "Share your thoughts on the movies you've watched. Dive deep into film details and help others discover great movies with your reviews."
    },
    {
      "title": "Personalized Insights",
      "description": "Enjoy customized recommendations."
    },
    {
      "title": "Start Watching Now",
      "description": " "
    },
  ];

  void nextPage() {
    if (currentPage < images.length - 1) {
      _controller.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      print("Finished Onboarding!");
    }
  }

  void previousPage() {
    if (currentPage > 0) {
      _controller.previousPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: images.length,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    images[index],
                    fit: BoxFit.fill,
                  ),
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: overlayColors[index], // ده عشان كل صوره عليها مثلا لون خفيف ناديناه من الكلاس الي فوق
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      decoration: BoxDecoration(
                        color: Color(0xff121312),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          topLeft: Radius.circular(50),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            pageData[index]["title"]!,
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 12),
                          Text(
                            pageData[index]["description"]!,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white70,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,

                            children: [
                              SizedBox(height: 15,),
                              ElevatedButton(
                                onPressed:  () {
                                  //هنا عشان لما يوصل اخر صفحه ويدوس ع زرار ال finsh
                                  if (currentPage == images.length - 1) {
                                    Navigator.pushNamed(context, LoginScreen.routeName);
                                  } else {
                                    nextPage();
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xffF6BD00),
                                  padding: EdgeInsets.symmetric(horizontal: 120, vertical: 20),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Text(
                                  currentPage == images.length - 1 ? "Finish" : "Next",
                                  style: TextStyle(fontSize: 18, color: Colors.black),
                                ),
                              ),
                              SizedBox(height: 10,),
                              if (currentPage > 0) // عشان الصفحه الاولى مش هيكون فيها باك

                                ElevatedButton(
                                onPressed: previousPage,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xff121312),
                                  padding: EdgeInsets.symmetric(horizontal: 120, vertical: 20),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(color: Color(0xffF6BD00), width: 1),
                                  ),
                                ),
                                child: Text(
                                  "Back",
                                  style: TextStyle(fontSize: 18, color: Color(0xffF6BD00)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
