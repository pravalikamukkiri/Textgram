
import 'package:flutter/material.dart';
import 'package:ffff/authenticate/register.dart';
import 'package:ffff/screens/home.dart';
import 'package:ffff/authenticate/signin.dart';

class wraper extends StatefulWidget {
  @override
  _wraperState createState() => _wraperState();
}

class _wraperState extends State<wraper> {
  bool signin = false;
  void toggleView() {
    setState(() {
      signin = !signin;
    });
  }
  bool auth=false;
  void authenticate(){
    setState(() {
      auth = !auth;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(auth){
      return Home();
    }
    else {
      if (signin) {
        return Signin(toggleView: toggleView,authenticate: authenticate);
      }
      else {
        return Register(toggleView: toggleView, authenticate:authenticate);
      }
    }
  }
}
