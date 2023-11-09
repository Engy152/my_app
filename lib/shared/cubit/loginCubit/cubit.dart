import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_app/models/user_model.dart';
import 'package:my_app/network/http.dart';
import 'package:my_app/shared/cubit/loginCubit/states.dart';

class LoginCubit extends Cubit<LoginStates>
{
  LoginCubit():super(AppInitialStates());
  static LoginCubit get(context) => BlocProvider.of(context);
 ///
 //  void userLogin({required Map<String,dynamic> data})
 //  {
 //    Athentivation.postRequest(url: 'http://85.93.89.54:8020/token', data: data ).then((value) {
 //      if(value.statusCode==200){
 //        final resp=json.decode(value.body);
 //        print(resp);
 //
 //        emit(LoginSuccessStates());
 //        //postmodel = PostModel.fromJson(data);
 //        //emit(LScseesStates());
 //      }
 //      else if(value.statusCode == 400)
 //      {
 //        final resp=json.decode(value.body);
 //        print(resp);
 //        emit(LoginErrorStates());
 //       
 //      }
 //    
 //
 //    }).catchError((error){
 //      print(error);
 //
 //      emit(LoginErrorStates());
 //
 //    });
 //  }
UserModel? loginmodel;
void postLogin({
  required String userName,
  required String password
}) async
{
  emit(LoginLodingStates());
  await Api().post(
      url: 'http://85.93.89.54:8020/token',
      body: {
        'userName': userName,
        'password': password,
        'grant_type': 'password',
      },
      header:
      {
        'Content-Type': 'application/x-www-form-urlencoded',
      }).then((value)
  {
    final data = json.decode(value.body);
    print(data);
    if(value.statusCode==200){
      loginmodel = UserModel.fromJson(data);
      emit(LoginSuccessStates());
      Fluttertoast.showToast(msg: 'تم تسجيل الدخول بنجاح');
    }else if(value.statusCode == 400)
    {
      print('error');
      final resp = json.decode(value.body);
      emit(LoginErrorStates());
      Fluttertoast.showToast(
          msg: '${resp['error_description']}');
    }
  }).catchError((error)
  {
    print('error.toString()$error');
   emit(LoginErrorStates());
  });
}
}