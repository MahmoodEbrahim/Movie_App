import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movies_app/firebase_file/firebase_manager.dart';
import 'package:movies_app/homescreen.dart';
import 'package:movies_app/login&register_screen/forget_password.dart';
import 'package:movies_app/login&register_screen/register_screen.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../provider/user_provider.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "loginScreen";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController paswordController = TextEditingController();
  TextEditingController userController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var userProvider=Provider.of<UserProvider>(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Image.asset("assets/images/screenpic/firstpic.png"),
                SizedBox(
                  height: 80,
                ),
                TextFormField(
                  controller: emailController,
                  style: TextStyle(
                    color: Color(0xffF6BD00),
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xff282A28),
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      color: Color(0xffFFFFFF),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Color(0xff282A28)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Color(0xffF6BD00),
                    )),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: Color(0xff282A28),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Icon(
                      Icons.email_rounded,
                      color: Color(0xffFFFFFF),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: paswordController,
                  style: TextStyle(
                    color: Color(0xffF6BD00),
                  ),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xff282A28),
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        color: Color(0xffFFFFFF),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Color(0xff282A28)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Color(0xffF6BD00),
                      )),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Color(0xff282A28),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Color(0xffFFFFFF),
                      ),
                      suffixIcon: Icon(
                        Icons.remove_red_eye,
                        color: Color(0xffFFFFFF),
                      )),
                ),
                SizedBox(
                  height: 13,
                ),
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, ForgetPassword.routeName);

                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Forget Password ?",
                        style: TextStyle(color: Color(0xffF6BD00)),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                        FirebaseManager.login(
                          emailController.text,
                          paswordController.text,
                              () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Center(
                                  child: CircularProgressIndicator(),
                                ),
                                backgroundColor: Colors.black12,
                              ),
                            );
                          },
                              () {
                            Navigator.pop(context);
                            userProvider.intiuser();// ده عشام يقرا معلومات اليوزر
                            Navigator.pushNamedAndRemoveUntil(context, Homescreen.routeName,(route)=>false);
                          },
                              (message) {
                            Navigator.pop(context);
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Center(
                                  child: Text("Login Failed",style: TextStyle(color: Colors.white),),
                                ),
                                content: Text("Erorr",style: TextStyle(color: Colors.white),),
                                backgroundColor: Colors.grey,
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("OK"),
                                  ),
                                ],
                              ),
                            );
                          },
                        );

                    },
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      backgroundColor: Color(0xffF6BD00),
                    ),
                  ),

                ),
               SizedBox(height: 15,),
               InkWell(
                 onTap: (){
                   Navigator.pushNamed(context, RegisterScreen.routeName);
                 },
                 child: Text.rich(
                   textAlign: TextAlign.center,

                   TextSpan(
                     children: [
                       TextSpan( text: "Don’t Have Account ?",style: TextStyle(color: Color(0xffFFFFFF),),),
                   TextSpan(text: "Create Account",style: TextStyle(color: Color(0xffF6BD00),fontSize: 18)


                 ),
                 ],
               )
               ),

            ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: Divider(height: 50,endIndent: 10,indent: 50,color: Color(0xffF6BD00),thickness: 1,),),
                    Text("OR",style: TextStyle(color: Color(0XFFF6BD00)),),
                    Expanded(child: Divider(height: 50,endIndent: 50,indent: 10,color: Color(0xffF6BD00),thickness: 1,),),
                  ],
                ),
                SizedBox(height: 20,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        Icon(MdiIcons.google,color: Color(0xff121312),size: 30,),
                        SizedBox(width:5 ,),
                        Text(
                          "Login With Google",
                          style: TextStyle(color: Colors.black,fontSize: 20),
                        ),
                      ]
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      backgroundColor: Color(0xffF6BD00),
                    ),
                  ),
                ),
                SizedBox(height: 40,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ToggleSwitch(
                    minWidth: 65.0,
                    minHeight: 30.0,
                    initialLabelIndex: 0,
                    cornerRadius: 20.0,
                    activeFgColor: Colors.white,
                    inactiveBgColor: Color(0xff282A28),
                    inactiveFgColor: Colors.white,
                    totalSwitches: 2,
                    icons: [
                      MdiIcons.abjadArabic,
                      FontAwesomeIcons.flagUsa                ],
                    iconSize: 30.0,
                    activeBgColors: [[Colors.black45, Colors.black26], [Color(0xffF6BD00), Color(0xffF6BD00)]],
                    animate: true,
                    curve: Curves.bounceInOut,
                    onToggle: (index) {
                    },
                  ),

                )

              ],
          ),

              ),
        ),
      ),
    );
  }
}
