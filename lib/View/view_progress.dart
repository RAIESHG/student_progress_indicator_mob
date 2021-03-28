import 'package:flutter/material.dart';
import 'package:student_progress_indicator_mob/Controller/database.dart';
import 'package:student_progress_indicator_mob/View/ReuseableCodes/gauge.dart';
import 'package:student_progress_indicator_mob/View/ReuseableCodes/information_card.dart';
import 'package:student_progress_indicator_mob/View/ReuseableCodes/loadingscreen.dart';
import 'package:student_progress_indicator_mob/View/ReuseableCodes/nodatafound.dart';
import 'package:student_progress_indicator_mob/View/ReuseableCodes/textstyling.dart';
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
          backgroundColor: Colors.deepPurpleAccent,
          title: Center(child: TextS(text:"Progress",size:3,color:Colors.white)),
        ),
        backgroundColor: Colors.grey[100],
        body: FutureBuilder(
            future: db.studentprogress(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data != null) {
                int count = snapshot.data.length;
                if(count>=1){
                return (ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      double attendance=0;
                      double complain=0;
                      double marks=0;
                      String grades="Grades";
                      String attendancelabel="Attendance";
                      String complainlabel="Complain";
                      print(snapshot.data[index].attendance);



                      if(snapshot.data[index].attendance=="null"){
                        attendancelabel="No Record";

                      }
                      else{
                          attendance = (double.parse(snapshot.data[index].attendance)).roundToDouble();
                    }
                      if(snapshot.data[index].complain=="null"){    complainlabel="No Record";
                    }
                      else{     complain = (double.parse(snapshot.data[index].complain)).roundToDouble();
                 }
                      if(snapshot.data[index].averagemarks=="null"){grades="No Record";
                    }
                      else{     marks = (double.parse(snapshot.data[index].averagemarks)).roundToDouble();
                     }


                      if(attendance<50){
                        attendanceColor=Colors.red;
                      }
                      else if(attendance>=50 && attendance<80){
                        attendanceColor=Colors.orange;
                      }
                      else{
                        attendanceColor=Colors.green;
                      }
                      if(complain>35){
                        complainColor=Colors.red;
                      }
                      else if(complain>=15 && complain<35){
                        complainColor=Colors.orange;
                      }
                      else{
                        complainColor=Colors.green;
                      }
                      if(marks<50){
                        resultColor=Colors.red;
                      }
                      else if(marks>=50 && marks<80){
                        resultColor=Colors.orange;
                      }
                      else{
                        resultColor=Colors.green;
                      }

                      return  Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height*0.9,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(child:  Gauge( value:attendance,annotation:"$attendancelabel", pointerColor: attendanceColor)),
                              Expanded(child:  Gauge( value:marks,annotation:"$grades", pointerColor: resultColor)),
                              Expanded(child:  Gauge( value:complain,annotation:"$complainlabel", pointerColor: complainColor)),
                            ],
                          ),
                        ),
                      );
                    }));
              }
                else{
                  return NoData();
                }
              }
              else{
                return LoadingScreen();
              }
            }));
  }

}

