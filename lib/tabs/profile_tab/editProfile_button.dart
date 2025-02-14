import 'package:flutter/material.dart';

class EditButton extends StatefulWidget {
  static const String routeName="EditButton";
   EditButton({super.key});

  @override
  State<EditButton> createState() => _EditButtonState();
}

class _EditButtonState extends State<EditButton> {

  List<String> choosene=[];

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
            "Pick Avatar",
            style: TextStyle(
              color: Color(0xffF6BD00),
            ),
          ),
        ),
      ),
      backgroundColor: Color(0xff121312),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: InkWell(
                    onTap: (){
                      showCustomBottomSheet(context);
                    },
                    child: Image.asset("assets/images/screenpic/gamer1.png")
                ),
              ),
              SizedBox(height: 25,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: TextStyle(
                    color: Color(0xffF6BD00),
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xff282A28),
                    labelText: 'John Safwat',
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
                      Icons.person,
                      color: Color(0xffFFFFFF),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: TextStyle(
                    color: Color(0xffF6BD00),
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xff282A28),
                    labelText: '01200000000',
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
                      Icons.phone,
                      color: Color(0xffFFFFFF),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Reset Password",style: TextStyle(color: Colors.white),),
                  ],
                ),
              ),
              Spacer(),
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: (){},
                        child: Text("Delete Account",style: TextStyle(
                          color: Color(0xffFFFFFF),
                          fontSize: 20,
                        ),
                        ),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(25),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        backgroundColor: Color(0xffE82626),
                      ),
                    ),
                  ),
                  SizedBox(height: 16,),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: (){},
                      child: Text("Update Data",style: TextStyle(
                        color: Color(0xff121312),
                        fontSize: 20,
                      ),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(25),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        backgroundColor: Color(0xffF6BD00),
                      ),
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
final List<String> imageList = [
  "assets/images/screenpic/gamer1.png",
  "assets/images/screenpic/gamer2.png",
  "assets/images/screenpic/gamer3.png",
  "assets/images/screenpic/gamer4.png",
  "assets/images/screenpic/gamer5.png",
  "assets/images/screenpic/game6.png",
  "assets/images/screenpic/game7.png",
  "assets/images/screenpic/game8.png",
  "assets/images/screenpic/game9.png",
];

// دي فنكشن عشان لما يضغط ع الافتار يقدر يغيره
void showCustomBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // لتحديد حجم الـ BottomSheet حسب محتواه
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)), // حواف مستديرة
    ),
    backgroundColor: Color(0xff282A28),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0), // المسافة بين الحواف
        child: Container(
          height: 400, // تحديد ارتفاع الـ BottomSheet
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: 9,
            itemBuilder: (context, index) {
              return Container(
                width: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(imageList[index],
                    fit: BoxFit.cover,
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Color(0xffF6BD00)
                  )
                  
                ),

              );
            },
          ),
        ),
      );
    },
  );
}
