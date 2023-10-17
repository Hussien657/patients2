import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient1/model/model.dart';
import 'package:patient1/patient_cubit/patient_cubit.dart';
import 'package:patient1/patient_cubit/patient_cubit.dart';
import 'package:patient1/screens/home_screen.dart';

class Register extends StatefulWidget {

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var form = GlobalKey<FormState>();

bool check =true;
  TextEditingController name =TextEditingController();
  TextEditingController email =TextEditingController();
  TextEditingController phone =TextEditingController();
  TextEditingController gender =TextEditingController();
  TextEditingController pass =TextEditingController();
  TextEditingController conpass =TextEditingController();
  int? genderSlected =0 ;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PatientCubit, PatientState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    var  cubit = PatientCubit.get(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset('assets/images/Union.png'),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text('Create \n Accont :)',style: TextStyle
                    (fontSize:
                  50,fontWeight:
                  FontWeight.bold),),


                ),
                SizedBox(height: 30,),
                Form(
                  key: form,
                  child: Column(
                    children: [
                      TextFormField(
                          controller: name,
                          validator: (v){
                            if (v==null||v.isEmpty){
                              return 'plase enter your name';
                            }
                            return null;
                          },
                          decoration:InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                        labelText: 'Name'
                      )),
                      TextFormField(
                          controller: email,
                          validator: (v){
                            if (v==null||v.isEmpty){
                              return 'plase enter your email';
                            }else if (!RegExp(r'^[\w-.]+@([\w-]+.)+[\w-]{2,4}$').hasMatch(v)) {
                              return 'Please enter a valid email';
                            }
                            return null;



                          },
                          decoration:InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(),
                          labelText: 'Email'
                      )),
                      TextFormField(
                          controller: phone,
                        keyboardType: TextInputType.number,
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          validator: (v){
                            if (v==null||v.isEmpty){
                              return 'plase enter your phone number';
                            }
                            return null;
                          },
                          decoration:InputDecoration(
                          prefixIcon: Icon(Icons.phone_android),
                          border: OutlineInputBorder(),
                          labelText: 'Phone'
                      )),

                      TextFormField(
                          controller: pass,
                          validator: (v){
                            if (v==null||v.isEmpty){
                              return 'plase enter your pass';
                            }
                            if(v.length < 8 ){
                              return 'plese enter 8 word';
                            }
                            return null;
                          },
                          obscureText: check,
                          decoration:InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(),
                          labelText: 'password',
                          suffixIcon: IconButton(icon:check?
                          Icon(Icons.visibility_off):Icon(Icons.visibility),
                            onPressed: () {
                   setState(() {
                      check = !check;});

                            },
                          )
                      )),
                      TextFormField(
                          controller: conpass,
                          validator: (v){
                            if (v==null||v.isEmpty){
                              return 'plase enter your check';
                            }
                            if(v != pass.text ){
                              return 'plese match password';
                            }

                            return null;

                          },
                          obscureText: check,
                          decoration:InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(),
                          labelText: 'Confarm Pass',
                              suffixIcon: IconButton(icon:check?
                              Icon(Icons.visibility_off):Icon(Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    check = !check;});

                                },
                              )
                      )),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                        ),
                        child: DropdownButton(
                          //isExpanded: true,
                          value: genderSlected,
                          hint: Text('Select your gender'),
                          icon: Icon(Icons.person),
                          items: [
                            DropdownMenuItem(
                              child: Row(
                                children: [
                                  Icon(Icons.male, color: Colors.blue),
                                  SizedBox(width: 8),
                                  Text('Male'),
                                ],
                              ),
                              value: 0,
                            ),
                            DropdownMenuItem(
                              child: Row(
                                children: [
                                  Icon(Icons.female, color: Colors.pink),
                                  SizedBox(width: 8),
                                  Text('Female'),
                                ],
                              ),
                              value: 1,
                            ),
                          ],
                          onChanged: (value) {
                            genderSlected=value;
                            setState(() {

                            });

                          },
                        ),
                      ),
                      //genderSlected==null
                      SizedBox(height: 30,),
                      Center(child:

                      ElevatedButton(style: ElevatedButton.styleFrom(
                        primary: Color(0xFFD0DB),
                      ),onPressed: (){
                        if (form.currentState!.validate()){
                          cubit.register(Register1(email: email.text,
                              name: name.text,
                              gender: genderSlected!,
                              phone: phone.text,
                              confirmation: conpass.text,
                              pass: pass.text), () {Navigator.pushReplacement(context, MaterialPageRoute(
                              builder: (context) {return HomeScreen();}));});
                        }

                      }, child: Text('Sige Up')))

                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  },
);
  }
}
