import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'bottom_navigation.dart';
import 'login_page.dart';

class VolunteerApp extends StatefulWidget {

User user;
List events;
VolunteerApp({@required this.user, @required this.events});

_VolunteerAppState createState() => _VolunteerAppState(user:user, events: events);

}

class _VolunteerAppState extends State<VolunteerApp>{

User user;
List events;
_VolunteerAppState({@required this.user, @required this.events});

 @override
 Widget build(BuildContext context) {
   return Scaffold(
     body: Home(user: user, events: events),
   );
 }
}