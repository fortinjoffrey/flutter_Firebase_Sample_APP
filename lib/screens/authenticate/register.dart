import 'package:firebase_sample_app/services/authService.dart';
import 'package:firebase_sample_app/shared/AuthHeaderFormRow.dart';
import 'package:firebase_sample_app/shared/primaryButton.dart';
import 'package:firebase_sample_app/shared/constants.dart';
import 'package:firebase_sample_app/shared/loading.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool _loading = false;

  String username = '';
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    print('build called');
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
                        child: Column(
                          children: [
                            SizedBox(height: 20.0),
                            _buildUsernameInput(),
                            SizedBox(height: 20.0),
                            _buildEmailInput(),
                            SizedBox(height: 20.0),
                            _buildPasswordInput(),
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

  TextFormField _buildUsernameInput() {
    return TextFormField(
      decoration: textInputDecoration.copyWith(hintText: 'Username'),
      validator: (val) => val.isEmpty ? 'Enter a username' : null,
      onChanged: (val) => setState(() => username = val),
    );
  }

  TextFormField _buildEmailInput() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: textInputDecoration.copyWith(hintText: 'Email'),
      validator: (val) => val.isEmpty ? 'Enter an email' : null,
      onChanged: (val) => setState(() => email = val),
    );
  }

  TextFormField _buildPasswordInput() {
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

  PrimaryButton _buildAuthPrimaryButton() {
    return PrimaryButton(
      title: "Sign Up",
      onPressed: () async {
        if (_formKey.currentState.validate()) {
          setState(() => _loading = true);

          dynamic result = await _auth.registerWithEmailAndPassword(
              email, password, username);

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

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.brown[400],
      elevation: 0.0,
      title: Text("Sign up"),
      actions: [
        FlatButton.icon(
          onPressed: () {
            widget.toggleView();
          },
          icon: Icon(Icons.person),
          label: Text("Sign in"),
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
