import 'package:flutter/material.dart';
import 'package:student_progress_indicator_mob/database.dart';
import 'package:student_progress_indicator_mob/information_card.dart';

class ViewResult extends StatefulWidget {
  @override
  _ViewResultState createState() => _ViewResultState();
}
Database db = Database();
InformationCard ic= InformationCard();
List<Widget> information;
class _ViewResultState extends State<ViewResult> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Center(child: Text("View Assignment")),
        ),
        backgroundColor: Colors.grey[100],
        body: FutureBuilder(
            future: db.fetchresult("2020-02-02"),
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
                      return ic.informationcard(context,information);
                    }));
              }else{
                return CircularProgressIndicator();
              }
            }));
  }
}

