//Login and signup form's theme related

import 'package:flutter/material.dart';

const formBgColor =
    0x00CC000000; //this is the background color of login and signup form
const normalTextColor = 0XFFFFFFFF; //normal text color all over the app
const dimTextColor = ''; //this is for gloomy text color
const hintBgColor = ''; //this is placeholder background
const hintTextColor = ''; //this the placeholder color of form
const cborderRadius =
    10.0; //border radius for all types of button, input field etc.
const cborderColor = 0xB3FFFFFF; //border color of form input field
const cbuttonTextColor = 0xFF000000;

//button style
final cbuttonStyle = ElevatedButton.styleFrom(
    padding: EdgeInsets.symmetric(vertical: 23.0),
    primary: Color(cborderColor),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)));
//button text style
Widget cbuttonTextStyle(String text) {
  return Text(
    '$text',
    style: TextStyle(
        color: Color(cbuttonTextColor),
        fontSize: 15.0,
        fontWeight: FontWeight.bold),
  );
}

const ctextInputFieldStyle =
    TextStyle(color: Color(normalTextColor)); //input field color
const textInputField = InputDecoration(
  hintText: '',
  hintStyle: TextStyle(color: Colors.white54),
  contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.redAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(cborderRadius)),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(cborderRadius)),
    borderSide: BorderSide(color: Colors.white70, width: 2.0),
  ),
  fillColor: Colors.white10,
  filled: true,
);
