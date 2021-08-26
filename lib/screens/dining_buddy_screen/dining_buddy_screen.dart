import 'package:dinder/data/explore_json.dart';
import 'package:dinder/data/icons.dart';
import 'package:dinder/screens/dining_buddy_screen/swipe_app.dart';
import 'package:dinder/theme/main_theme.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rolling_switch/rolling_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/dining_buddy_bloc.dart';

class DiningBuddyScreen extends StatefulWidget {
  DiningBuddyScreen({Key key}) : super(key: key);

  @override
  _DiningBuddyScreenState createState() => _DiningBuddyScreenState();
}

class _DiningBuddyScreenState extends State<DiningBuddyScreen> {
  List<SwipeCard> cards = [
    SwipeCard(imageUrl: explore_json[0]['img']),
    SwipeCard(imageUrl: explore_json[1]['img']),
    SwipeCard(imageUrl: explore_json[2]['img']),
    SwipeCard(imageUrl: explore_json[3]['img']),
    SwipeCard(imageUrl: explore_json[4]['img']),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DiningBuddyBloc>(
      create: (context) => DiningBuddyBloc(),
      child: Scaffold(
        body: BlocBuilder<DiningBuddyBloc, DiningBuddyState>(
          builder: (context, state) {
            return _buildBody(context);
          },
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 130,
            height: 50,
            child: RollingSwitch.icon(
              enableDrag: false,
              onChanged: (bool takerChosen) {
                if (takerChosen) {
                  BlocProvider.of<DiningBuddyBloc>(context)
                    ..add(TakerChosenEvent());
                } else {
                  BlocProvider.of<DiningBuddyBloc>(context)
                    ..add(GiverChosenEvent());
                }
              },
              rollingInfoRight: const RollingIconInfo(
                backgroundColor: Colors.greenAccent,
                icon: Icons.free_breakfast,
                text: Text('Taker'),
              ),
              rollingInfoLeft: const RollingIconInfo(
                backgroundColor: Colors.blueAccent,
                icon: Icons.monetization_on,
                text: Text(
                  'Giver',
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 5,
                      spreadRadius: 2),
                ]),
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.6,
            child: Stack(
              children: cards,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(icons.length, (index) {
              return Container(
                width: icons[index]['size'],
                height: icons[index]['size'],
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorPalette.borderColor,
                    boxShadow: [
                      BoxShadow(
                        color: ColorPalette.lightBackground,
                        spreadRadius: 5,
                        blurRadius: 10,
                        // changes position of shadow
                      ),
                    ]),
                child: IconButton(
                  icon: SvgPicture.asset(
                    icons[index]['icon'],
                    width: icons[index]['icon_size'],
                  ),
                  onPressed: () {},
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
