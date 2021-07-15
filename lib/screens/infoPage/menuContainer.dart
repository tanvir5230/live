import 'dart:math';

import 'package:flutter/material.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';

Widget menuContainer(size) {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      manInTheMiddle(),
      Container(
        //color: Colors.red,
        width: size.width,
        height: size.height * .55,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            renderMenuContainer(sideName: "left", angle: 1),
            Flexible(
              flex: 30,
              child: Container(),
            ),
            renderMenuContainer(sideName: 'right', angle: -1),
          ],
        ),
      ),
    ],
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
    padding: const EdgeInsets.only(bottom: 6.0),
    child: Transform(
      transform: menuSide == 'left'
          ? Matrix4.rotationZ(angle / 180 * pi)
          : Matrix4.rotationZ(-angle / 180 * pi),
      alignment: Alignment.center,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            right: menuSide == 'left' ? -4 : null,
            left: menuSide == 'right' ? -4 : null,
            top: 16,
            height: 10,
            child: Icon(
              Icons.circle,
              color: Colors.white,
              size: 10,
            ),
          ),
          Container(
            width: double.infinity,
            height: 40,
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
        ],
      ),
    ),
  );
}

Widget manInTheMiddle() {
  return Positioned(
    child: Transform.translate(
      offset: Offset(-10, -10),
      child: Container(
        height: 350,
        decoration: BoxDecoration(
          //color: Colors.yellow,
          image: DecorationImage(image: AssetImage('assets/images/man.png')),
        ),
      ),
    ),
  );
}
