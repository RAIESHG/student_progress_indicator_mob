import 'package:flutter/material.dart';
import 'package:student_progress_indicator_mob/Controller/database.dart';
import 'package:student_progress_indicator_mob/View/ReuseableCodes/datepicker.dart';
import 'package:student_progress_indicator_mob/View/daily_activity.dart';

import 'package:student_progress_indicator_mob/View/dashboard.dart';
import 'package:student_progress_indicator_mob/View/homepage.dart';
import 'package:student_progress_indicator_mob/View/login.dart';
import 'package:student_progress_indicator_mob/View/view_profile.dart';



String studentid="2";
Database db = Database();
Size size;

String BASE_URL = "192.168.2.12:3000";
void main() {
  db.fetchstudent();
  runApp(MaterialApp(home: Dashboard()));
}


