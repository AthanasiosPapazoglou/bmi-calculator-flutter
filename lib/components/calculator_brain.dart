import 'package:flutter/material.dart';
import 'constants.dart';
import 'dart:math';

class CalculatorBrain {
  final int height;
  final int weight;

  double _bmi;

  CalculatorBrain({this.height, this.weight});

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Nomarl';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'Higher than normal body weight. Try eating less & excercise more';
    } else if (_bmi > 18.5) {
      return 'Nomarl body weight, good job!';
    } else {
      return 'Under normal weight. Eat more and excercise better';
    }
  }
}
