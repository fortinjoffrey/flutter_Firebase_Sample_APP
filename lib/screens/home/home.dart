import 'package:firebase_sample_app/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
