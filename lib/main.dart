import 'package:chat_messager/constants/colors.dart';
import 'package:chat_messager/ui/pages/pages.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(kPrimaryColor),
        scaffoldBackgroundColor: Color(kPrimaryColor),
        textTheme: TextTheme(
          headline1: TextStyle(
            color: Color(kSecondaryColor),
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
          headline2: TextStyle(
            color: Color(kSecondaryColor),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          headline3: TextStyle(
            color: Color(kPrimaryColor),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          bodyText1: TextStyle(
            color: Color(kSecondaryColor),
            fontSize: 14,
            fontWeight: FontWeight.w300,
          ),
          overline: TextStyle(
            color: Color(kDisableColor),
            fontSize: 14,
          ),
          caption: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}
