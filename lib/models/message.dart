import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  String senderName, senderID, selectedUserID, text, photoURL;
  File photo;
  Timestamp timestamp;
  Message({
    this.senderName,
    this.senderID,
    this.selectedUserID,
    this.text,
    this.photoURL,
    this.photo,
    this.timestamp,
  });
}
