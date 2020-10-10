import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';

class EventDet extends StatefulWidget {
 int userid;
 Event event;

 EventDet({this.userid, this.event});

 @override
 _EventDet createState() => _EventDet(userid: userid, event:event);
}

class _EventDet extends State<EventDet>{

  int userid;
  Event event;

  _EventDet({@required this.userid, @required this.event});

 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(title: Text('Register'),),
     body: Card(
    semanticContainer: true,
    //margin: EdgeInsets.only(bottom: 30),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 10,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        splashColor: Colors.green.withAlpha(30),
        child: Center(child:Container(
        width: 300,
        height: 750,
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

            child: Image.network(event.img),

            ),
            Container(padding: EdgeInsets.all(25),
              child:
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
           Text(event.title, textScaleFactor: 2.0,),
              ],),),

              Container(padding: EdgeInsets.all(10),
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround
              ,children: <Widget>[ 
            Text(event.date, textScaleFactor: 1.5,),
            Text(event.time, textScaleFactor: 1.5,),
            ],),
              ),
              Container(padding: EdgeInsets.all(20),
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround
              ,children: <Widget>[ 
                Container(padding: EdgeInsets.all(5),
              child:
            Text(event.desc, textScaleFactor: 1,),
            ),
            const SizedBox(height: 30),
          RaisedButton(
            onPressed: (){
                    Navigator.pop(context);
                  },
            textColor: Colors.white,
            padding: const EdgeInsets.all(0.0),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFF0D47A1),
                    Color(0xFF1976D2),
                    Color(0xFF42A5F5),
                  ],
                ),
              ),
              padding: const EdgeInsets.all(10.0),
              child:
                  const Text('Register Now', style: TextStyle(fontSize: 20)),
            ),)
            
            ],),
              
              )


            
            ],)
            )
      )
          ),
        
        
     ),
  );
}  
}
