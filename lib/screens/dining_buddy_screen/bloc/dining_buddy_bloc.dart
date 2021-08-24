import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'dining_buddy_event.dart';
part 'dining_buddy_state.dart';

class DiningBuddyBloc extends Bloc<DiningBuddyEvent, DiningBuddyState> {
  DiningBuddyBloc() : super(DiningBuddyInitial());

  @override
  Stream<DiningBuddyState> mapEventToState(
    DiningBuddyEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
