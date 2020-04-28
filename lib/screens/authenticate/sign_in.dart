import 'package:firebase_sample_app/services/auth.dart';
import 'package:firebase_sample_app/shared/authHeaderFormRow.dart';
import 'package:firebase_sample_app/shared/authPrimaryButton.dart';
import 'package:firebase_sample_app/shared/constants.dart';
import 'package:firebase_sample_app/shared/loading.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool _loading = false;

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return _loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.brown[100],
            appBar: _buildAppBar(),
            body: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 32.0, vertical: 0.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const AuthHeaderRowForm(),
                      Form(
                        key: _formKey,
                        // child: Column(
                        child: Column(
                          children: [
                            SizedBox(height: 20.0),
                            _buildEmailInput(),
                            SizedBox(height: 20.0),
                            _buildPasswordInput(context),
                            SizedBox(height: 20.0),
                            _buildAuthPrimaryButton(),
                            SizedBox(height: 12.0),
                            _buildErrorText(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }

  PrimaryButton _buildAuthPrimaryButton() {
    return PrimaryButton(
      title: "Sign In",
      onPressed: () async {
        if (_formKey.currentState.validate()) {
          setState(() => _loading = true);

          dynamic result =
              await _auth.signInWithEmailAndPassword(email, password);

          if (result == null) {
            if (this.mounted) {
              setState(() {
                error = 'Please enter a valid email';
                _loading = false;
              });
            }
          }
        }
      },
    );
  }

  TextFormField _buildEmailInput() {
    return TextFormField(
      decoration: textInputDecoration.copyWith(hintText: 'Email'),
      validator: (val) => val.isEmpty ? 'Email an email' : null,
      onChanged: (val) => setState(() => email = val.trim()),
    );
  }

  TextFormField _buildPasswordInput(BuildContext context) {
    return TextFormField(
      decoration: textInputDecoration.copyWith(
        hintText: 'Password',
      ),
      validator: (val) =>
          val.length < 6 ? 'Enter a password 6+ chars long' : null,
      obscureText: true,
      onChanged: (val) => setState(() => password = val),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.brown[400],
      elevation: 0.0,
      title: Text("Sign in"),
      actions: [
        FlatButton.icon(
          onPressed: () {
            widget.toggleView();
          },
          icon: Icon(Icons.person),
          label: Text("Register"),
        ),
      ],
    );
  }

  Text _buildErrorText() {
    return Text(
      error,
      style: TextStyle(color: Colors.red, fontSize: 14.0),
    );
  }
}
