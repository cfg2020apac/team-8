import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'display_events.dart';
import 'profile.dart';
import 'chat.dart';
import 'login_page.dart';

class Home extends StatefulWidget {
 User user;
 List events;

Home({@required this.user, @required this.events});

 _HomeState createState() => _HomeState(user: user, events: events);
}

class _HomeState extends State<Home> {
  
    User user;
    List events;
    _HomeState({@required this.user, @required this.events});
  
  int _currentIndex = 0;
  final List<Widget> _children = [
   EventPage(),
   Chat(),
   Profile(),
  ];
 @override
 Widget build(BuildContext context) {
   return Scaffold(
     body: _children[_currentIndex], // new
     bottomNavigationBar: BottomNavigationBar(
       onTap: onTabTapped, // new
       currentIndex: _currentIndex, // new
       items: [
         new BottomNavigationBarItem(
           icon: Icon(Icons.home),
           title: Text('Events'),
         ),
         new BottomNavigationBarItem(
           icon: Icon(Icons.mail),
           title: Text('Notifications'),
         ),
         new BottomNavigationBarItem(
           icon: Icon(Icons.person),
           title: Text('Rewards')
         )
       ],
     ),
   );
 }

void onTabTapped(int index) {
   setState(() {
     _currentIndex = index;
   });
 }

}
