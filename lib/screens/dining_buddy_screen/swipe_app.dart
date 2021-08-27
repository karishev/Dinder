import 'dart:async';

import 'package:dinder/data/explore_json.dart';
import 'package:dinder/screens/dining_buddy_screen/bloc/dining_buddy_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swipable/flutter_swipable.dart';

class SwipeCard extends StatelessWidget {
  final Person person;
  StreamController<double> swipe = StreamController<double>();

  SwipeCard({this.person});

  @override
  Widget build(BuildContext context) {
    return Swipable(
      swipe: swipe.stream,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(person.imageUrl), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
      onSwipeLeft: (offset) {
        _swipeLeft(context);
      },
      onSwipeRight: (offset) {
        _swipeRight(context);
      },
    );
  }

  _swipeLeft(BuildContext context) {
    print('left');
    BlocProvider.of<DiningBuddyBloc>(context)..add(UserDislikedEvent());
  }

  _swipeRight(BuildContext context) {
    print('right');
    BlocProvider.of<DiningBuddyBloc>(context)..add(UserDislikedEvent());
  }
}
