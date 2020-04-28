import 'package:firebase_sample_app/models/brew.dart';
import 'package:firebase_sample_app/screens/home/brew_list.dart';
import 'package:firebase_sample_app/services/auth.dart';
import 'package:firebase_sample_app/services/databaseService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          title: Text("Home"),
          actions: [
            FlatButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(Icons.person),
              label: Text("Logout"),
            ),
          ],
        ),
        body: BrewList(),
        // body: Center(
        //   child: Container(
        //     child: RaisedButton(
        //       child: Text("Sign out"),
        //       onPressed: () async {
        //         await AuthService().signOut();
        //       },
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
