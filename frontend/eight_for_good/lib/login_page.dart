import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:eight_for_good/vol_home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'NewUser.dart';

class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState() => _LoginPageState();
}

class FirstTime extends StatefulWidget {
  @override
  _FirstTimeState createState() => _FirstTimeState();
}

class _FirstTimeState extends State<FirstTime> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, left: 20),
      child: Container(
        alignment: Alignment.topLeft,
        //color: Colors.red,
        height: 30,
        child: Row(
          children: <Widget>[
            Text(
              'Your first time?',
              style: TextStyle(
                fontSize: 12,
                color: Colors.black,
              ),
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Register()));
              },
              child: Text(
                'SIGN UP',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _myUsername = new TextEditingController();
  TextEditingController _myPassword = new TextEditingController();

  //bool loginfail = false;

  Widget radioButton(bool isSelected) => Container(
        width: 16.0,
        height: 16.0,
        padding: EdgeInsets.all(2.0),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2.0, color: Colors.black)),
        child: isSelected
            ? Container(
                width: double.infinity,
                height: double.infinity,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.black),
              )
            : Container(),
      );

  Widget build(BuildContext context) {
    return Scaffold(
            resizeToAvoidBottomPadding: false,
            backgroundColor: Colors.white,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: Container(),
                  flex: 5,
                ),
                Expanded(
                  flex: 15,
                  child: Container(
                    alignment: Alignment.center,
                    child:
                        Image(image: AssetImage("assets/blossom.jpeg")),
                  ),
                ),
                Spacer(),
                Expanded(
                  flex: 40,
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 275,
                          child: Card(
                            semanticContainer: true,
                            margin: EdgeInsets.only(right: 20, left: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            elevation: 10,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                width: 500,
                                margin: EdgeInsets.all(20),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      alignment: Alignment.center,
                                      height: 45,
                                      child: Text("Login",
                                          style: TextStyle(
                                              fontSize: 20,
                                              letterSpacing: .6,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Container(
                                      height: 80,
                                      padding: EdgeInsets.only(top: 10),
                                      child: TextField(
                                        controller: _myUsername,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: 'Username',
                                        ),
                                        onSubmitted: (String value) {
                                          _myUsername.text = value;
                                        },
                                      ),
                                    ),
                                    Container(
                                      height: 80,
                                      padding: EdgeInsets.only(top: 10),
                                      child: TextField(
                                        obscureText: true,
                                        controller: _myPassword,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: 'Password',
                                          //errorText: 'Username or password is incorrect!',
                                        ),
                                        onSubmitted: (String value) {
                                          _myPassword.text = value;
                                        },
                                      ),
                                    ),
                                    
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20, right: 20, left: 20),
                          height: 60,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Expanded(
                                flex: 75,
                                child: Container(
                                  color: Colors.white,
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        'Your first time?',
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.black,
                                        ),
                                      ),
                                      FlatButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Register()));
                                        },
                                        child: Text(
                                          'SIGN UP',
                                          style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.black,
                                          ),
                                          textAlign: TextAlign.right,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 25,
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Container(
                                    height: 40,
                                    child: RaisedButton(
                                      color: Colors.lightBlue,
                                      splashColor: Colors.white,
                                      child: const Text(
                                        'SIGN IN',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      VolunteerApp(user: user, events: events)));
                                        //User user = await fetchPost(_myUsername.text);
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                
              ],
            ),
          );
  }

}


class User{
  final int id;
  final String username;
  final String name;
  final String roleType;
  final String email;
  final String date;
  final List eventsSigned;
  final String birthdate;


  User(
    {
      this.id,
      this.username,
      this.name,
      this.roleType,
      this.email,
      this.date,
      this.eventsSigned,
      this.birthdate
    }
  );
}

User user = User(id: 1, username: "hitesh", name: "hitesh", roleType: "V", email: "agarwal", date: "12/12/2020", eventsSigned: [], birthdate: "16/11/2020");

class Event{
  final int id;
  final String title;
  final String date;
  final String time;
  final String desc;
  final String img;

  Event(
    {
      this.id,
      this.title,
      this.date,
      this.time,
      this.desc,
      this.img
    }
  );
}

Event event = Event(id: 1, title: "Plastic-Less July", date: "12/12/2019", time:"10:30AM", desc: "Plastic-Less July is a programme that encourages reduced usage of plastic. Together with our blossom friends, we can save the mother earth! Note that volunteers must be present for all the listed days.", img: "https://www.giving.sg/image/logo?img_id=8771842");

List events = [event, event, event, event, event, event, event, event, event, event];

/* 

Future<bool> getid(String uname, String pcode, BuildContext context) async {
  //print('entered');
  var routes;
  var weight;

final response1 = await http.get('https://forchange-7d138.web.app/?username=${uname}');
 
if (response1.statusCode == 200) {
    final responsepass = await http.get(
        'http://localhost:3333/users/auth/?username=${uname}&password=${pcode}');
    if (responsepass.statusCode == 200) {
      bool pass = (json.decode(responsepass.body))['result'];

      if (pass == true) {
        print('login succesful');
        loginfail = false;

        //User userdetails = User(id: (json.decode(response1.body))["id"], (json.decode(response1.body))["username"], ...)

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MyHomePage(
                      id: data.id, profDetails: userdetails, popRoutes: routes,
                    )));
      } else {
        loginfail = true;
                print("Username or Password is wrong");

        return false;
      }
    }
    else {
    loginfail = true;

    print('Username or Password is wrong');
    return false;
  }
    
  } else {
    loginfail = true;

    print('Username or Password is wrong');
    return false;
  }
  return true;
  
}

*/

  