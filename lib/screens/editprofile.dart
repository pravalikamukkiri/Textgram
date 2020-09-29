import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class EditProfile extends StatefulWidget {

  @override
  _EditProfileState createState() => _EditProfileState();
}
class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit profile'),
      ),
      body:Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              SizedBox(height: 40,),
              Text('Name'),
              TextFormField(
                onChanged: (val) {
                  setState(() {
                  });
                },
              ),
              SizedBox(height: 20,),
              Text('Bio'),
              TextFormField(
                onChanged: (val) {
                  setState(() {
                  });
                },
              ),
              SizedBox(height: 20,),
              RaisedButton(
                onPressed: () async {

                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}