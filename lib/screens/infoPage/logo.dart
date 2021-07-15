import 'package:flutter/material.dart';

Widget logo(size) {
  return Center(
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      alignment: Alignment.center,
      height: size.height * .15,
      width: 170,
      decoration: BoxDecoration(color: Colors.white.withOpacity(.4)),
      child: Image(
        image: AssetImage('assets/images/app_logo_dark_large.png'),
      ),
    ),
  );
}
