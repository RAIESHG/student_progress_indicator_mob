import 'package:flutter/material.dart';
import 'package:student_progress_indicator_mob/database.dart';
import 'package:student_progress_indicator_mob/information_card.dart';

class DailyActivity extends StatefulWidget {
  @override
  _DailyActivityState createState() => _DailyActivityState();
}
List<Widget> information;
InformationCard ic = InformationCard();
Database db = Database();
class _DailyActivityState extends State<DailyActivity> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Daily Activities")),
      ),
        backgroundColor: Colors.grey[100],
        body: FutureBuilder(
        future: db.fetchActivity("2020-02-02"),
    builder: (BuildContext context, AsyncSnapshot snapshot) {
    if (snapshot.data != null) {
    return (ListView.builder(
    shrinkWrap: true,
    primary: false,
    itemCount: snapshot.data.length,
        itemBuilder: (BuildContext context, int index) {

          information=[ic.informationcontents("Date:"+snapshot.data[index].date,"Attendance: "+snapshot.data[index].attendance),
            ic.informationcontents("notice: "+snapshot.data[index].notice,"complain: "+snapshot.data[index].complain),
          ];
          return ic.informationcard(context,information);
        }));
  }else{
      return CircularProgressIndicator();
    }
    }));
  }
}

