// ignore_for_file: prefer_const_constructors

import "package:flutter/material.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: Center(
          child: Text("Welcome to 30 days of flutter"),
        ),
      ),
    );
  }
}
