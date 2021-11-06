import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatScreen extends StatefulWidget {
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedUser;
  @override

  void initState() {
    getCurrenUser();
  }

  void getCurrenUser() async{
    try {
      final user = await _auth.currentUser();
      if (user!=null) {
        loggedUser = user;
        print(loggedUser);
      }
    } catch(e) {
      print(e);
    }
  }

  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: Text("wdsad"),),
            ],
          )
        ],
      ),      
    );
  }
}