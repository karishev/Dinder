import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dinder/models/user.dart';
import 'package:dinder/models/message.dart';

class MessageRepository {
  final Firestore _firestore;

  MessageRepository({Firestore firestore})
      : _firestore = firestore ?? Firestore.instance;

  Stream<QuerySnapshot> getChats({userID}) {
    return _firestore
        .collection('users')
        .document(userID)
        .collection('chats')
        .orderBy('timestamp', descending: true)
        .snapshots();
  }

  Future deleteChat({currentUserID, selectedUserID}) async {
    await _firestore
        .collection('users')
        .document(currentUserID)
        .collection('chats')
        .document(selectedUserID)
        .delete();
  }

  Future<User> getUserDetail({userID}) async {
    User _user = User();
    await _firestore.collection('users').document(userID).get().then((user) {
      _user.uid = user.documentID;
      _user.name = user['name'];
      _user.photo = user['photoURL'];
      _user.age = user['age'];
      _user.location = user['location'];
      _user.gender = user['gender'];
      _user.interestedIn = user['interestedIn'];
    });
    return _user;
  }

  Future<Message> getLastMessage({currentUserID, selectedUserID}) async {
    Message _message = Message();

    await _firestore
        .collection('users')
        .document(currentUserID)
        .collection('chats')
        .document(selectedUserID)
        .collection('messages')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .first
        .then((doc) async {
      await _firestore
          .collection('messages')
          .document(doc.documents.first.documentID)
          .get()
          .then((message) {
        _message.text = message['text'];
        _message.photoURL = message['photoURL'];
        _message.timestamp = message['timestamp'];
      });
    });

    return _message;
  }
}
