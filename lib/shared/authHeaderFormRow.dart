import 'package:flutter/material.dart';

class AuthHeaderRowForm extends StatelessWidget {
  const AuthHeaderRowForm({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Row build");
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(
          child: Image.asset(
            'assets/logos/firebase_logo.png',
            height: 150,
          ),
        ),
        // Spacer(),
        Flexible(
          flex: 3,
          child: Text(
            'Firebase\nSample.',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32.0,
            ),
          ),
        ),
      ],
    );
  }
}
