import 'package:cloud_firestore/cloud_firestore.dart';

class Chat {
  String name, photoURL, lastMessagePhoto, lastMessage;
  Timestamp timestamp;
  Chat({
    this.name,
    this.photoURL,
    this.lastMessagePhoto,
    this.lastMessage,
    this.timestamp,
  });
}
