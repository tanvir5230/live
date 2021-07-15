import 'package:flutter/material.dart';

Widget menu() {
  return Positioned(
    child: SizedBox(
      width: 40,
      height: 40,
      child: Container(
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 2,
            ),
          ],
        ),
        child: IconButton(
          splashColor: Colors.grey,
          padding: EdgeInsets.zero,
          icon: Icon(Icons.menu_rounded),
          onPressed: () {},
        ),
      ),
    ),
    top: 10,
    left: 10,
  );
}
