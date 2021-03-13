import 'package:flutter/material.dart';
import 'package:student_progress_indicator_mob/daily_activity.dart';
import 'package:student_progress_indicator_mob/dashboard.dart';
import 'package:student_progress_indicator_mob/database.dart';
import 'package:student_progress_indicator_mob/login.dart';
import 'package:student_progress_indicator_mob/view_assignment.dart';
import 'package:student_progress_indicator_mob/view_profile.dart';
import 'package:student_progress_indicator_mob/view_progress.dart';


String studentid="2";
Database db = Database();
String BASE_URL = '192.168.2.12:3000';
void main() {
  db.fetchstudent();

  runApp(MaterialApp(home: Dashboard()));
}


