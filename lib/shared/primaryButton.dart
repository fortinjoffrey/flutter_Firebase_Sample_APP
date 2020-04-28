import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key key,
    this.onPressed,
    @required this.title,
  }) : super(key: key);

  final Function onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: double.infinity,
      height: 55.0,
      child: RaisedButton(
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
        onPressed: onPressed,
        padding: const EdgeInsets.all(0.0),
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(50.0),
        ),
      ),
    );
  }
}
