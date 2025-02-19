import 'package:flutter/material.dart';
import 'package:movies_app/tabs/BrowseT.dart';
import 'package:movies_app/tabs/SearchT.dart';
import 'package:movies_app/tabs/home_tab.dart';
import 'package:movies_app/tabs/profile_tab/profile_tab.dart';

class Homescreen extends StatefulWidget {
  static const String routeName = "Homescreen";

  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int selectIndex = 0; // لتتبع التبويب المحدد


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121312),
      body: tabs[selectIndex],

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(14.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            child: BottomNavigationBar(
              currentIndex: selectIndex, // إضافة خاصية currentIndex
              onTap: (value) {
                setState(() {
                  selectIndex = value;
                });
              },
              type: BottomNavigationBarType.fixed,
              backgroundColor: const Color(0xff282A28),
              selectedItemColor: Color(0xffF6BD00),
              unselectedItemColor: Color(0xffFFFFFF),
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.view_array_rounded),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_2_outlined),
                  label: "",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  List<Widget> tabs=[
    HomeTab(),
    SearchTab(),
    BrowseaTab(),
    ProfileTab(),

  ];
}

