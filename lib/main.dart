import 'package:flutter/material.dart';
import 'package:movieratingwithtmdb/home.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      // ignore: prefer_const_literals_to_create_immutables
      routes: {
       
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
    );
  }
}
