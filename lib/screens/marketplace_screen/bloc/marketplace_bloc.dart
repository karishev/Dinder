import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'marketplace_event.dart';
part 'marketplace_state.dart';

class MarketplaceBloc extends Bloc<MarketplaceEvent, MarketplaceState> {
  MarketplaceBloc() : super(MarketplaceInitial());

  @override
  Stream<MarketplaceState> mapEventToState(
    MarketplaceEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
