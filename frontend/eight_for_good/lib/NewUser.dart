import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import './models/models.dart';
import 'package:validators/validators.dart';
import 'package:http/http.dart' as http;

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Second Route"),
        ),
        body: TestForm());
  }
}

class TestForm extends StatefulWidget {
  @override
  _TestFormState createState() => _TestFormState();
}

class _TestFormState extends State<TestForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController dateCtl = TextEditingController();
  SignupModel model = SignupModel();
  @override
  Widget build(BuildContext context) {
    final halfMediaWidth = MediaQuery.of(context).size.width / 2.0;

    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Row(children: <Widget>[
              Container(
                alignment: Alignment.topCenter,
                width: halfMediaWidth,
                child: MyTextFormField(
                  hintText: "First Name",
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Enter First name';
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    model.firstName = value;
                  },
                ),
              ),
              Container(
                alignment: Alignment.topCenter,
                width: halfMediaWidth,
                child: MyTextFormField(
                  hintText: "Last Name",
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Enter last name';
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    model.lastName = value;
                  },
                ),
              ),
            ]),
            MyTextFormField(
              hintText: "Email",
              isEmail: true,
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Enter Email';
                }
                // if (!validator.isEmail(value)) {
                //   return "Please enter a valid email";
                // }
                return null;
              },
            ),
            MyTextFormField(
              hintText: "Password",
              isPassword: true,
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Enter password';
                }
                if (value.length < 7) {
                  return "Password should be at least 7 characters";
                }
                _formKey.currentState.save();
                return null;
              },
              onSaved: (String value) {
                model.password = value;
              },
            ),
            MyTextFormField(
              hintText: "Confirm Password",
              isPassword: true,
              validator: (String value) {
                if (model.password != null && value != model.password) {
                  return "Password do not match";
                }
                return null;
              },
            ),
            RaisedButton(
              color: Colors.lightBlueAccent,
              child: Text('Submit', style: TextStyle(color: Colors.white)),
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();

                  final uri = 'https://forchange-7d138.web.app/add-volunteer';

                  await http.post(uri, body: {
                    'firstName': model.firstName,
                    'lastNAme': model.lastName,
                    'email': model.email,
                    'password': model.password
                  });
                  Navigator.pop(
                    context,
                  );
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
