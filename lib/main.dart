import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/modules/screens/homeScreen.dart';
import 'package:my_app/modules/screens/login.dart';
import 'package:my_app/network/bloc_obsercer.dart';
import 'package:my_app/shared/cubit/HomePageCubit/cubit.dart';
import 'package:my_app/shared/cubit/loginCubit/cubit.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomePageCubit(),
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
