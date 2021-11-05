import 'package:dinder/screens/authentication_screen/authentication_screen.dart';
import 'package:dinder/theme/main_theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());
//
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dinder",
      theme: defaultTheme,
      debugShowCheckedModeBanner: false,
      home: AuthenticationScreen(),
    );
  }
}
