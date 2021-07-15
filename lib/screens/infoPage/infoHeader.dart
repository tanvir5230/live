import 'package:flutter/material.dart';

Widget renderInfoHeaders(size) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: SizedBox(
      height: 120,
      width: 170,
      child: Column(
        children: <Widget>[
          Text(
            'company\ninfo'.toUpperCase(),
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
              letterSpacing: 2,
            ),
            textAlign: TextAlign.center,
          ),
          Divider(
            color: Colors.white,
            thickness: 4,
          ),
          Text('hello'.toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
                letterSpacing: 2,
              ),
              textAlign: TextAlign.center)
        ],
      ),
    ),
  );
}
