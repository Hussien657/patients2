import 'package:flutter/material.dart';
class Doctor extends StatelessWidget {
  String text;
  var icon;
  Doctor({required this.text,required this.icon});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Row(
        children: [
          Icon (icon),
          Text(text,style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }
}
