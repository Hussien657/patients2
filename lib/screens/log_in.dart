import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient1/model/model.dart';
import 'package:patient1/patient_cubit/patient_cubit.dart';
import 'package:patient1/patient_cubit/patient_cubit.dart';
import 'package:patient1/screens/register.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'home_screen.dart';


class LogIn extends StatelessWidget {

  TextEditingController email = TextEditingController();
  TextEditingController pass =TextEditingController();
  var form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<PatientCubit, PatientState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var  cubit = PatientCubit.get(context);
          return SingleChildScrollView(
            child: Stack(
              children: [
                Image.asset('assets/Union (1).png'),
                Column(
                  children: [
                    SizedBox(height: 35,),
                    Text('Walcome Back!', style: TextStyle
                      (fontSize: 30, fontWeight:
                    FontWeight.bold, color: Colors.black),),
                    Text('Enter your Username & password',
                      style: TextStyle(fontSize: 20),),
                    SizedBox(height: 150,),
                    Form(
                      key: form,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFormField(
                              validator: (v){
                                if (v==null||v.isEmpty){
                                  return 'plase enter your name';
                                }else if (!RegExp(r'^[\w-.]+@([\w-]+.)+[\w-]{2,4}$').hasMatch(v)) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                              controller: email,
                              decoration: InputDecoration(
                            hintText: 'Email',
                          )),
                          SizedBox(height: 25,),
                          TextFormField(
                              validator: (v){
                                if (v==null||v.isEmpty){
                                  return 'plase enter your pass';
                                }
                                return null;
                              },
                              controller: pass,
                              decoration: InputDecoration(
                              hintText: 'PassWord', border: OutlineInputBorder(
                              borderSide: BorderSide(width: 10))
                          )),
                        ],
                      ),
                    ),
                    SizedBox(height: 150,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(onPressed: () {
                          if (form.currentState!.validate()) {
                            cubit.login(login: Login(email: email.text,
                                pass: pass.text), funlogin: () {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return HomeScreen();
                                  }));
                            }
                            ,fildlogin: (){
                              Alert(context : context,title: 'error'
                                  ,desc:'check mail & password' ).show();
                                }
                            );

                          }

                        }, child: Text('Log In')),
                        ElevatedButton(onPressed: () {

                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) {return Register();}));
                        }, child: Text('Sign Up')),
                      ],
                    ),

//a@a.com
                  ],

                ),
              ],
            ),
          );
        },
      ),

    );
  }
}
