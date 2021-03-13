import 'package:flutter/material.dart';
import 'package:student_progress_indicator_mob/database.dart';
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
                      String grades="";
                      if(snapshot.data[index].averagemarks==null){
                        grades="No Record";

                      }else{

                        grades=snapshot.data[index].averagemarks;
                      }
                      information=[ic.informationcontents("Attendance:"+snapshot.data[index].attendance+"%","Complain: "+snapshot.data[index].complain+"%"),
                        ic.informationcontents("Average Marks:"+snapshot.data[index].averagemarks+"%",""),];

                      double attendance = double.parse(snapshot.data[index].attendance);
                      double complain = double.parse(snapshot.data[index].complain);
                      double marks = double.parse(snapshot.data[index].averagemarks);

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
                            radialGauge( attendance,  "Attendance",  attendanceColor),
                            radialGauge( marks,  "Grades",  resultColor),
                            radialGauge( complain,  "Complain",  complainColor)
                          ],
                        ),
                      );
                    }));
              }else{
                return CircularProgressIndicator();
              }
            }));
  }
  Widget radialGauge(double value, String annotation, Color pointerColor){
    return Expanded(
      child: SfRadialGauge(
          enableLoadingAnimation: true,
          axes:<RadialAxis>[RadialAxis(ranges: <GaugeRange>[
            GaugeRange(
                startValue: 0,
                endValue: value,
                color: pointerColor,
                startWidth: 10,
                endWidth: 10),],
              showLabels: false,
              showTicks: false,
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                    angle: 90,
                    axisValue: 5,
                    positionFactor: 0.2,
                    widget: Text('${value}%',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight
                                .bold,
                            color: pointerColor))
                ),
                GaugeAnnotation(
                    angle: 90,
                    axisValue: 5,
                    positionFactor: 0.5,
                    widget: Text('$annotation',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight
                                .bold,
                            color: pointerColor))
                )
              ] ),]
      ),
    );

  }
}

