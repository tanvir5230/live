import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:live/services/authenticationService.dart';

class MyMenu extends StatefulWidget {
  const MyMenu({Key? key}) : super(key: key);

  @override
  _MyMenuState createState() => _MyMenuState();
}

class _MyMenuState extends State<MyMenu> {
  double height = 0.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          SizedBox(
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
                      //offset: Offset(3,3) // changes position of shadow
                    ),
                  ],
                ),
                child: IconButton(
                  splashColor: Colors.grey,
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.menu_rounded),
                  onPressed: () {
                    setState(() {
                      height == 0 ? height = 100 : height = 0;
                    });
                  },
                ),
              )),
          SizedBox(
            width: 40,
            height: height,
            child: Container(
              //color: Colors.red,
              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                    child: IconButton(
                      color: Colors.black54,
                      iconSize: 30,
                      onPressed: () {
                        AuthService().signOut();
                      },
                      icon: Icon(Icons.login_outlined),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
