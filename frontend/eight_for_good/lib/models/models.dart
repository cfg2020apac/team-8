import 'package:flutter/material.dart';

class Model {
  String title;
  String area;
  String address;
  String startDate;
  String startTime;
  String endDate;
  String endTime;
  String description;
  String inCharge;

  Model(
      {this.title,
      this.area,
      this.address,
      this.startDate,
      this.startTime,
      this.endDate,
      this.endTime,
      this.description,
      this.inCharge});
}