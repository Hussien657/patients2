import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:patient1/model/model.dart';
import 'package:patient1/service/dio.dart';

import '../screens/register.dart';

part 'patient_state.dart';

class PatientCubit extends Cubit<PatientState> {
  PatientCubit() : super(PatientInitial());

  static PatientCubit get (context) =>  BlocProvider.of(context);




  void register(Register1 register, void Function()? funRegister){
DioHelper.dio.post(
  'https://vcare.integration25.com/api/auth/register',
  data:register.tojson(),
  options: Options(
    headers: {'Accept': 'application/json'}

  )
).then((value)  {print(value.data);
var data = value.data;
jsonDecode(data)['message'];
print(jsonDecode(data)['message']);
print(jsonDecode(data)['code']);
if(jsonDecode(data)['code']== 200){
  print('4ffjbskfbueyfgbskdfbkufgy');

  funRegister!();
}
});
  }

  void  login( {  void Function()? funlogin , required Login login, void Function()? fildlogin}){

    DioHelper.dio.post(
        'https://vcare.integration25.com/api/auth/login',

        data:login.tojson(),
        options: Options(
            headers: {'Accept': 'application/json'}
        )
    ).then((value)  {
    var data = value.data;
    jsonDecode(data)['message'];
    print(jsonDecode(data)['message']);
    print(jsonDecode(data)['code']);
    if(jsonDecode(data)['code']== 200){
      print('4ffjbskfbueyfgbskdfbkufgy');
      funlogin!();
    }else{
      fildlogin!();
    }

    }
    ).catchError ((onError){print(onError); });
    
  }


}
