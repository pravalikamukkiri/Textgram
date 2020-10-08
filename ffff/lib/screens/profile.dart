import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ffff/screens/home.dart';
import 'package:ffff/screens/editprofile.dart';
import 'package:ffff/items.dart';

class pUser extends StatefulWidget {

  @override
  _pUserState createState() => _pUserState();
}

class _pUserState extends State<pUser>  {
  //String name=getData();
  @override
  Widget build(BuildContext context)  {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(3, 10, 0, 0),
            child: Text(
              'User',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
              ),
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_horiz),
            color: Colors.black,
          ),
        ],
      ),
      body: ListView(
        physics: AlwaysScrollableScrollPhysics(),
        children: [
          Container(
            padding: EdgeInsets.all(10),
            height: 130,
            child: Row(
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      child: Icon(Icons.account_circle),
                      radius: 25,
                    ),
                    SizedBox(height: 4,),
                    Text(username),
                    Text(bio),
                  ],
                ),
                Spacer(),
                Spacer(),
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              child: RaisedButton(
                color: Colors.white70,
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditProfile()),
                  );
                },
                child: Text('Edit Profile'),
              )
          )
        ],
      ),
      bottomNavigationBar: new BottomAppBar(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
              icon: Icon(Icons.home),
              iconSize: 32.0,
            ),
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.search),
              iconSize: 32.0,
            ),
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.add_circle_outline),
              iconSize: 32.0,
            ),
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.favorite),
              iconSize: 32.0,
            ),
            IconButton(
              onPressed: (){
                /*Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => user()),
                );*/
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

getData() async{
  await Firestore.instance.collection('Users').document(ud).get().then((DocumentSnapshot ds){
    print(ds['name']);
    String res=ds['name'];
    return res;
  });
}