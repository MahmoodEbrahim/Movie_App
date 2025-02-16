
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:movies_app/firebase_file/firebase_manager.dart';
import 'package:movies_app/model/user_model.dart';

class UserProvider extends ChangeNotifier{

  UserModel? userModel;
  User? firebaseUser;

  UserProvider(){
    firebaseUser = FirebaseAuth.instance.currentUser;
    if(firebaseUser != null){
      intiuser();
    }
  }
  intiuser() async{
    userModel= await FirebaseManager.readuser();
    notifyListeners();
  }

}