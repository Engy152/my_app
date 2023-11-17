import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/modules/screens/homeScreen.dart';
import 'package:my_app/modules/screens/login.dart';
import 'package:my_app/network/bloc_obsercer.dart';
import 'package:my_app/network/cash_helper.dart';
import 'package:my_app/shared/cubit/HomePageCubit/cubit.dart';
import 'package:my_app/shared/cubit/loginCubit/cubit.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
 await CacheHelper.init();
 Widget widget;
 var token = CacheHelper.getData(key: 'token');
  if(token != null)
  {
    widget = HomeScreen();
  } else
  {
    widget = login();
  }
  runApp(MyApp(startWidget: widget,));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;
  const MyApp({super.key, required this.startWidget});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      //create: (BuildContext context) => LoginCubit(),
      providers: [
        BlocProvider(create:(BuildContext context) => LoginCubit(), ),
        BlocProvider(create:(BuildContext context) => HomePageCubit(), )

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: startWidget,
      ),
    );
  }
}
