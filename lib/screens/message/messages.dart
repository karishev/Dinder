import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dinder/models/message.dart';
import 'package:dinder/repositories/messageRepository.dart';
import 'package:dinder/screens/message/bloc/message_bloc.dart';
import 'package:dinder/screens/message/widget/chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Messages extends StatefulWidget {
  final String userID;
  const Messages({this.userID});

  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  MessageRepository _messagesRepository = MessageRepository();
  MessageBloc _messageBloc;

  @override
  void initState() {
    _messageBloc = MessageBloc(messageRepository: _messagesRepository);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MessageBloc, MessageState>(
      bloc: _messageBloc,
      builder: (BuildContext context, MessageState state) {
        if (state is MessageInitialState) {
          _messageBloc.add(ChatStreamEvent(currentUserID: widget.userID));
        }
        if (state is ChatLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ChatLoadedState) {
          Stream<QuerySnapshot> chatStream = state.chatStream;

          return StreamBuilder<QuerySnapshot>(
            stream: chatStream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Text("No data");
              }

              if (snapshot.data.documents.isNotEmpty) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ChatWidget(
                        creationTime:
                            snapshot.data.documents[index].data['timestamp'],
                        userID: widget.userID,
                        selectedUserID:
                            snapshot.data.documents[index].documentID,
                      );
                    },
                  );
                }
              } else
                return Text(
                  " You don't have any conversations",
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                );
            },
          );
        }
        return Container();
      },
    );
  }
}
