part of 'dining_buddy_bloc.dart';

abstract class DiningBuddyEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class TakerChosenEvent extends DiningBuddyEvent {}

class GiverChosenEvent extends DiningBuddyEvent {}

class UserLikedEvent extends DiningBuddyEvent {}

class UserDislikedEvent extends DiningBuddyEvent {}
