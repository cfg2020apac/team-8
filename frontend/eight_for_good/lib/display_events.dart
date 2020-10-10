import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'event_details.dart';
import 'dart:async';
import 'login_page.dart';


class EventPage extends StatelessWidget {
final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();



 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text(
                'Events',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              
            ),
       body: SingleChildScrollView(
         child: Column(
           children: <Widget>[
             Center(child: Container(
               padding: EdgeInsets.all(20),
               child: Column(children: <Widget>[
                 for (var i=0;i<10; i++)
                    _eventcardgenerator(context, i)
               ],)
             ),)
           ],
         )),
     );
 }

Widget _eventcardgenerator(BuildContext context, int index){
  return Card(
    semanticContainer: true,
    margin: EdgeInsets.only(bottom: 30),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 10,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        splashColor: Colors.green.withAlpha(30),
        onTap:(){
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => EventDet(userid: user.id, event: events[index])),
          );
        },
        child: Container(
        width: 500,
        height: 400,
        child: Column(
          children: <Widget>[
            Container(
              width: 500,
              height: 200,
              padding: EdgeInsets.all(0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
                color: Colors.blue.withAlpha(70),
              ),

            child: Image.network(events[index].img),

            ),
            Container(padding: EdgeInsets.all(25),
              child:
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
           Text(events[index].title, textScaleFactor: 2,),
              ],),),

              Container(padding: EdgeInsets.all(12),
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround
              ,children: <Widget>[ 
            Text(events[index].date, textScaleFactor: 1,),
            Text(events[index].time, textScaleFactor: 1,),],),
              )

            
            ],)
            )
          ),
        
        
  
  );
}  
}



User user = User(id: 1, username: "hitesh", name: "hitesh", roleType: "V", email: "agarwal", date: "12/12/2020", eventsSigned: [], birthdate: "16/11/2020");
Event event1 = Event(id: 1, title: "Plastic-Less July", date: "10/03/2019", time:"08:30AM", desc: "Plastic-Less July is a programme that encourages reduced usage of plastic. Together with our blossom friends, we can save the mother earth! Note that volunteers must be present for all the listed days.", img: "https://www.giving.sg/image/logo?img_id=8771842");
Event event2 = Event(id: 1, title: "Paper-less August", date: "9/06/2020", time:"09:30AM", desc: "Plastic-Less July is a programme that encourages reduced usage of plastic. Together with our blossom friends, we can save the mother earth! Note that volunteers must be present for all the listed days.", img: "https://images.squarespace-cdn.com/content/v1/59954067bebafbb309508e10/1572329237736-4KSXQSWCI9A3AIVMHWRJ/ke17ZwdGBToddI8pDm48kPTrHXgsMrSIMwe6YW3w1AZ7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z4YTzHvnKhyp6Da-NYroOW3ZGjoBKy3azqku80C789l0k5fwC0WRNFJBIXiBeNI5fKTrY37saURwPBw8fO2esROAxn-RKSrlQamlL27g22X2A/48950164023_d1dbdd7903_o.jpg?format=750w");
Event event3 = Event(id: 1, title: "Donate your clothes!", date: "8/09/2021", time:"10:30AM", desc: "Plastic-Less July is a programme that encourages reduced usage of plastic. Together with our blossom friends, we can save the mother earth! Note that volunteers must be present for all the listed days.", img: "https://images.squarespace-cdn.com/content/v1/59954067bebafbb309508e10/1575864511254-OAFUXZI2DDYPAV017ASK/ke17ZwdGBToddI8pDm48kKGMG_T2dgX0NJFcALqlXyB7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z5QPOohDIaIeljMHgDF5CVlOqpeNLcJ80NK65_fV7S1UVL0jRhgyMHyhtSo6MAUZ6nTWnx7_mK1ugGmWvkSIX_hjIjg7l_3EkjvTQ6EpWDFFA/DSC_3838.jpg?format=750w");

List events = [event1, event2, event3, event1, event2, event3, event1, event2, event3, event1];

