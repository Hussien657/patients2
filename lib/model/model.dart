import 'package:flutter/material.dart';

class Register1 {
  String name;
  String email;
  String phone;
  int gender;
  String pass ;
  String confirmation;
  Register1({required this.email, required this.name,
    required this.gender,required this.phone
    ,required this.confirmation,required this.pass});



  Map <String, dynamic> tojson()  {
    return
    {
      'name': name,
    'email': email,
    'phone': phone,
    'gender': gender,
    'password': pass,
    'password_confirmation': confirmation,

    };
}


}


class Login {
  String email;
  String pass ;
  Login({required this.email, required this.pass});


  Map <String, dynamic> tojson()  {
    return
      {
        'email': email,
        'password': pass,

      };
  }


}

