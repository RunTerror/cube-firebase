import 'package:cubeassesment/routes/routename.dart';
import 'package:cubeassesment/utils/utils.dart';
import 'package:cubeassesment/widgets/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {

  final auth = FirebaseAuth.instance ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Home Screen'),
        actions: [
          IconButton(onPressed: (){
            auth.signOut().then((value){
              Navigator.pushReplacementNamed(context, Routes.loginscreen);
            }).onError((error, stackTrace){
              Utils().toastMessage(error.toString());
            });
          }, icon:const Icon(Icons.logout_outlined),),
          const SizedBox(width: 10,)
        ],
      ),
      body:const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DashboardCard(title: 'Field 1', value: 'Sample Data 1'),
            DashboardCard(title: 'Field 2', value: 'Sample Data 2'),
            DashboardCard(title: 'Field 3', value: 'Sample Data 3'),
            DashboardCard(title: 'Field 4', value: 'Sample Data 4'),
          ],
        ),
      ),
    );
  }

}
