import 'package:flutter/material.dart';
import 'package:patient1/service/dio.dart';
import 'package:patient1/src/app_root.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  runApp( AppRoot());
}

