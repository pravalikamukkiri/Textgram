import 'package:ffff/screens/user_ui.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ffff/authenticate/register.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ffff/wraper.dart';
import 'package:ffff/items.dart';
import 'package:ffff/screens/home.dart';
import 'package:ffff/screens/user_ui.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/user_profile':(context)=> User_profile(),
      },
      home: wraper(),
      debugShowCheckedModeBanner: false,
    );
  }
}
