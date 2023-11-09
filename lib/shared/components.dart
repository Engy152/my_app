import 'dart:ffi';

import 'package:flutter/material.dart';

Widget title() => Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Image(image: AssetImage('images/titleicon.png'),),
    SizedBox(width: 23.0,),
    Text(
      'sv-Test',
      style: TextStyle
        (
        color: Colors.black,
        fontSize: 50.0,
        fontFamily: 'Acme-Regular.ttf',
      ),
    ),
  ],);


Widget text({required String text, required double fontSize, required Color colorText}) => Text(
  text,
  style: TextStyle
    (
    color: colorText,
    fontSize: fontSize,
    fontFamily: 'Acme-Regular.ttf',
  ),
);
