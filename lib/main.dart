import 'package:flutter/material.dart';
import 'package:student_progress_indicator_mob/daily_activity.dart';
import 'package:student_progress_indicator_mob/dashboard.dart';
import 'package:student_progress_indicator_mob/login.dart';
import 'package:student_progress_indicator_mob/view_assignment.dart';
import 'package:student_progress_indicator_mob/view_profile.dart';



String BASE_URL = '192.168.2.6:3000';
void main() {
  runApp(MaterialApp(home: Dashboard()));
}


