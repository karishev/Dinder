import 'dart:math' show pi;
import 'package:dinder/data/explore_json.dart';
import 'package:dinder/data/icons.dart';
import 'package:dinder/theme/main_theme.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rolling_switch/rolling_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/dining_buddy_bloc.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';

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
  Person(
      age: 19, name: 'Max', surname: 'Sat', imageUrl: explore_json[3]['img']),
  Person(
      age: 19, name: 'Max', surname: 'Sat', imageUrl: explore_json[3]['img']),
  Person(
      age: 19, name: 'Max', surname: 'Sat', imageUrl: explore_json[3]['img']),
];

class DiningBuddyScreen extends StatefulWidget {
  DiningBuddyScreen({Key key}) : super(key: key);

  @override
  _DiningBuddyScreenState createState() => _DiningBuddyScreenState();
}

class _DiningBuddyScreenState extends State<DiningBuddyScreen> {
  CardController controller;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DiningBuddyBloc>(
      create: (context) => DiningBuddyBloc(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorPalette.background,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.send,
                color: ColorPalette.tabbarText,
              ),
            ),
          ],
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'lib/images/app_logo.png',
                fit: BoxFit.fitHeight,
                height: 30,
              ),
            ],
          ),
        ),
        body: BlocBuilder<DiningBuddyBloc, DiningBuddyState>(
          builder: (context, state) {
            print(state);
            if (state is UserLikedState) {
            } else if (state is UserDislikedEvent) {}
            return _buildBody(context);
          },
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 130,
          height: 45,
          child: RollingSwitch.icon(
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
        new Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.55,
            child: new TinderSwapCard(
              animDuration: 400,
              swipeUp: false,
              swipeDown: false,
              orientation: AmassOrientation.BOTTOM,
              totalNum: people.length,
              stackNum: 3,
              swipeEdge: 4.0,
              maxWidth: MediaQuery.of(context).size.width * 0.9,
              maxHeight: MediaQuery.of(context).size.height * 0.6,
              minWidth: MediaQuery.of(context).size.width * 0.85,
              minHeight: MediaQuery.of(context).size.height * 0.59,
              cardBuilder: (context, index) => Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: ColorPalette.lightBackground,
                      spreadRadius: 2,
                      blurRadius: 10,
                      // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(people[index].imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 20),
                        Text(
                          people[index].name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          people[index].getAge(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(width: 20),
                        Text(
                          people[index].getMajor(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              cardController: controller = CardController(),
              swipeUpdateCallback:
                  (DragUpdateDetails details, Alignment align) {
                /// Get swiping card's alignment
                if (align.x < 0) {
                  //Card is LEFT swiping
                } else if (align.x > 0) {
                  //Card is RIGHT swiping
                }
              },
              swipeCompleteCallback:
                  (CardSwipeOrientation orientation, int index) {
                /// Get orientation & index of swiped card!
                if (orientation == CardSwipeOrientation.LEFT) {
                  _swipeLeft(context);
                } else if (orientation == CardSwipeOrientation.RIGHT) {
                  _swipeRight(context);
                }
              },
            ),
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
                    ),
                  ]),
              child: IconButton(
                icon: SvgPicture.asset(
                  icons[index]['icon'],
                  width: icons[index]['icon_size'],
                ),
                onPressed: () {
                  if (index == 0) {
                    controller.triggerLeft();
                  } else if (index == 1) {
                    // TODO: disliked the card
                    controller.triggerRight();
                  }
                },
              ),
            );
          }),
        ),
      ],
    );
  }

  _swipeLeft(BuildContext context) {
    print('dislike');
    BlocProvider.of<DiningBuddyBloc>(context)..add(UserDislikedEvent());
  }

  _swipeRight(BuildContext context) {
    print('like');
    BlocProvider.of<DiningBuddyBloc>(context)..add(UserLikedEvent());
  }
}
