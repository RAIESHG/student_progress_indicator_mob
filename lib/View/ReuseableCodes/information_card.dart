import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_progress_indicator_mob/View/main.dart';

class InformationCard{
  Widget informationcontents(String texttitle1,String text1, String texttitle2,String text2,IconData icon1,IconData icon2, BuildContext context){
    return   Expanded(
      child: Row(
        children: [
          singleContent(text1,texttitle1,icon1,context),

          singleContent(text2,texttitle2,icon2,context),
        ],),
    );
  }

  Widget singleContent(String text , String title, IconData icon, BuildContext context){
    String lengthytext = "";
    if(text.length>15){
      lengthytext = "Tap to view!";
    }
    else{
      lengthytext=text;
    }
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: InkWell(
          onTap: (){

           if(text.length>15){
            displayDialog(context, title, text);
           }
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [BoxShadow(
                  color: Colors.grey.withOpacity(0.3), //color of shadow
                  spreadRadius: 5, //spread radius
                  blurRadius: 7, // blur radius
                  offset: Offset(0, 2), // changes position of shadow
                )]
            ),
            child: Row(
              children: [
                Expanded(child: Icon(icon,size: size.height*0.05,color: Colors.deepPurpleAccent, )),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(child: Center(child: Text("$title",style: GoogleFonts.laila(fontWeight: FontWeight.bold),))),

                      Expanded(child: Align(
                          alignment: Alignment.topCenter,
                          child: Text("$lengthytext"))),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget informationcard(BuildContext context, List<Widget> information, String title){
    return Container(
      height: MediaQuery.of(context).size.height*1,
      width: MediaQuery.of(context).size.width*0.5,
      child: Stack(
          children: [
      Container(
      height: MediaQuery.of(context).size.height*0.28,
      width: MediaQuery.of(context).size.width*1,
      decoration: BoxDecoration(
          color: Colors.deepPurpleAccent
      ),
      child: Center(child: Text("$title",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),)),
    ),
            SizedBox(height: MediaQuery.of(context).size.height*0.2,),
    Column(
    children: [
    SizedBox(height: MediaQuery.of(context).size.height*0.2,),
    Container(
    height: MediaQuery.of(context).size.height*0.5,
    width: MediaQuery.of(context).size.width*1,

    decoration: BoxDecoration(

    borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
    color: Colors.white
    ),child: Padding(
      padding: const EdgeInsets.fromLTRB(8,20,8,10),
      child: Column(

            children: information
        ),
    ),
    ) ,])]));


  }
  void displayDialog(context, title, text) => showDialog(
    context: context,
    builder: (context) =>
        AlertDialog(
            title: Text(title),
            content: Text(text)
        ),
  );

}