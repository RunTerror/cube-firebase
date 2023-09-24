import 'dart:async';
import 'package:cubeassesment/ui/auth/login_screen.dart';
import 'package:cubeassesment/ui/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashServices{

  void isLogin(BuildContext context){
    final auth = FirebaseAuth.instance;
    final user =  auth.currentUser ;
    if(user != null){
      Timer(const Duration(seconds: 3),
              ()=> Navigator.pushReplacement(context,  MaterialPageRoute(builder: (context) =>const PostScreen()),)
      );
    }else {
      Timer(const Duration(seconds: 3),
              ()=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>const LoginScreen()))
      );
    }
  }
}
