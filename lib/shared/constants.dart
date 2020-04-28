import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(horizontal: 36.0, vertical: 18.0),
  fillColor: Colors.white,
  filled: true,
  border: const OutlineInputBorder(
    borderRadius: BorderRadius.all(const Radius.circular(50.0)),
  ),
  enabledBorder: const OutlineInputBorder(
    borderRadius: BorderRadius.all(const Radius.circular(50.0)),
    borderSide: BorderSide(color: Colors.white, width: 1.0),
  ),
  focusedBorder: const OutlineInputBorder(
    borderRadius: BorderRadius.all(const Radius.circular(50.0)),
    borderSide: BorderSide(color: Colors.blue, width: 1.0),
  ),
);
