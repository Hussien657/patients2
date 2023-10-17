import 'package:flutter/material.dart';

import '../componets/doctor.dart';


class MyAccount extends StatelessWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:Icon(Icons.access_time_filled_rounded) ,
        title: SingleChildScrollView(
          child: Text('My Account',style:
          TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
        ),
      ),
      body: Column(
        children: [
          CircleAvatar(backgroundImage: Image.asset('assets/OIP.jpg').image,radius: 80,),
          Text('Maria lona loante',style:
          TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
          Text('Hbc Name',style: TextStyle(fontSize: 15),),
          SizedBox(height: 50,),
         Doctor(text: '0106349164', icon: (Icons.phone_android_sharp)),
          Doctor(text: 'maria@gmail.com', icon: (Icons.report_gmailerrorred_outlined)),
          Doctor(text: '49 nava streat', icon: (Icons.shopping_bag)),
          SizedBox(height: 70,),
          ElevatedButton(onPressed: (){Navigator.pop(context);}, child: Text('Back')),
        ],
        
      ),
    );
  }
}
