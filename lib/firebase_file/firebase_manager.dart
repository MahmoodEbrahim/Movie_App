import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../model/user_model.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

class FirebaseManager {
  static Future<UserModel?> readuser() async{
    var colection=getusercolection();
    DocumentSnapshot<UserModel> docref =
    await colection.doc(FirebaseAuth.instance.currentUser!.uid).get();
    return docref.data();

  }
  static CollectionReference<UserModel> getusercolection() {
    return
      FirebaseFirestore.instance.collection("Users").withConverter<UserModel>(
        fromFirestore: (snapshot, _) {
          return UserModel.fromJson(snapshot.data()!);
        }, toFirestore: (model, _) {
        return model.toJson();
      },
      );
  }
  static Future<void> adduser(UserModel user){
    var colection=getusercolection();
    var docref =colection.doc(user.id);
    return docref.set(user);
  }
  static Future<void> login(
      String emailAddress,
      String password,
      Function onLoading,
      Function onSuccess,
      Function onError,
      ) async {
    try {
      onLoading();
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      onSuccess();
    } on FirebaseAuthException catch (e) {
      onError(e.message);
    } catch (e) {
      print(e);
      onError("An unexpected error occurred.");
    }
  }


  static Future<void> createaccount(
     String emailAddress, String password,String name,String phone,Function onloading,Function success,Function error) async {
    try {
      onloading();
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      credential.user!.sendEmailVerification();
      UserModel userModel=UserModel(id: credential.user!.uid, name: name, email: emailAddress,phone: phone);
      adduser(userModel);
      success();
    } on FirebaseAuthException catch (e) {
      error(e.message);
      if (e.code == 'weak-password') {
      } else if (e.code == 'email-already-in-use') {
      }
    } catch (e) {
      print(e);
    }
  }
  static logout()async{
    await FirebaseAuth.instance.signOut();
  }
}
