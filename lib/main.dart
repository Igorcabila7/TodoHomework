import 'package:flutter/material.dart';
import 'package:todohomework/Pages/Home_Page.dart';
import 'package:todohomework/Pages/Theme/Darkmode.dart';
import 'package:todohomework/Pages/Theme/Lightmode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: lightmode,
      darkTheme: darkTheme,
      home:HomePage(),
    );
  }
}