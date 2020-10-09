import 'package:flutter/material.dart';
import 'models.dart';

class Result extends StatelessWidget {
  Model model;

  Result({this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Successful')),
        body: Container(
          margin: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                model.title,
                style: TextStyle(fontSize: 22),
              ),
              Text(
                model.area,
                style: TextStyle(fontSize: 22),
              ),
              Text(
                model.address,
                style: TextStyle(fontSize: 22),
              ),
              Text(
                model.startDate.toString(),
                style: TextStyle(fontSize: 22),
              ),
              Text(
                model.startTime,
                style: TextStyle(fontSize: 22),
              ),
              Text(
                model.endDate.toString(),
                style: TextStyle(fontSize: 22),
              ),
              Text(
                model.endTime,
                style: TextStyle(fontSize: 22),
              ),
              Text(
                model.description,
                style: TextStyle(fontSize: 22),
              ),
              Text(
                model.inCharge,
                style: TextStyle(fontSize: 22),
              ),
            ],
          ),
        ));
  }
}
