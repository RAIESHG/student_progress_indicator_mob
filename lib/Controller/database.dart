import 'package:http/http.dart' as http;
import 'package:student_progress_indicator_mob/Models/activity_model.dart';
import 'dart:convert';

import 'package:student_progress_indicator_mob/Models/assignment_model.dart';
import 'package:student_progress_indicator_mob/Models/progress_model.dart';
import 'package:student_progress_indicator_mob/Models/result_model.dart';
import 'package:student_progress_indicator_mob/Models/student_model.dart';
import 'package:student_progress_indicator_mob/Models/user_model.dart';
import 'package:student_progress_indicator_mob/View/main.dart';


class Database{

  Future<List<Assignment>> fetchAssignment(String assigndate) async {

    var url = Uri.http('$BASE_URL','/getassignment',{'assigndate':'$assigndate','studentid':'$studentid'});
    var data = await http.get(url);

    var jsonData = json.decode((data.body));


    List<Assignment> assignments = [];
    for (var each in jsonData) {
      Assignment assignmentobj = Assignment(assignment: each["assignment"],assigndate:each["assigndate"],duedate: each["duedate"],subject: each["subjectname"]);
      assignments.add(assignmentobj);
    }
    return assignments;
  }

  Future<List<ActivityModel>> fetchActivity(String date) async {
    var url = Uri.http('$BASE_URL','/getactivity',{'date':'$date','studentid':'$studentid'});

    var data = await http.get(url); //link ma bhako sabai kura
    var jsonData = json.decode((data.body));

    List<ActivityModel> activitylist = [];
    for (var each in jsonData) {
      ActivityModel activityobj = ActivityModel(date: each["date"],attendance:each["attendance"],notice: each["notice"],complain: each["complaines"]);
      activitylist.add(activityobj);

    }
   return activitylist;

  }
  Future<List<ResultModel>> fetchresult(String date) async {
    var url = Uri.http('$BASE_URL','/getresult',{'date':'$date','studentid':'$studentid'});

    var data = await http.get(url);
    var jsonData = json.decode((data.body));
    List<ResultModel> resultlist = [];
    for (var each in jsonData) {
      ResultModel resultobj = ResultModel(date: each["date"],grade:each["grades"],subject: each["subject"]);
      resultlist.add(resultobj);
    }
    return resultlist;

  }

  Future<List<UserModel>> fetchUserDetails() async {
    var url = Uri.http('$BASE_URL','/allcategories');
    var data = await http.get(url);
    var jsonData = json.decode((data.body));
    List<UserModel> userinfolist = [];
    for (var each in jsonData) {
      UserModel userinfo_obj = UserModel(assignment: each["assignment"],assigndate:each["assigndate"],duedate: each["duedate"],subject: each["subject"]);
      userinfolist.add(userinfo_obj);}
    return userinfolist;
  }


  Future<List<StudentModel>> fetchstudent() async {
    var url = Uri.http('$BASE_URL','/getstudentinformation',{'studentid':'$studentid'});
    var data = await http.get(url);

    var jsonData = json.decode((data.body));
    List<StudentModel> studentinfolist = [];
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


  Future<List<ProgressModel>> studentprogress() async {
    var url = Uri.http('$BASE_URL','/getprogress',{'studentid':'$studentid'});
    var data = await http.get(url);
    var jsonData = json.decode((data.body));
    List<ProgressModel> progresslist = [];

      ProgressModel progressModel = ProgressModel(
          attendance: jsonData[0]["attendance"].toString()
          ,complain:jsonData[0]["complaines"].toString(),averagemarks:jsonData[0]["averagegrade"].toString(),
         );
      progresslist.add(progressModel);
    return progresslist;
  }


  Future<int> attemptLogIn(String username, String password) async {
    var url = Uri.http('$BASE_URL','/login');
    var status;
    try{

    var res = await http.post(
        url,
        body: {
          "email": username,
          "password": password
        }
    );

    var jsonData = json.decode((res.body));


    studentid=jsonData[0]['studentid'].toString();

    status=res.statusCode;
    }
    catch(e){

      status=404;

    }

    return status;
  }

  Future<int> attemptSignUp(String username, String password) async {
    var url = Uri.http('$BASE_URL','/signup');
    var res = await http.post(
        url,
        body: {
          "username":username,
          "password":password
        }
    );

    return res.statusCode;

  }
}