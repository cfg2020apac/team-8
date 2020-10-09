import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Event extends StatelessWidget {
final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
              backgroundColor: Colors.white,
              title: Center(
                child: Text(
                'Events',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              ),
            ),
       body: SingleChildScrollView(
         child: Column(
           children: <Widget>[
             Center(child: Container(),)
           ],
         )),
     );
 }
}