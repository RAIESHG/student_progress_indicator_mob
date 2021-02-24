import 'package:flutter/material.dart';
import 'package:student_progress_indicator_mob/database.dart';
import 'package:student_progress_indicator_mob/information_card.dart';


class ViewProgress extends StatefulWidget {
  @override
  _ViewProgressState createState() => _ViewProgressState();
}
Database db = Database();
InformationCard ic= InformationCard();
List<Widget> information;
class _ViewProgressState extends State<ViewProgress> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Center(child: Text("View ViewProgress")),
        ),
        backgroundColor: Colors.grey[100],
        body: FutureBuilder(
            future: db.studentprogress(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {

              if (snapshot.data != null) {
                return (ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      information=[ic.informationcontents("Attendance:"+snapshot.data[index].attendance+"%","Complain: "+snapshot.data[index].complain+"%"),
                      ];
                      return ic.informationcard(context,information);
                    }));
              }else{
                return CircularProgressIndicator();
              }
            }));
  }
}

