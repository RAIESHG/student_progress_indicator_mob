import 'package:flutter/material.dart';
import 'package:student_progress_indicator_mob/Controller/database.dart';
import 'package:student_progress_indicator_mob/View/ReuseableCodes/datepicker.dart';
import 'package:student_progress_indicator_mob/View/dashboard.dart';
import 'package:student_progress_indicator_mob/View/login.dart';



String studentid="2";
Database db = Database();
String BASE_URL = '192.168.2.12:3000';
void main() {
  db.fetchstudent();

  runApp(MaterialApp(home: Dashboard()));
}


