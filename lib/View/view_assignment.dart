import 'package:flutter/material.dart';
import 'package:student_progress_indicator_mob/Controller/database.dart';
import 'package:student_progress_indicator_mob/View/ReuseableCodes/information_card.dart';
import 'package:student_progress_indicator_mob/View/ReuseableCodes/loadingscreen.dart';
import 'package:student_progress_indicator_mob/View/ReuseableCodes/nodatafound.dart';
import 'package:student_progress_indicator_mob/View/ReuseableCodes/textstyling.dart';
import 'package:student_progress_indicator_mob/main.dart';



class ViewAssignment extends StatefulWidget {
  final String date;

  const ViewAssignment({Key key, this.date}) : super(key: key);
  @override
  _ViewAssignmentState createState() => _ViewAssignmentState();
}
Database db = Database();
InformationCard ic= InformationCard();
List<Widget> information;
class _ViewAssignmentState extends State<ViewAssignment> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Center(child: TextS(text:"Assignments",size:3,color:Colors.white)),
        backgroundColor: Colors.deepPurpleAccent,
      ),
        body: FutureBuilder(
            future: db.fetchAssignment("${widget.date}"),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data!=null) {
            int count = snapshot.data.length;
            print(count);
            if(count>=1){
                return (ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      information=[ic.informationcontents("Subject:",snapshot.data[index].subject,"Assignment Details: ",snapshot.data[index].assignment,Icons.book,Icons.assignment,context),
                        ic.informationcontents("Assign Date: ",snapshot.data[index].assigndate,"Due Date: ",snapshot.data[index].duedate,Icons.date_range,Icons.date_range_sharp,context),
                        SizedBox(height: size.height*0.1,),
                      ];
                      return Container(
                        height: MediaQuery.of(context).size.height*0.5,
                        width: MediaQuery.of(context).size.width*0.9,
                        child: Column(
                          children: information
                        ),
                      );
                    }));
              }
              else{
                return NoData();
            }
              }else{
                return LoadingScreen();
              }
            }));
  }
}

