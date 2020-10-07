import 'package:flutter/material.dart';
import 'package:ffff/screens/home.dart';
import 'package:ffff/screens/search.dart';
class User_profile extends StatefulWidget {
  @override
  /*final  String user_is;
  final String bio;
  const User_profile(this.user_is,this.bio);*/
  _User_profileState createState() => _User_profileState();
}

class _User_profileState extends State<User_profile> {
  @override
  Widget build(BuildContext context) {
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
      body: Container(
        child:Text('Hello'),
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
              onPressed: (){Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Searchuser()),
              );},
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

