import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient1/patient_cubit/patient_cubit.dart';
import 'package:patient1/screens/log_in.dart';

import '../screens/home_screen.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PatientCubit() )
      ],
      child: MaterialApp(
        home: LogIn(),
      ),
    );
  }
}

