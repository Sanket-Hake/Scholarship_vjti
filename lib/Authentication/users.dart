import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scholarship_vjti/Authentication/login.dart';



class UserManagement{
  storeNewUser(user,context) async {
    var FirebaseUser=await FirebaseAuth.instance.currentUser!;
    FirebaseFirestore.instance.collection('users')
    .doc(FirebaseUser.uid)
        .set({'email':user.email,'uid':user.uid,'status':"false"}).then((value)=>
        Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage())))
        .catchError((e) {
    print(e);
    });
    }

}