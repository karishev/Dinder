import 'dart:async';
import 'dart:math' show pi;
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

List<Person> people = [
  Person(
      age: 17,
      name: 'Akhat',
      surname: 'Suleimenov',
      major: Major.computerScience,
      imageUrl: explore_json[0]['img']),
  Person(
      age: 23,
      name: 'China',
      surname: 'Karishev',
      major: Major.business,
      imageUrl: explore_json[1]['img']),
  Person(
      age: 20,
      name: 'Makha',
      surname: 'Familya',
      major: Major.math,
      imageUrl: explore_json[2]['img']),
  Person(
      age: 19, name: 'Max', surname: 'Sat', imageUrl: explore_json[3]['img']),
];

class DiningBuddyScreen extends StatefulWidget {
  DiningBuddyScreen({Key key}) : super(key: key);

  @override
  _DiningBuddyScreenState createState() => _DiningBuddyScreenState();
}

class _DiningBuddyScreenState extends State<DiningBuddyScreen> {
  List<SwipeCard> cards = [
    SwipeCard(person: people[0]),
    SwipeCard(person: people[1]),
    SwipeCard(person: people[2]),
    SwipeCard(person: people[3]),
  ];
  int current = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    current = cards.length - 1;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DiningBuddyBloc>(
      create: (context) => DiningBuddyBloc(),
      child: Scaffold(
        body: BlocBuilder<DiningBuddyBloc, DiningBuddyState>(
          builder: (context, state) {
            if (state is UserPressedLikeState) {
              print(pi);
              cards[current].swipe.add((-1) * pi / 90);
              current -= 1;
            } else if (state is UserPressedDislikeState) {
              cards[current].swipe.add(pi);
              current -= 1;
            }
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
                  onPressed: () {
                    if (index == 0) {
                      // TODO: return the card
                    } else if (index == 1) {
                      // TODO: disliked the card
                      BlocProvider.of<DiningBuddyBloc>(context)
                        ..add(UserPressedDislikeEvent());
                    } else if (index == 2) {
                      // TODO: favour the card
                    } else if (index == 3) {
                      // TODO: liked the card
                      BlocProvider.of<DiningBuddyBloc>(context)
                        ..add(UserPressedLikeEvent());
                    } else if (index == 4) {
                      // TODO: superliked the card
                    }
                  },
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
