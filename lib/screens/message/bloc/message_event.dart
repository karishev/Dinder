part of 'message_bloc.dart';

abstract class MessageEvent extends Equatable {
  const MessageEvent();

  @override
  List<Object> get props => [];
}

class ChatStreamEvent extends MessageEvent {
  final String currentUserID;

  ChatStreamEvent({this.currentUserID});

  @override
  List<Object> get props => [currentUserID];
}