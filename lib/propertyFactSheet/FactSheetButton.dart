import 'dart:math';
import 'package:flutter/material.dart';
import 'package:live/screens/authenticate/signup/shared.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';

Widget factSheetButtonLeft(String title, String value) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: Transform(
      transform: Matrix4.rotationZ(1 / 180 * pi),
      child: OutlineGradientButton(
        onTap: () {},
        child: Column(
          children: [
            Text(
              title.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 11,
                letterSpacing: 1,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              value.toLowerCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                letterSpacing: 1,
                color: Colors.white.withOpacity(.8),
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(.1),
            Colors.white.withOpacity(.9),
          ],
          end: Alignment.centerRight,
          begin: Alignment.centerLeft,
        ),
        strokeWidth: 2,
      ),
    ),
  );
}

Widget factSheetButtonRight(String title, dynamic value) {
  bool isMap = title.contains('google map');
  return Container(
    height: isMap ? 50 : null,
    padding: const EdgeInsets.only(bottom: 8.0),
    child: Transform(
      transform: Matrix4.rotationZ(-1 / 180 * pi),
      child: OutlineGradientButton(
        padding: isMap ? EdgeInsets.zero : EdgeInsets.all(8.0),
        onTap: () {
          if (isMap) {
            launchURL(
                'https://www.google.com/maps/place//@${value.latitude != null ? value.latitude : ''},${value.longitude != null ? value.longitude : ''},16z');
            print(
                "https://www.google.com/maps/place//@${value.latitude != null ? value.latitude : ''},${value.longitude != null ? value.longitude : ''},16z'");
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            !isMap
                ? Text(
                    title.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : Container(),
            isMap
                ? Container(
                    padding: EdgeInsets.zero,
                    width: double.infinity,
                    decoration: isMap
                        ? BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.red.withOpacity(.1),
                                Colors.red.shade900,
                              ],
                            ),
                          )
                        : null,
                    height: 34,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/map.png',
                          width: 20,
                          height: 30,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'google map'.toUpperCase(),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )
                : Text(
                    value.toString().toLowerCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white.withOpacity(.8),
                      fontSize: 10,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ],
        ),
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(.9),
            Colors.white.withOpacity(.1),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        strokeWidth: 2,
      ),
    ),
  );
}
