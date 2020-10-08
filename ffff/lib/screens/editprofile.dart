import 'package:ffff/items.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ffff/items.dart';
import 'profile.dart';



class EditProfile extends StatefulWidget {

  @override
  _EditProfileState createState() => _EditProfileState();
}
class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();
  String ubio;
  String uname;
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
                validator: (val) => val.isEmpty ? 'Enter name' : null,
                onChanged: (val) {
                  setState(() {
                    uname=val;
                  });
                },
              ),
              SizedBox(height: 20,),
              Text('Bio'),
              TextFormField(
                validator: (val) => val.isEmpty ? 'Enter a bio' : null,
                onChanged: (val) {
                  setState(() {
                    ubio=val;
                  });
                },
              ),
              SizedBox(height: 20,),
              RaisedButton(
                onPressed: () async {
                  Firestore.instance.collection('Users').document(ud).updateData({'bio': ubio});
                  Firestore.instance.collection('Users').document(ud).updateData({'name': uname});
                  setState(() {
                    bio=ubio;
                    username=uname;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => pUser()),
                  );

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