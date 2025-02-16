import 'package:flutter/material.dart';
import 'package:movies_app/firebase_file/firebase_manager.dart';
import 'package:movies_app/login&register_screen/login_screen.dart';
import 'package:movies_app/tabs/profile_tab/editProfile_button.dart';
import 'package:provider/provider.dart';

import '../../provider/user_provider.dart';

class ProfileTab extends StatefulWidget {
   ProfileTab({super.key});
  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var userProvider=Provider.of<UserProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xff121312),
      body: SafeArea(
        child: Container(
          color: Color(0xff212121),
          width: double.infinity,
          height: 420,
          child: Center(
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        children: [
                          Image.asset("assets/images/screenpic/gamer1.png",height: 120,width: 120,),
                          SizedBox(height: 20,),
                          Text(userProvider.userModel!.name??"Null",style: TextStyle(color: Colors.white,fontSize: 20)),
                        SizedBox(height: 20,),
                        ],
                      ),
                    ),
        
                    Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: Column(
                        children: [
                          Text("12",style: TextStyle(color: Colors.white,fontSize: 35),),
                          SizedBox(height: 20,),
                          Text("Wish List",style: TextStyle(color: Colors.white,fontSize: 20),)
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Text("10",style: TextStyle(color: Colors.white,fontSize: 35),),
                        SizedBox(height: 20,),
                        Text("History",style: TextStyle(color: Colors.white,fontSize: 20),)
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: SizedBox(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, EditButton.routeName);
                          },
                          child: Text(
                            "Edit Profile",
                            style: TextStyle(color: Colors.black,fontSize: 20),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)
                            ),
                            padding: EdgeInsets.symmetric(vertical: 18,horizontal: 55),
                            backgroundColor: Color(0xffF6BD00),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      child: ElevatedButton(
                        onPressed: () {
                          FirebaseManager.logout();
                          Navigator.pushNamedAndRemoveUntil(context, LoginScreen.routeName, (route)=>false);
                        },
                        child: Row(
                          children: [Text(
                            "Exit",
                            style: TextStyle(color: Colors.white,fontSize: 20),
                          ),
                          SizedBox(width: 5,),
                          Icon(Icons.exit_to_app,color: Color(0xffFFFFFF),)
                          ]
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)
                          ),
                          padding: EdgeInsets.symmetric(vertical: 18,horizontal: 40),
                          backgroundColor: Color(0xffE82626),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center, // لضبط المسافات بين الأعمدة
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = 0;
                          });
                        },
                        child: Column(
                          children: [
                            Icon(
                              Icons.list,
                              color: Color(0xffF6BD00),
                              size: 35,
                            ),
                            Text(
                              "Watch List",
                              style: TextStyle(color: Colors.white, fontSize: 22),
                            ),
                            if (selectedIndex == 0)
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                width: 150,
                                height: 2,
                                color: Color(0xffF6BD00),
                              ),
                          ],
                        ),
                      ),
                      SizedBox(width: 80),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = 1;
                          });
                        },
                        child: Column(
                          children: [
                            Icon(
                              Icons.folder,
                              color: Color(0xffF6BD00),
                              size: 35,
                            ),
                            Text(
                              "History",
                              style: TextStyle(color: Colors.white, fontSize: 22),
                            ),
                            if (selectedIndex == 1)
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                width: 150,
                                height: 2,
                                color: Color(0xffF6BD00),
                              ),
                          ],
                        ),
                      ),
                    ],
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
