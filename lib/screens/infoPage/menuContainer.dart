import 'dart:math';

import 'package:flutter/material.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';

Widget menuContainer(size) {
  return Container(
    width: size.width,
    height: size.height * .55,
    child: Row(
      children: [
        renderMenuContainer(sideName: "left", angle: 1),
        Flexible(
          flex: 30,
          child: Container(
              //color: Colors.purple,
              ),
        ),
        renderMenuContainer(sideName: 'right', angle: -1),
      ],
    ),
  );
}

Widget renderMenuContainer({required String sideName, required int angle}) {
  return Flexible(
      flex: 35,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            menuButton(menuSide: sideName, menuName: 'hello', angle: 1),
            menuButton(menuSide: sideName, menuName: 'hello', angle: 1),
            menuButton(menuSide: sideName, menuName: 'hello', angle: 1),
            menuButton(menuSide: sideName, menuName: 'hello', angle: 1),
            menuButton(menuSide: sideName, menuName: 'hello', angle: 1),
            menuButton(menuSide: sideName, menuName: 'hello', angle: 1)
          ],
        ),
      ));
}

Widget menuButton(
    {required String menuSide, required String menuName, required int angle}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10.0),
    child: Transform(
      transform: menuSide == 'left'
          ? Matrix4.rotationZ(angle / 180 * pi)
          : Matrix4.rotationZ(-angle / 180 * pi),
      alignment: Alignment.center,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: double.infinity,
            height: 35,
            child: OutlineGradientButton(
              onTap: () {},
              child: Center(
                child: Text(
                  menuName,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(.1),
                  Colors.white.withOpacity(.9),
                ],
                begin: menuSide == "left"
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
                end: menuSide == "left"
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
              ),
              strokeWidth: 2,
            ),
          ),
          Positioned(
            right: menuSide == 'left' ? -4 : null,
            left: menuSide == 'right' ? -4 : null,
            top: 14,
            height: 10,
            child: Icon(
              Icons.circle,
              color: Colors.white,
              size: 10,
            ),
          ),
        ],
      ),
    ),
  );
}
