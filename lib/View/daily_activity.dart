import 'package:flutter/material.dart';
import 'package:student_progress_indicator_mob/Controller/database.dart';
import 'package:student_progress_indicator_mob/View/ReuseableCodes/information_card.dart';
import 'package:student_progress_indicator_mob/View/ReuseableCodes/loadingscreen.dart';
import 'package:student_progress_indicator_mob/View/ReuseableCodes/nodatafound.dart';


class DailyActivity extends StatefulWidget {
  final String date;

  const DailyActivity({Key key, this.date}) : super(key: key);
  @override
  _DailyActivityState createState() => _DailyActivityState();
}
List<Widget> information;
InformationCard ic = InformationCard();
Database db = Database();
class _DailyActivityState extends State<DailyActivity> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,

      ),

        body: FutureBuilder(
        future: db.fetchActivity("${widget.date}"), //$widget.date
    builder: (BuildContext context, AsyncSnapshot snapshot) {
    if (snapshot.hasData) {
      int count = snapshot.data.length;
      print(count);
      if(count>=1){
    return (ListView.builder(
    shrinkWrap: true,
    primary: false,
    itemCount: snapshot.data.length,
        itemBuilder: (BuildContext context, int index) {
          information=[ic.informationcontents("Date",snapshot.data[index].date,"Attendance",snapshot.data[index].attendance,Icons.date_range,Icons.sports_handball_sharp,context),
            ic.informationcontents("Notice",snapshot.data[index].notice,"Complain",snapshot.data[index].complain,Icons.notifications_active_outlined,Icons.notifications_active,context),
          ];
          return Column(children:[ic.informationcard(context,information,"Daily Activity"),]);
        }));
  }else{
        return NoData();
      }}else{
      return LoadingScreen();
    }
    }));
  }
}

