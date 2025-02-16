import 'package:flutter/material.dart';

class ForgetPassword extends StatelessWidget {
  static const String routeName = "forgetpassword";

  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(0xffF6BD00),
        ),
        backgroundColor: Color(0xff121312),
        title: Center(
          child: Text(
            "Forget Password",
            style: TextStyle(
              color: Color(0xffF6BD00),
            ),
          ),
        ),
      ),
      backgroundColor: Color(0xff121312),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset("assets/images/screenpic/fogetpassword.png"),
              SizedBox(height: 20,),
              TextFormField(
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
              SizedBox(height: 25,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Verify Email",
                    style: TextStyle(color: Colors.black,fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                    ),
                    padding: EdgeInsets.symmetric(vertical: 20),
                    backgroundColor: Color(0xffF6BD00),
                  ),
                ),
              ),
        
        
            ],
          ),
        ),
      ),
    );
  }
}
