import 'package:dinder/screens/authentication_screen/authentication_screen.dart';
import 'package:dinder/theme/main_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'bloc/profile_bloc.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileBloc>(
      create: (context) => ProfileBloc(),
      child: Scaffold(
        body: BlocBuilder<ProfileBloc, ProfileState>(
          // ignore: missing_return
          builder: (context, state) {
            return _buildProfileScreen(context);
          },
        ),
      ),
    );
  }

  Widget _buildProfileScreen(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              child: CircleAvatar(
                radius: 75.0,
                child: ClipRRect(
                  child: SvgPicture.asset("lib/images/default_avatar_men.svg"),
                  borderRadius: BorderRadius.circular(80.0),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Column(
            children: [
              Text(
                "Zulfkhar Maukey",
                style: TextStyle(
                  color: ColorPalette.textBody,
                  fontSize: 30,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Text(
                "Computer Science, 2024",
                style: TextStyle(
                  color: ColorPalette.textBody,
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            height: 100,
            width: MediaQuery.of(context).size.width - 30,
            decoration: BoxDecoration(
              color: ColorPalette.lightBackground,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 1,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "12",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 27,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Swipes",
                      style: TextStyle(color: ColorPalette.textBody),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "63",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 27,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Flex",
                      style: TextStyle(color: ColorPalette.textBody),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "535.6",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 27,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Campus",
                      style: TextStyle(color: ColorPalette.textBody),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "2400",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 27,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Falcon",
                      style: TextStyle(color: ColorPalette.textBody),
                    ),
                  ],
                ),
                SizedBox(
                  width: 1,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 30,
            child: CupertinoButton(
              color: Colors.teal,
              child: Center(
                child: Text("Logout"),
              ),
              borderRadius: BorderRadius.circular(8),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AuthenticationScreen()),
                  (Route<dynamic> route) => false,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
