import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:movies_app/login&register_screen/forget_password.dart';
import 'package:movies_app/login&register_screen/login_screen.dart';
import 'package:movies_app/slider/onSlider.dart';
import 'package:movies_app/slider/onbording_slider.dart';
import 'package:movies_app/tabs/profile_tab/editProfile_button.dart';

import 'homescreen.dart';
import 'login&register_screen/register_screen.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        Onslider.routeName:(context)=>Onslider(),
        OnboardingSlider1.routeName:(context)=>OnboardingSlider1(),
        LoginScreen.routeName:(context)=>LoginScreen(),
        RegisterScreen.routeName:(context)=>RegisterScreen(),
        ForgetPassword.routeName:(context)=>ForgetPassword(),
        Homescreen.routeName:(context)=>Homescreen(),
        EditButton.routeName:(context)=>EditButton(),

      }
    );
  }
}
