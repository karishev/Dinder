import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dinder/repositories/messageRepository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
// import '../message_screen.dart';

part 'message_event.dart';
part 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  MessageRepository _messageRepository;

  
  MessageBloc({@required MessageRepository messageRepository})
      : assert(messageRepository != null),
        _messageRepository = messageRepository, super(null);

   @override
  MessageState get initialState => MessageInitialState();

  @override
  Stream<MessageState> mapEventToState(
    MessageEvent event,
  ) async* {
    if (event is ChatStreamEvent) {
      yield* _mapStreamToState(currentUserID: event.currentUserID);
    }
  }

  Stream<MessageState> _mapStreamToState({String currentUserID}) async* {
    yield ChatLoadingState();

    Stream<QuerySnapshot> chatStream =
        _messageRepository.getChats(userID: currentUserID);
    yield ChatLoadedState(chatStream: chatStream);
  }
}
