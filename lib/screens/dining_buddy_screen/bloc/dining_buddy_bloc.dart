import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'dining_buddy_event.dart';
part 'dining_buddy_state.dart';

class DiningBuddyBloc extends Bloc<DiningBuddyEvent, DiningBuddyState> {
  DiningBuddyBloc() : super(TakerChosenState());
  bool toggleValue = false;

  @override
  Stream<DiningBuddyState> mapEventToState(
    DiningBuddyEvent event,
  ) async* {
    if (event is GiverChosenEvent) {
      toggleValue = !toggleValue;
      yield GiverChosenState();
    } else if (event is TakerChosenEvent) {
      toggleValue = !toggleValue;
      yield TakerChosenState();
    }
  }
}
