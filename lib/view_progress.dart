import 'package:flutter/material.dart';
import 'package:student_progress_indicator_mob/database.dart';
import 'package:student_progress_indicator_mob/gauge.dart';
import 'package:student_progress_indicator_mob/information_card.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';


class ViewProgress extends StatefulWidget {
  @override
  _ViewProgressState createState() => _ViewProgressState();
}
Color attendanceColor = Colors.green;
Color resultColor = Colors.green;
Color complainColor = Colors.green;

Database db = Database();
InformationCard ic= InformationCard();
List<Widget> information;
class _ViewProgressState extends State<ViewProgress> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Center(child: Text(" View Progress")),
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
                      double attendance = double.parse(snapshot.data[index].attendance);
                      double complain = double.parse(snapshot.data[index].complain);
                      double marks = double.parse(snapshot.data[index].averagemarks);
                      String grades="Grades";
                      String attendancelabel="Attendance";
                      String complainlabel="Complain";
                      if(snapshot.data[index].averagemarks==null){
                        grades="No Record";
                        marks=0;
                      }
                      if(snapshot.data[index].attendance==null){
                        attendancelabel="No Record";
                        marks=0;
                      }
                      if(snapshot.data[index].complain==null){
                        complainlabel="No Record";
                        marks=0;
                      }


                      if(attendance<50){
                        attendanceColor=Colors.red;
                      }
                      else if(attendance>=50 && attendance<80){

                        attendanceColor=Colors.orange;

                      }
                      if(complain>35){
                        complainColor=Colors.red;
                      }
                      else if(complain>=15 && complain<35){

                        resultColor=Colors.orange;

                      }
                      if(marks<50){
                        resultColor=Colors.red;
                      }
                      else if(marks>=50 && marks<80){

                        resultColor=Colors.orange;

                      }
                      return  Container(
                        height: MediaQuery.of(context).size.height*0.8,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(child: new Gauge( value:attendance,annotation:"$attendancelabel", pointerColor: attendanceColor)),
                            Expanded(child: new Gauge( value:marks,annotation:"$grades", pointerColor: resultColor)),
                            Expanded(child: new Gauge( value:complain,annotation:"$complainlabel", pointerColor: complainColor)),

                          ],
                        ),
                      );
                    }));
              }else{
                return CircularProgressIndicator();
              }
            }));
  }

}

