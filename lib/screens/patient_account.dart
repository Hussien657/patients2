import 'package:flutter/material.dart';
import 'package:patient1/componets/doctor.dart';
  class PatientAccount extends StatelessWidget {
    const PatientAccount({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          leading:Icon(Icons.access_time_filled_rounded) ,
          title: Text('Appointments',style:
          TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
          actions: [ IconButton(onPressed: (){}, icon:Icon( Icons.menu))],

        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(backgroundImage:
                  Image.asset('assets/OIP.jpg').image,radius: 60,),
                  SizedBox(width: 15,),
                  Column(
                    children: [
                      Text('Dimitri Simana',style: TextStyle
                        (fontSize: 25,fontWeight: FontWeight.bold),),
                      ElevatedButton(onPressed:() {}, child:Text('Midical History') )
                    ],
                  ),
                ],
              ),
              SizedBox(height: 65,),
              Doctor(text: '08 00, 09,30', icon: Icons.alarm),
              SizedBox(height: 10,),
              Doctor(text: '01016349164', icon: Icons.phone_android),
              SizedBox(height: 10,),
              Doctor(text: 'Elnimas 20street', icon: Icons.local_pizza_outlined),
              SizedBox(height: 10,),
              Doctor(text: 'Flrrtin', icon: Icons.medical_information),
              SizedBox(height: 80,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed:() {}, child:Text('Start progrors') ),
                  ElevatedButton(onPressed:null, child:Text('Edit') ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed:() {Navigator.pop(context);}, child:Text('Back') ),
                  ElevatedButton(onPressed:(){}, child:Text('patient Massegs') ),
                ],
              ),

            ],

          ),
        ),
      );
    }
  }

