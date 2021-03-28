import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:student_progress_indicator_mob/View/ReuseableCodes/textstyling.dart';

import 'package:student_progress_indicator_mob/View/daily_activity.dart';
import 'package:student_progress_indicator_mob/View/login.dart';
import 'package:student_progress_indicator_mob/View/main.dart';
import 'package:student_progress_indicator_mob/View/view_assignment.dart';
import 'package:student_progress_indicator_mob/View/view_profile.dart';
import 'package:student_progress_indicator_mob/View/view_progress.dart';
import 'package:student_progress_indicator_mob/View/view_result.dart';


class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}
class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(body:Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height*0.28,
          width: MediaQuery.of(context).size.width*1,
          decoration: BoxDecoration(
            color: Colors.deepPurpleAccent
          ),
          child: Center(child: TextS(text:"Dashboard",size:3,color:Colors.white)),
        ),
       Column(
         children: [
           SizedBox(height: MediaQuery.of(context).size.height*0.2,),
           Container(
             height: MediaQuery.of(context).size.height*0.8,
             width: MediaQuery.of(context).size.width*1,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
                 color: Colors.white
             ),
             child: Column(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 ButtonRow(context,"Assignments","Daily Activities",ViewProfile(),ViewProfile(),"todo","dailyactivity"),
                ButtonRow(context, "Profile", "Result",ViewProfile(),ViewProfile(),"image","note"),
                 ButtonRow(context, "Progress", "Logout",ViewProgress(),LoginPage(),"progress","logout")],
             ),
           ),
         ],
       )
      ],
    ),
    );
  }
  }

  Widget ButtonRow(BuildContext context,String firsttext,String secondtext,Widget firstpage, Widget secondpage,String image1,String image2){
  return  Expanded(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
      ButtonContainer(context,"$firsttext",firstpage,image1),
      ButtonContainer(context,"$secondtext",secondpage,image2),
    ],),
  );
  }
  Widget ButtonContainer(BuildContext context,String text, Widget page,String image){
    return InkWell(
      onTap: (){
        String dates;
        if(text=='Logout') {
          Navigator.pop(context);
        }
        if(text=="Daily Activities" || text=="Assignments" || text=="Result" ){
          DatePicker.showDatePicker(context,
              showTitleActions: true,
              theme: DatePickerTheme(
                  headerColor: Colors.white,
                  backgroundColor: Colors.white,
                  itemStyle: TextStyle(
                      color: Colors.deepPurpleAccent, fontWeight: FontWeight.bold, fontSize: 18),
                  doneStyle: TextStyle(color: Colors.deepPurpleAccent, fontSize: 16)),
              onConfirm: (date) {
                dates='${date.year}-${date.month}-${date.day}';
                if(text=="Assignments"){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ViewAssignment(date: dates,)),
                  );
                }
                else if(text=="Daily Activities"){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DailyActivity(date: dates,)),
                  );
                }
                else if(text=="Result"){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ViewResult(date: dates,)),
                  );
                }
              }, currentTime: DateTime.now(), locale: LocaleType.en);
        }

        else{
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );}
      },
      child: Container(
          height: MediaQuery.of(context).size.height*0.2,
      width: MediaQuery.of(context).size.width*0.3,
      decoration: BoxDecoration(
          boxShadow: [BoxShadow(
            color: Colors.grey.withOpacity(0.3), //color of shadow
            spreadRadius: 5, //spread radius
            blurRadius: 7, // blur radius
            offset: Offset(0, 2), // changes position of shadow
          )],
      borderRadius: BorderRadius.circular(10),
      color: Colors.white
      ),child: Center(child: Column(
        children: <Widget>[
          Expanded(
              flex: 2,
              child: Image.asset("assets/$image.png",width: size.width*1,)),
          SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: TextS(
              text:"$text",
              size: 2,
              color: Colors.deepPurpleAccent,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
        ],
      ),),),
    );

  }

