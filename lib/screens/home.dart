import 'package:flutter/material.dart';
import 'package:ffff/screens/profile.dart';
<<<<<<< HEAD
import 'package:ffff/screens/search.dart';
=======

>>>>>>> 9bdd33cbc51afd6421542c38486b167d71f52154
class Home extends StatefulWidget {
  final Function toggleView;
  Home({this.toggleView});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
<<<<<<< HEAD
  initiateSearch(){

  }
=======
>>>>>>> 9bdd33cbc51afd6421542c38486b167d71f52154
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
<<<<<<< HEAD
              onPressed: (){Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Searchuser()),
              );},
=======
              onPressed: (){},
>>>>>>> 9bdd33cbc51afd6421542c38486b167d71f52154
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
