import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:student_progress_indicator_mob/View/ReuseableCodes/textstyling.dart';
import 'package:student_progress_indicator_mob/View/main.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(height: size.height*0.3, child: Center(child: Lottie.asset("assets/loading.json"))),
          TextS(text:"Loading..Please Check Your Internet Connection",size: 1.8,color: Colors.black,),
        ],
      ),
    );
  }
}
