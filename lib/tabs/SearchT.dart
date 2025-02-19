
import 'package:flutter/material.dart';
class SearchTab extends StatelessWidget {
  SearchTab({super.key});
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121312),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(12),
              child: Row(
                children: [
                  Expanded(child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                        hintText: "Search",
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 16
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color:  Color(0xff282A28),
                          ),
                        ),
                      filled: true,
                      fillColor: Color(0xff282A28),
                      prefixIcon: Icon(Icons.search,color: Colors.white,),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:  Color(0xff282A28),),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:  Color(0xff282A28),),
                        borderRadius: BorderRadius.circular(12)
                      )
                    ),
                  ))
                ],
              ),
            ),
            Expanded(child: Image.asset("assets/images/screenpic/empty1.png"))
          ],
        ),
      ),
    );
  }
}
