import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/shared/components.dart';
import 'package:my_app/shared/cubit/loginCubit/cubit.dart';
import 'package:my_app/shared/cubit/loginCubit/states.dart';

class login extends StatelessWidget {
  Color mainColor = const Color(0xFF5885BC);
  String fontFamily = ('Acme-Regular.ttf');
  var userNameController = TextEditingController();
  var grandController = TextEditingController();
  var passwordController = TextEditingController();
  //var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<LoginCubit,LoginStates>(
      listener:(context,state)
      {},
      builder: (context,state)
      {
        return Scaffold(
          appBar: AppBar(backgroundColor: Colors.white,elevation: 0.0),
          body: Container(
            color: Colors.white,
            child: SingleChildScrollView(
              child: Form(
                //key: formKey,
                child: Column(
                  children: [
                    title(),
                    const SizedBox(height: 120,),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          text(text: 'Login', fontSize: 30.0, colorText: Colors.black),
                          const SizedBox(height: 5.5,),
                          text(text: 'userName', fontSize: 20.0, colorText: Colors.black),
                          TextFormField(
                            controller: userNameController,
                            decoration: const InputDecoration(
                              hintText: 'abc@gmail.com',
                              border: OutlineInputBorder(),
                            ),
                            keyboardType:TextInputType.emailAddress,
                            onFieldSubmitted: (value){
                            },
                            onChanged: (value){
                            },
                          ),
                          const SizedBox(height: 5.0,),
                          Row(
                            children: [
                              text(text: 'It must be more than 6 letter', fontSize: 12, colorText: mainColor),
                              const SizedBox(width: 5.5,),
                              const CircleAvatar(
                                radius: 4.0,
                                backgroundColor: Colors.grey,
                                child: Icon(
                                  Icons.question_mark,
                                  size: 7.0,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30.0,),
                          text(
                            text: 'Password',
                            fontSize: 20,
                            colorText: Colors.black,
                          ),
                          TextFormField(
                            controller: passwordController,
                            keyboardType: TextInputType.visiblePassword ,
                            obscureText: true,
                            onFieldSubmitted: (String value){print(value);},
                            decoration: const InputDecoration(
                              suffixIcon: Icon(Icons.remove_red_eye_outlined,color: Colors.black,),
                              hintText: '*******',
                              border: OutlineInputBorder(),
                            ),
                          ),

                          const SizedBox(height: 5.0,),

                          Row(
                            children: [
                              text(text:'It must be more than 6 letter', fontSize: 12.0, colorText: mainColor),
                              const SizedBox(width: 5.5,),
                              const CircleAvatar(
                                radius: 4.0,
                                backgroundColor: Colors.grey,
                                child: Icon(
                                  Icons.question_mark,
                                  size: 7.0,
                                  color: Colors.white,
                                ),
                              ),
                            ],

                          ),
                          //text(text: 'userName', fontSize: 30.0, colorText: Colors.black),

                          const SizedBox(height: 30.0,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 144.0,
                                child: ConditionalBuilder(
                                  condition:state is! LoginLodingStates,
                                  builder: (context) => MaterialButton
                                    (
                                    height: 61,
                                    shape: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(13),),
                                    onPressed: ()
                                    {
                                      LoginCubit.get(context).postLogin(
                                          userName: userNameController.text,
                                          password: passwordController.text,
                                      );
                                      // LoginCubit.get(context).userLogin(
                                      //   userName: emailController.text,
                                      //   password: passwordController.text, grant_type: grandController.text,
                                      // );
                                    },
                                    color: mainColor,
                                    child:
                                    text(text: 'Login', fontSize: 20.0, colorText: Colors.white),
                                  ),
                                  fallback:(context) => Center(child: CircularProgressIndicator()),
                                ),
                              ),
                              const SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  text(
                                      text: 'Don\'t have an account?',
                                      fontSize: 12.0,
                                      colorText: Colors.black),
                                  GestureDetector(
                                    onTap: ()
                                    {
                                     // Navigator.push(context, MaterialPageRoute(builder: (context)=>signUp()));
                                    },
                                    child:
                                    text(text: 'Sign up', fontSize: 12.0, colorText: mainColor),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
