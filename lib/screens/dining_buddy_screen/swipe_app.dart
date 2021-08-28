import 'dart:async';

import 'package:dinder/data/explore_json.dart';
import 'package:dinder/screens/dining_buddy_screen/bloc/dining_buddy_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rolling_switch/rolling_switch.dart';

class SwipeCard extends StatelessWidget {
  final Person person;
  StreamController<double> swipe = StreamController<double>();

  SwipeCard({this.person});

  @override
  Widget build(BuildContext context) {
    return Container();
    // return Swipable(
    //   swipe: swipe.stream,
    //   child: Center(
    //     child: Container(
    //       decoration: BoxDecoration(
    //         image: DecorationImage(
    //             image: AssetImage(person.imageUrl), fit: BoxFit.cover),
    //         borderRadius: BorderRadius.circular(18),
    //       ),
    //     ),
    //   ),
    //   onSwipeLeft: (offset) {
    //     _swipeLeft(context);
    //   },
    //   onSwipeRight: (offset) {
    //     _swipeRight(context);
    //   },
    //   onSwipeUp: (offset) {
    //     _swipeRight(context);
    //   },
    //   onSwipeDown: (offset) {
    //     _swipeLeft(context);
    //   },
    // );
  }

  Widget _swipeLeft(BuildContext context) {
    print('left');
    BlocProvider.of<DiningBuddyBloc>(context)..add(UserDislikedEvent());
    return Container(
      width: 130,
      height: 50,
      child: RollingSwitch.icon(
        enableDrag: false,
        onChanged: (bool takerChosen) {
          if (takerChosen) {
            BlocProvider.of<DiningBuddyBloc>(context)..add(TakerChosenEvent());
          } else {
            BlocProvider.of<DiningBuddyBloc>(context)..add(GiverChosenEvent());
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
    );
  }

  _swipeRight(BuildContext context) {
    print('right');
    BlocProvider.of<DiningBuddyBloc>(context)..add(UserLikedEvent());
  }
}
