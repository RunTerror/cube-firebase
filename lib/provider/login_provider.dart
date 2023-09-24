import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier{

  bool _islogin=false;
  bool get islogin => _islogin;

  bool _isSignup=false;
  bool get isSignup => _isSignup;

  bool _phoneloading=false;
  bool get phoneloading=>_phoneloading;

  void tooglelogin(){
    _islogin=!_islogin;
    notifyListeners();
  }

  void tooglesignup(){
    _isSignup=!isSignup;
    notifyListeners();
  }
  void tooglephoneloading(){
    _phoneloading=!_phoneloading;
    notifyListeners();
  }
  
}