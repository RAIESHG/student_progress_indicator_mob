import 'package:flutter/material.dart';
import 'package:student_progress_indicator_mob/Controller/database.dart';
import 'package:student_progress_indicator_mob/View/ReuseableCodes/information_card.dart';


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
        title: Center(child: Text("View Assignment")),
      ),
        backgroundColor: Colors.grey[100],
        body: FutureBuilder(
            future: db.fetchAssignment("${widget.date}"),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data != null) {
                return (ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      information=[ic.informationcontents("Subject:"+snapshot.data[index].subject,"Assignment Details: "+snapshot.data[index].assignment),
                        ic.informationcontents("Assign Date: "+snapshot.data[index].assigndate,"Due Date: "+snapshot.data[index].duedate),
                      ];
                      return ic.informationcard(context,information);
                    }));
              }else{
                return CircularProgressIndicator();
              }
            }));
  }
}

