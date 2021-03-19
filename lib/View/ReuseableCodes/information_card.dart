import 'package:flutter/material.dart';

class InformationCard{

  Widget textinfo(String text){
    return  Expanded(child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(text),
    ));



  }
  Widget informationcontents(String text1, String text2){
    return   Expanded(
      child: Row(

        children: [
          textinfo(text1),
          textinfo(text2),

        ],),
    );



  }
  Widget informationcard(BuildContext context, List<Widget> information){
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container( decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),


            color: Colors.blue.withOpacity(0.8)

        ),
          height: MediaQuery.of(context).size.height*0.4,
          width: MediaQuery.of(context).size.width*0.8,

          child: Column(
              children: information
          ),
        ),
      ),
    );


  }

}