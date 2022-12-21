import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screen/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "OpenSans",


        primaryColor: Colors.teal[800],
      ),
      home: homescreen(),
    );
  }
}
