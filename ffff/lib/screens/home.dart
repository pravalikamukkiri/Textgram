import 'package:flutter/material.dart';
import 'package:ffff/screens/profile.dart';
import 'image_picker.dart';
import 'search.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ffff/items.dart';
class Home extends StatefulWidget {
  final Function toggleView;
  Home({this.toggleView});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.photo_camera,
            ),
            color: Colors.black,
          ),
          Spacer(flex: 1,),
          Padding(
            padding: const EdgeInsets.fromLTRB(3, 10, 0, 0),
            child: Text(
              'Textgram',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
              ),
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.send),
            color: Colors.black,
          ),
        ],
      ),

      bottomNavigationBar: new BottomAppBar(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.home),
              iconSize: 32.0,
            ),
            IconButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>Searchuser()),
                );
              },
              icon: Icon(Icons.search),
              iconSize: 32.0,
            ),
            IconButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>UploadImage()),
                );
              },
              icon: Icon(Icons.add_circle_outline),
              iconSize: 32.0,
            ),
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.favorite),
              iconSize: 32.0,
            ),
            IconButton(
              onPressed: () async{
                String r1='';
                String r2='';
                await Firestore.instance.collection('Users').document(ud).get().then((DocumentSnapshot ds){
                  print(ds['name']);
                  print(ds['bio']);
                  r1=ds['name'];
                  r2=ds['bio'];
                });
                setState(() {
                  if(r1!=Null){
                    username=r1;
                  }
                  if(r2!=Null){
                    bio=r2;
                    print(bio);
                  }
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => pUser()),
                );
              },
              icon: Icon(Icons.account_circle),
              iconSize: 32.0,
            )
          ],
        ),
      ),
    );
  }
}