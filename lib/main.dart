import 'package:flutter/material.dart';
import 'package:main_quiz_app/view/Splashscreen/splashscreen.dart';

void main(List<String> args) {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),
    );
  }
}

String Username = '';
String email = '';
String password = '';
String Phonenumber = '';
