import 'package:flutter/material.dart';
import 'package:patient1/componets/list%202.dart';
import 'package:patient1/screens/patient_account.dart';

import '../componets/list.dart';
import 'my_account.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:Icon(Icons.access_time_filled_rounded) ,
        title: Text('Appointments',style:
        TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
        actions: [ IconButton(onPressed:
            (){Navigator.push(context, MaterialPageRoute(builder:
                (context){return MyAccount();}));}, icon:Icon( Icons.menu))],
        
      ),
      body:Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Text('Wedensday ,22 May 2019',style:
              TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            ),
          ),
          ListViewSeparated(
              itemCount: 5,
              child: HisList(subText2: '10.30',titelText1: 'lilian Riga',)),
          ElevatedButton(onPressed:
              (){Navigator.push(context, MaterialPageRoute(builder:
              (context){return PatientAccount();}));}, child: Text('patient'))

        ],

      ),


    );
  }
}