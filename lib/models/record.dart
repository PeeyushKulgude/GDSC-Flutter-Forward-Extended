import 'package:flutter/material.dart';

class Record {
  double weight;
  double height;
  late double bmi;
  late String result;
  late Color color;

  Record(this.weight, this.height) {
    bmi = weight / (height * height);
    if (bmi < 18.5) {
      result = 'Underweight';
      color = const Color(0xff4285f4);
    } else if (bmi >= 18.5 && bmi < 25) {
      result = 'Normal';
      color = const Color(0xff0f9d58);
    } else if (bmi >= 25 && bmi < 30) {
      result = 'Overweight';
      color = const Color(0xfffbbc04);
    } else {
      result = 'Obese';
      color = const Color(0xffe84435);
    }
  }
}
