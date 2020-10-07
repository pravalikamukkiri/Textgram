import 'package:flutter/material.dart';
import 'package:ffff/screens/profile.dart';
import 'image_picker.dart';
import 'search.dart';
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
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => User()),
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