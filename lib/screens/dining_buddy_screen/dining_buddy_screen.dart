import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/dining_buddy_bloc.dart';

class DiningBuddyScreen extends StatefulWidget {
  @override
  _DiningBuddyScreenState createState() => _DiningBuddyScreenState();
}

class _DiningBuddyScreenState extends State<DiningBuddyScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DiningBuddyBloc>(
      create: (context) => DiningBuddyBloc(),
      child: Scaffold(
        body: BlocBuilder<DiningBuddyBloc, DiningBuddyState>(
          builder: (context, state) {
            return Container();
          },
        ),
      ),
    );
  }
}
