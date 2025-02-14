import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movies_app/login&register_screen/login_screen.dart';
import 'package:toggle_switch/toggle_switch.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = "registerScreen";

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  int selectedIndex = 0; // الصورة المختارة

  final List<String> images = [
    "assets/images/screenpic/gamer1.png",
    "assets/images/screenpic/gamer2.png",
    "assets/images/screenpic/gamer3.png",
  ];

  void selectImage(int index) {
    setState(() {
      // دي انا عاملها هنا عشان لما اختار صوره تيجي فالنص
      String selectedImage = images.removeAt(index);
      images.insert(images.length ~/ 2, selectedImage);
      selectedIndex = images.length ~/ 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121312),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(0xffF6BD00),
        ),
        backgroundColor: Color(0xff121312),
        title: Center(
          child: Text(
            "Register",
            style: TextStyle(
              color: Color(0xffF6BD00),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              // عرض الصور مع لما نختارها
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(images.length, (index) {
                  return GestureDetector(
                    onTap: () => selectImage(index),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 100),
                      curve: Curves.easeInOut,
                      width: index == selectedIndex ? 120 : 80,
                      height: index == selectedIndex ? 120 : 80,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          if (index == selectedIndex)
                            BoxShadow(
                              color: Colors.transparent,
                              blurRadius: 20,
                              spreadRadius: 5,
                            ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          images[index],
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(height: 15),
              Text(
                "Avatar",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              SizedBox(height: 30),

              //  دي فنكشن للتكت فيلد بتاخد اسم و ايكون التكست فيلد عشان شكل التكست فيلد ثابت
              buildTextField("Name", Icons.person),
              SizedBox(height: 25),
              buildTextField("Email", Icons.email_rounded),
              SizedBox(height: 25),
              buildTextField("Password", Icons.lock, isPassword: true),
              SizedBox(height: 25),
              buildTextField("Confirm Password", Icons.lock, isPassword: true),
              SizedBox(height: 25),
              buildTextField("Phone Number", Icons.phone),

              SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Create Account",
                    style: TextStyle(color: Colors.black,fontSize: 20,),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    backgroundColor: Color(0xffF6BD00),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    )
                  ),
                ),
              ),
              SizedBox(height: 22,),
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context, LoginScreen.routeName);
                },
                child: Text.rich(
                    textAlign: TextAlign.center,

                    TextSpan(
                      children: [
                        TextSpan( text: "Already Have Account ?",style: TextStyle(color: Color(0xffFFFFFF),),),
                        TextSpan(text: "Login",style: TextStyle(color: Color(0xffF6BD00),fontSize: 15)


                        ),
                      ],
                    )
                ),

              ),
              SizedBox(height: 22,),
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
    );
  }

  // هي دي فنكشن التكست فيلد
  Widget buildTextField(String label, IconData icon, {bool isPassword = false}) {
    return TextFormField(
      obscureText: isPassword,
      style: TextStyle(color: Color(0xffF6BD00)),
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xff282A28),
        labelText: label,
        labelStyle: TextStyle(color: Color(0xffFFFFFF)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Color(0xff282A28)),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffF6BD00)),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Color(0xff282A28)),
          borderRadius: BorderRadius.circular(10),
        ),
        prefixIcon: Icon(icon, color: Color(0xffFFFFFF)),
      ),
    );
  }
}
