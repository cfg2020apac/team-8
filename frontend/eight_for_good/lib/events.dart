import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import './models/models.dart';
import './models/result.dart';

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
      body: Center(child: Text('Events')),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            // add on pressed code here
            _newEventModal(context).then((onValue) {
              SnackBar mySnackbar = SnackBar(content: Text("Hello $onValue"));
              Scaffold.of(context).showSnackBar(mySnackbar);
            });
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.lightBlue),
    );
  }
}

DateTime _date = DateTime.now();

Future<String> _newEventModal(context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("New Event"),
          content: SingleChildScrollView(child: TestForm()),
        );
      });
}

class TestForm extends StatefulWidget {
  @override
  _TestFormState createState() => _TestFormState();
}

class _TestFormState extends State<TestForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController dateCtl = TextEditingController();
  Model model = Model();
  @override
  Widget build(BuildContext context) {
    final halfMediaWidth = MediaQuery.of(context).size.width / 1.5;

    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              width: halfMediaWidth,
              child: MyTextFormField(
                hintText: "Title",
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Enter event title';
                  }
                  return null;
                },
                onSaved: (String value) {
                  model.title = value;
                },
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              width: halfMediaWidth,
              child: MyTextFormField(
                hintText: "Area",
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter event area';
                  }
                  return null;
                },
                onSaved: (String value) {
                  model.area = value;
                },
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              width: halfMediaWidth,
              child: MyTextFormField(
                  hintText: "Address",
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter event address';
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    model.address = value;
                  }),
            ),
            // Container(
            //     alignment: Alignment.topCenter,
            //     width: halfMediaWidth,
            //     child: TextFormField(
            //       controller: dateCtl,
            //       decoration: InputDecoration(
            //         hintText: "Start Date",
            //         contentPadding: EdgeInsets.all(15.0),
            //         border: InputBorder.none,
            //         filled: true,
            //         fillColor: Colors.grey[200],
            //       ),
            //       onTap: () async {
            //         DateTime date = DateTime(1900);
            //         FocusScope.of(context).requestFocus(new FocusNode());

            //         date = await showDatePicker(
            //             context: context,
            //             initialDate: DateTime.now(),
            //             firstDate: DateTime(1900),
            //             lastDate: DateTime(2100));

            //         dateCtl.text = date.toIso8601String();
            //       },
            //     )),
            Container(
              alignment: Alignment.topCenter,
              width: halfMediaWidth,
              child: MyTextFormField(
                  hintText: "Start Date DD/MM/YY",
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter event start date DD/MM/YY';
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    model.startDate = value;
                  }),
            ),
            Container(
              alignment: Alignment.topCenter,
              width: halfMediaWidth,
              child: MyTextFormField(
                  hintText: "Start Time HH:mm format",
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Enter event start time';
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    model.startTime = value;
                  }),
            ),
            Container(
              alignment: Alignment.topCenter,
              width: halfMediaWidth,
              child: MyTextFormField(
                  hintText: "End Date DD/MM/YY",
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Enter event end date DD/MM/YY';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    model.endDate = value;
                  }),
            ),
            Container(
              alignment: Alignment.topCenter,
              width: halfMediaWidth,
              child: MyTextFormField(
                  hintText: "End Time HH:mm format",
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Enter event end time HH:mm format';
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    model.endTime = value;
                  }),
            ),
            MyTextFormField(
                hintText: "Description",
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter event description';
                  }
                  return null;
                },
                onSaved: (String value) {
                  model.description = value;
                }),
            MyTextFormField(
                hintText: "In-charge",
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Enter event in-charge';
                  }
                  return null;
                },
                onSaved: (String value) {
                  model.inCharge = value;
                }),
            RaisedButton(
              color: Colors.lightBlueAccent,
              child: Text('Submit', style: TextStyle(color: Colors.white)),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Result(
                                model: this.model,
                              )));
                }
              },
            )
          ],
        ));
  }
}

class MyTextFormField extends StatelessWidget {
  final String hintText;
  final Function validator;
  final Function onSaved;
  final bool isPassword;
  final bool isEmail;

  MyTextFormField(
      {this.hintText,
      this.validator,
      this.onSaved,
      this.isPassword = false,
      this.isEmail = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(8.0),
        child: TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
            contentPadding: EdgeInsets.all(15.0),
            border: InputBorder.none,
            filled: true,
            fillColor: Colors.grey[200],
          ),
          obscureText: isPassword ? true : false,
          validator: validator,
          onSaved: onSaved,
          keyboardType:
              isEmail ? TextInputType.emailAddress : TextInputType.text,
        ));
  }
}
