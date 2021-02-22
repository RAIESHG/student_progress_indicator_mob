import 'package:student_progress_indicator_mob/activity_model.dart';
import 'package:student_progress_indicator_mob/assignment_model.dart';
import 'package:student_progress_indicator_mob/main.dart';
import 'package:http/http.dart' as http;
import 'package:student_progress_indicator_mob/student_model.dart';
import 'dart:convert';

import 'package:student_progress_indicator_mob/user_model.dart';

class Database{
  Future<List<Assignment>> fetchAssignment(String assigndate) async {
    var response;
    int statusCode;

    var data = await http
        .get("http://$BASE_URL/getassignment?assigndate=$assigndate"); //link ma bhako sabai kura

    var jsonData = json.decode((data.body)); //json data matrai nikalna
    // If the server did return a 200 OK response,
    // then parse the JSON.

    List<Assignment> assignments = [];
    for (var each in jsonData) {
      Assignment assignmentobj = Assignment(assignment: each["assignment"],assigndate:each["assigndate"],duedate: each["duedate"],subject: each["subjectname"]);
      assignments.add(assignmentobj);
    }
    return assignments;
  }
  Future<List<ActivityModel>> fetchActivity(String date) async {
    var response;
    int statusCode;
    print("$BASE_URL");
    print(date);
    var data = await http.get('http://$BASE_URL/getactivity?date=$date'); //link ma bhako sabai kura

    var jsonData = json.decode((data.body)); //json data matrai nikalna
    // If the server did return a 200 OK response,
    // then parse the JSON.

    List<ActivityModel> activitylist = [];
    for (var each in jsonData) {
      ActivityModel activityobj = ActivityModel(date: each["date"],attendance:each["attendance"],notice: each["notice"],complain: each["complain"]);
      activitylist.add(activityobj);
    }
    return activitylist;
  }
  Future<List<UserModel>> fetchUserDetails() async {
    var response;
    int statusCode;

    var data = await http
        .get("$BASE_URL/allcategories"); //link ma bhako sabai kura

    var jsonData = json.decode((data.body)); //json data matrai nikalna
    // If the server did return a 200 OK response,
    // then parse the JSON.

    List<UserModel> userinfolist = [];
    for (var each in jsonData) {
      UserModel userinfo_obj = UserModel(assignment: each["assignment"],assigndate:each["assigndate"],duedate: each["duedate"],subject: each["subject"]);
      userinfolist.add(userinfo_obj);
    }
    return userinfolist;
  }


  Future<List<StudentModel>> fetchstudent() async {
    var response;
    int statusCode;
    var data = await http.get('http://$BASE_URL/getstudentinformation');
    var jsonData = json.decode((data.body));
    List<StudentModel> studentinfolist = [];
    print(jsonData);
    for (var each in jsonData) {
      StudentModel studentobj = StudentModel(
          studentid: each["studentid"].toString()
          ,studentname:each["studentname"],
          classs:each["class"],
          section: each["section"]
          ,email: each["email"],
          phonenumber: each["phonenumber"],
      password: each["password"]);
      studentinfolist.add(studentobj);
    }

    return studentinfolist;
  }
}