import 'package:dinder/screens/nav_bar_app/nav_bar_app.dart';
import 'package:dinder/theme/main_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/authorization_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String _currentMajor = "Math";
  final _majors = ["Computer Science", "Math"];

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthorizationBloc>(
      create: (context) => AuthorizationBloc()..add(SignupScreenOpenEvent()),
      child: Scaffold(
        body: BlocBuilder<AuthorizationBloc, AuthorizationState>(
          // ignore: missing_return
          builder: (context, state) {
            return _buildSignupScreen(context);
          },
        ),
      ),
    );
  }

  Widget _buildSignupScreen(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SvgPicture.network(
            'https://www.logo.wine/a/logo/Tinder_(app)/Tinder_(app)-Logo.wine.svg',
            height: 50,
          ),
          SizedBox(height: 100),
          Column(
            children: [
              _textField(
                  label: "User Name",
                  hint: "Username should be only alphanumeric"),
              _textField(label: "Password", hint: "Enter a secure password"),
              dropdownField(),
              _textField(label: "Net Id", hint: "Enter your net id"),
              // Padding(
              //   padding: const EdgeInsets.all(20),
              //   child: TextField(
              //     style: TextStyle(color: ColorPalette.textBody),
              //     obscureText: true,
              //     decoration: InputDecoration(
              //       focusedBorder: new OutlineInputBorder(
              //         borderSide: BorderSide(color: Colors.white),
              //       ),
              //       labelText: 'Password',
              //       hintText: 'Enter your secure password',
              //       labelStyle: TextStyle(color: ColorPalette.textBody),
              //       hintStyle: TextStyle(color: ColorPalette.textBody),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 10,
              ),
              _button(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => NavBarApp()),
                      (Route<dynamic> route) => false,
                    );
                  },
                  width: 188,
                  height: 44,
                  text: "Register",
                  fontSize: 15,
                  isMainButton: true),
              _button(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  width: 133,
                  height: 44,
                  text: "Login",
                  fontSize: 12,
                  isMainButton: false),
              SizedBox(
                height: 130,
              ),
            ],
          ),
        ],
      ),
    );
  }

  TextButton _button(
      {Function onTap,
      double height,
      double width,
      String text,
      double fontSize,
      bool isMainButton}) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      minimumSize: Size(width, height),
      backgroundColor: isMainButton
          ? ColorPalette.tabbarBackground
          : ColorPalette.background,
      padding: const EdgeInsets.all(0),
    );
    return TextButton(
      style: flatButtonStyle,
      onPressed: onTap,
      child: Text(
        text,
        style: TextStyle(color: ColorPalette.textBody, fontSize: fontSize),
      ),
    );
  }

  Widget _textField({String label, String hint}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: TextField(
        style: TextStyle(color: ColorPalette.textBody),
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          labelStyle: TextStyle(color: ColorPalette.textBody),
          hintStyle: TextStyle(color: ColorPalette.textBody),
          focusedBorder: new OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget dropdownField() {
    return Container(
      child: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: ColorPalette.darkerBackground,
        ),
        child: Container(
          height: 60,
          width: MediaQuery.of(context).size.width - 40,
          child: DropdownButton<String>(
            underline: Container(
              height: 3,
              width: MediaQuery.of(context).size.width - 40,
              color: ColorPalette.darkerBackground,
            ),
            focusColor: ColorPalette.background,
            value: _currentMajor,
            elevation: 0,
            style: TextStyle(color: ColorPalette.textBody),
            iconSize: 0,
            items: _majors.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(color: ColorPalette.textBody),
                ),
              );
            }).toList(),
            hint: Text(
              "Please choose your major",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            onChanged: (String value) {
              setState(() {
                _currentMajor = value;
              });
            },
          ),
        ),
      ),
    );
  }
}
