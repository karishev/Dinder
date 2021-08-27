part of 'dining_buddy_bloc.dart';

abstract class DiningBuddyState extends Equatable {
  final int toggleValue;
  DiningBuddyState({this.toggleValue});

  @override
  List<Object> get props => [toggleValue];
}

class TakerChosenState extends DiningBuddyState {}

class GiverChosenState extends DiningBuddyState {}

class UserLikedState extends DiningBuddyState {}

class UserDisikedState extends DiningBuddyState {}

class UserPressedLikeState extends DiningBuddyState {}

class UserPressedDislikeState extends DiningBuddyState {}
