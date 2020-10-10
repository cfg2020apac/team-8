import 'package:eight_for_good/vol_home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'NewUser.dart';

class LoginPage extends StatefulWidget {
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
              child: Image(image: AssetImage("assets/blossom.jpeg")),
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
                                    errorText:
                                        'Username or password is incorrect!',
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
                                            builder: (context) => Register()));
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
                                              VolunteerApp()));
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
