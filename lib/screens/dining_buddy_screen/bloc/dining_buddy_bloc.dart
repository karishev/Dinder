import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dinder/data/explore_json.dart';
import 'package:equatable/equatable.dart';

part 'dining_buddy_event.dart';
part 'dining_buddy_state.dart';

class DiningBuddyBloc extends Bloc<DiningBuddyEvent, DiningBuddyState> {
  DiningBuddyBloc() : super(TakerChosenState());
  bool toggleValue = false;
  Person currentUser;

  @override
  Stream<DiningBuddyState> mapEventToState(
    DiningBuddyEvent event,
  ) async* {
    if (event is AppLaunchedEvent) {
      yield* _loadData();
    } else if (event is GiverChosenEvent) {
      toggleValue = !toggleValue;
      yield GiverChosenState();
    } else if (event is TakerChosenEvent) {
      toggleValue = !toggleValue;
      yield TakerChosenState();
    } else if (event is UserLikedEvent) {
      yield UserLikedState();
    } else if (event is UserDislikedEvent) {
      yield UserDisikedState();
    } else if (event is UserPressedLikeEvent) {
      yield UserPressedLikeState();
    } else if (event is UserPressedDislikeEvent) {
      yield UserPressedDislikeState();
    }
  }

  Stream<DiningBuddyState> _loadData() async* {
    // load data from firebase
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
          age: 19,
          name: 'Max',
          surname: 'Sat',
          imageUrl: explore_json[3]['img']),
      Person(
          age: 19,
          name: 'Max',
          surname: 'Sat',
          imageUrl: explore_json[3]['img']),
      Person(
          age: 19,
          name: 'Max',
          surname: 'Sat',
          imageUrl: explore_json[3]['img']),
      Person(
          age: 19,
          name: 'Max',
          surname: 'Sat',
          imageUrl: explore_json[3]['img']),
    ];
    yield AppLaunchedState(loadedPeople: people);
  }
}
