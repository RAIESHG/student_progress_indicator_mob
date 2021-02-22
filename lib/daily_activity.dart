import 'package:flutter/material.dart';
import 'package:student_progress_indicator_mob/database.dart';

class DailyActivity extends StatefulWidget {
  @override
  _DailyActivityState createState() => _DailyActivityState();
}
Database db = Database();
class _DailyActivityState extends State<DailyActivity> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.grey[100],
        body: FutureBuilder(
        future: db.fetchActivity("2020-01-01"),
    builder: (BuildContext context, AsyncSnapshot snapshot) {
    if (snapshot.data != null) {
    return (ListView.builder(
    shrinkWrap: true,
    primary: false,
    itemCount: snapshot.data.length,
    itemBuilder: (BuildContext context, int index) {
      return Text(snapshot.data[0].attendance);


      }));
  }else{
      return CircularProgressIndicator();

    }
    }));
  }
}

