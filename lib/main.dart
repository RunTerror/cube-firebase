import 'package:cubeassesment/firebase_options.dart';
import 'package:cubeassesment/provider/login_provider.dart';
import 'package:cubeassesment/routes/routename.dart';
import 'package:cubeassesment/ui/auth/login_screen.dart';
import 'package:cubeassesment/ui/auth/phone_auth/login_with_phone_number.dart';
import 'package:cubeassesment/ui/auth/signup_screen.dart';
import 'package:cubeassesment/ui/fogot_password.dart';
import 'package:cubeassesment/ui/home/home_screen.dart';
import 'package:cubeassesment/ui/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      name: 'assesment', options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginProvider(),
        )
      ],
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(primarySwatch: Colors.deepPurple),
          initialRoute: Routes.splashscreen,
          routes: {
            Routes.loginscreen: (context) => const LoginScreen(),
            Routes.signupscreen: (context) => const SignUpScreen(),
            Routes.splashscreen: (context) => const SplashScreen(),
            Routes.homeScreen: (context) => const PostScreen(),
            Routes.forgotpassword: (context) => const ForgotPasswordScreen(),
            Routes.phonelogin: (context) => const LoginWithPhoneNumber()
          },
        );
      },
    );
  }
}
