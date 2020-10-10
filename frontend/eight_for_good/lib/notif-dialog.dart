import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class NotifDialog extends StatelessWidget {

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text("Our message to you")),
    body: Image.network('https://i.ibb.co/JBww01p/birthday-card.png'),
  );
}
}