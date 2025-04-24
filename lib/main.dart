import 'package:flutter/material.dart';
import 'package:main_quiz_app/controller/sqflite_controller.dart';
import 'package:main_quiz_app/view/Splashscreen/splashscreen.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => SqfliteController(),
    )
  ], child: Myapp()));
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
