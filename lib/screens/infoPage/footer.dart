import 'package:flutter/material.dart';

Widget footer(size) {
  return Container(
    height: size.height * .15 - 20,
    width: double.infinity,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Flexible(
          flex: 2,
          child: leftButtons(),
        ),
        Flexible(
          flex: 6,
          child: socialButtons(),
        ),
        Flexible(
          flex: 2,
          child: rightButtons(),
        ),
      ],
    ),
  );
}

Widget leftButtons() {
  return Column(
    children: [
      cDivider(),
      cTextButton('scale'),
      cDivider(),
      cTextButton('back'),
      cDivider(),
    ],
  );
}

Widget cDivider() {
  return SizedBox(
    width: 50,
    height: 2,
    child: Divider(
      thickness: 4,
      color: Colors.white,
      // indent: 20,
      // endIndent: 20,
    ),
  );
}

Widget cTextButton(String text) {
  return TextButton(
    onPressed: () {},
    style: TextButton.styleFrom(
      padding: EdgeInsets.zero,
    ),
    child: Text(
      text.toUpperCase(),
      style: TextStyle(color: Colors.white),
    ),
  );
}

Widget socialButtons() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.facebook),
      ),
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.youtube_searched_for),
      ),
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.facebook),
      ),
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.facebook),
      ),
    ],
  );
}

Widget rightButtons() {
  return Column(
    children: [
      cDivider(),
      cTextButton('reset'),
      cDivider(),
      cTextButton('hide'),
      cDivider(),
    ],
  );
}
