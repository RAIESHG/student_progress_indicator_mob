import 'package:flutter/material.dart';
import 'package:student_progress_indicator_mob/Controller/database.dart';
import 'package:student_progress_indicator_mob/View/ReuseableCodes/gauge.dart';

import 'ReuseableCodes/information_card.dart';


class ViewResult extends StatefulWidget {
  final String date;

  const ViewResult({Key key, this.date}) : super(key: key);
  @override
  _ViewResultState createState() => _ViewResultState();
}
Database db = Database();
InformationCard ic= InformationCard();
List<Widget> information;
class _ViewResultState extends State<ViewResult> {
  @override
  Color resultColor = Colors.green;
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Center(child: Text("View Result")),
        ),
        backgroundColor: Colors.grey[100],
        body: FutureBuilder(
            future: db.fetchresult("${widget.date}"),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data != null) {
                return (ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      information=[ic.informationcontents("Subject:"+snapshot.data[index].subject," Grade: "+snapshot.data[index].grade),
                        ic.informationcontents(" Date: "+snapshot.data[index].date,""),
                      ];
                      double grades = double.parse(snapshot.data[index].grade);
                      if(grades<50){
                        resultColor=Colors.red;
                      }
                      else if(grades>=50 && grades<80){

                        resultColor=Colors.orange;

                      }
                      return new Gauge( value:double.parse(snapshot.data[index].grade),annotation:"${snapshot.data[index].subject}", pointerColor: Colors.deepPurple.withOpacity(0.7));
                    }));
              }else{
                return CircularProgressIndicator();
              }
            }));
  }
}
