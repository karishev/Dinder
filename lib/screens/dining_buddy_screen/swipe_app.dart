import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_swipable/flutter_swipable.dart';

class SwipeCard extends StatelessWidget {
  final String imageUrl;

  SwipeCard({this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Swipable(
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage(imageUrl), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
      onSwipeLeft: (offset) {
        print('swiped left');
      },
      onSwipeRight: (offset) {
        print('swiped right');
      },
    );
  }
}
