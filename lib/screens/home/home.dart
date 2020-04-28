import 'package:firebase_sample_app/models/brew.dart';
import 'package:firebase_sample_app/screens/home/brew_list.dart';
import 'package:firebase_sample_app/screens/home/settings_form.dart';
import 'package:firebase_sample_app/services/auth.dart';
import 'package:firebase_sample_app/services/databaseService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 32.0),
                child: SettingsForm());
          });
    }

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
            FlatButton.icon(
              icon: Icon(Icons.settings),
              label: Text("Settings"),
              onPressed: () => _showSettingsPanel(),
            )
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
