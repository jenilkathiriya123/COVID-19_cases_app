import 'package:cowid_23_app/screen/Home_page.dart';
import 'package:cowid_23_app/screen/Login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        '/': (context) => HomePage(),
        'login': (context) => login(),
      },
    ),
  );
}
