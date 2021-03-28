import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:student_progress_indicator_mob/Controller/database.dart';
import 'package:student_progress_indicator_mob/View/ReuseableCodes/gauge.dart';
import 'package:student_progress_indicator_mob/View/ReuseableCodes/loadingscreen.dart';
import 'package:student_progress_indicator_mob/View/ReuseableCodes/nodatafound.dart';
import 'package:student_progress_indicator_mob/View/ReuseableCodes/textstyling.dart';
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
          backgroundColor: Colors.deepPurpleAccent,
          title: Center(child: TextS(text:"Result",size:3,color:Colors.white)),
        ),
        backgroundColor: Colors.grey[100],
        body: FutureBuilder(
            future: db.fetchresult("${widget.date}"),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data != null) {
              int count = snapshot.data.length;

              if(count>=1){

    return (ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      double grades = (double.parse(snapshot.data[index].grade));
                      if(grades<50){
                        resultColor=Colors.red;
                      }
                      else if(grades>=50 && grades<80){

                        resultColor=Colors.orange;

                      }
                      return new Gauge( value:double.parse(snapshot.data[index].grade),annotation:"${snapshot.data[index].subject}", pointerColor: Colors.deepPurple.withOpacity(0.7));
                    }));
              } else{

                return NoData();
              }


              }else{
                return LoadingScreen();
              }
            }));
  }
}

