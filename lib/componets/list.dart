import 'package:flutter/material.dart';

class HisList extends StatelessWidget {

  String titelText1;
  String subText2;
  HisList({required this.subText2,required this.titelText1});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: ListTile( title: Text(titelText1,style:

          TextStyle(fontSize: 25,fontWeight: FontWeight.bold),) , subtitle: Row(

            children: [
              Icon(Icons.alarm),
              Text(subText2,style: TextStyle(fontSize: 20),)
            ],
          ),),
          color: Color(0xffFDFDFC),
        ),
    Divider(
    thickness: 5,),
      ],

    );


  }
}
