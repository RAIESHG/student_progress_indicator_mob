import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:student_progress_indicator_mob/View/ReuseableCodes/textstyling.dart';
import 'package:student_progress_indicator_mob/main.dart';


class NoData extends StatefulWidget {
  @override
  _NoDataState createState() => _NoDataState();
}

class _NoDataState extends State<NoData> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: size.height*0.12,),
          Expanded(
              child: Container(
                  child: Lottie.asset("assets/nodata.json"))),
          Expanded(child: TextS(text:"No Data Available",size:3,color: Colors.black,)),
        ],
      ),
    );
  }
}
