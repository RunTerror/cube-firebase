import 'package:cubeassesment/provider/login_provider.dart';
import 'package:cubeassesment/routes/routename.dart';
import 'package:cubeassesment/ui/auth/phone_auth/verify_code.dart';
import 'package:cubeassesment/utils/utils.dart';
import 'package:cubeassesment/widgets/round_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class LoginWithPhoneNumber extends StatefulWidget {
  const LoginWithPhoneNumber({Key? key}) : super(key: key);

  @override
  State<LoginWithPhoneNumber> createState() => _LoginWithPhoneNumberState();
}

class _LoginWithPhoneNumberState extends State<LoginWithPhoneNumber> {

  bool loading = false ;
  final phoneNumberController = TextEditingController(text: '+');
  final auth = FirebaseAuth.instance ;

  @override
  Widget build(BuildContext context) {
    final loginprovider=Provider.of<LoginProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title:const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 80,),

            TextFormField(
              controller: phoneNumberController,
              keyboardType: TextInputType.number,
              decoration:const InputDecoration(
                hintText: '+1 234 3455 234'
              ),
            ),
            const SizedBox(height: 80,),
            RoundButton(title: 'Login',loading: loginprovider.phoneloading, onTap: (){
               if(phoneNumberController.text.length<10){
                Utils().toastMessage('Please enter 10 digit phone number');
               }
               else{
                loginprovider.tooglephoneloading();
              auth.verifyPhoneNumber(
                phoneNumber: phoneNumberController.text,
                  verificationCompleted: (_){
                    loginprovider.tooglelogin();
                  },
                  verificationFailed: (e){
                   loginprovider.tooglelogin();
                  Utils().toastMessage(e.toString());
                  },
                  codeSent: (String verificationId , int? token){
                 Navigator.pushReplacementNamed(context, Routes.homeScreen);
                  loginprovider.tooglephoneloading();
                  },
                  codeAutoRetrievalTimeout: (e){
                    Utils().toastMessage(e.toString());
                    loginprovider.tooglephoneloading();
                  });

               }
              
            })

          ],
        ),
      ),
    );
  }
}
