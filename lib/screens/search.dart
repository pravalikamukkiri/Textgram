import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ffff/screens/user_ui.dart';
class Searchuser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search",style: TextStyle(color: Colors.white70),),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Colors.black87,
                    Colors.black
                  ])
          ),
        ),

        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: _Searchuser());
            },
          )
        ],
      ),
    );
  }
}

class _Searchuser extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          close(context, null);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      hoverColor: Colors.black,
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
     return Container(
       child:Text(query),
     );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection('Users').snapshots(),
      builder: (context , snapshot) {
        if (!snapshot.hasData) return new Text("Loading..");
        final results = snapshot.data.documents.where((DocumentSnapshot a) =>
            a.data()['name'].toString().startsWith(query));
        return ListView(
          children:
          results.map<Widget>((a) => ListTile(
            title:Text(a.data()['name'].toString(),style: TextStyle(fontWeight:FontWeight.w300),),
            onTap: () {
                Navigator.push(
                  context,MaterialPageRoute(builder:(context)=> User_profile(/*a.data()['name'].toString(),a.data()['Bio'].toString()),*/),),
                );
            },
          ),
              ).toList(),
        );
      }
    );
  }
}
