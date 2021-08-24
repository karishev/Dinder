import 'package:dinder/screens/dining_buddy_screen/dining_buddy_screen.dart';
import 'package:dinder/theme/main_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/authorization_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthenticationScreen extends StatefulWidget {
  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthorizationBloc>(
      create: (context) => AuthorizationBloc(),
      child: Scaffold(
        body: BlocBuilder<AuthorizationBloc, AuthorizationState>(
          // ignore: missing_return
          builder: (context, state) {
            if (state is AuthorizationShowupState) {
              return _buildAuthorizationScreen(context);
            }
          },
        ),
      ),
    );
  }
}

Widget _buildAuthorizationScreen(BuildContext context) {
  return SafeArea(
    child: Column(
      children: [
        Expanded(
          child: SvgPicture.network(
              'https://www.logo.wine/a/logo/Tinder_(app)/Tinder_(app)-Logo.wine.svg'),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'User Name',
                  hintText: 'Enter valid mail id as abc@nyu.edu',
                  labelStyle: TextStyle(color: ColorPalette.textBody),
                  hintStyle: TextStyle(color: ColorPalette.textBody),
                  focusedBorder: new OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  focusedBorder: new OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  labelText: 'Password',
                  hintText: 'Enter your secure password',
                  labelStyle: TextStyle(color: ColorPalette.textBody),
                  hintStyle: TextStyle(color: ColorPalette.textBody),
                ),
              ),
            ),
            FlatButton(
              onPressed: () {},
              child: Text(
                'Forgot Password',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(10)),
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DiningBuddyScreen()));
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              height: 130,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('New User? ', style: TextStyle(color: Colors.white)),
                FlatButton(
                    onPressed: () {},
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            )
          ],
        ),
      ],
    ),
  );
}
