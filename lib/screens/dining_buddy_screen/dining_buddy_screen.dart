import 'dart:math' show pi;
import 'package:dinder/data/explore_json.dart';
import 'package:dinder/data/icons.dart';
import 'package:dinder/models/message.dart';
import 'package:dinder/screens/message/messages.dart';
import 'package:dinder/screens/message/widget/pageTurn.dart';
import 'package:dinder/theme/main_theme.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rolling_switch/rolling_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/dining_buddy_bloc.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';

List<Person> people = [];

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
      create: (context) => DiningBuddyBloc()..add(AppLaunchedEvent()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorPalette.background,
          actions: [
            IconButton(
              onPressed: () {pageTurn(Messages(), context); },
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

            if (state is AppLaunchedState) {
              people = state.loadedPeople;
            }
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
              text: Text('Hungry'),
            ),
            rollingInfoLeft: const RollingIconInfo(
              backgroundColor: Colors.blueAccent,
              icon: Icons.monetization_on,
              text: Text('Have swipes'),
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
