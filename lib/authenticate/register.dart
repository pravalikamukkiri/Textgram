import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/rendering.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({this.toggleView,this.authenticate});
  final Function authenticate;
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final _formKey = GlobalKey<FormState>();

  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          Container(
            padding: EdgeInsets.all(10.0),
            child: RaisedButton(
              color: Colors.grey,
              onPressed: (){
                widget.toggleView();
              },
              child: Text('Signin',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
        title: Text('welcome',
          style: TextStyle(
            color: Colors.white,
          ),),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              SizedBox(height: 40,),
              Container(
                padding: EdgeInsets.all(5),
                child: Text('New to textgram ',
                style: TextStyle(
                  fontSize: 23,
                ),),
              ),
              Text('Register here',
              style: TextStyle(
                fontSize: 18,
              ),),
              TextFormField(
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
              ),
              SizedBox(height: 20,),
              TextFormField(
                obscureText: true,
                validator: (val) => (val.length < 6) ? 'Enter a pswd of 6+ chars' : null,
                onChanged: (val) {
                  setState(() {
                    password = val;
                  });
                },
              ),
              SizedBox(height: 20,),
              RaisedButton(
                onPressed: () async {
                  if(_formKey.currentState.validate()) {
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: email, password: password).then((result) {
                      print(result.user.email);
                      widget.authenticate();
                    });
                  }
                },
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
