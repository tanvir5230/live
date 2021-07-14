import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:live/services/authenticationService.dart';

class MyMenu extends StatefulWidget {
  const MyMenu({Key? key}) : super(key: key);

  @override
  _MyMenuState createState() => _MyMenuState();
}

class _MyMenuState extends State<MyMenu> {
  //double height = 0.0;
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
                  ),
                ],
              ),
              child: IconButton(
                splashColor: Colors.grey,
                padding: EdgeInsets.zero,
                icon: Icon(Icons.menu_rounded),
                onPressed: () async {
                  // setState(() {
                  //   //height == 0 ? height = 100 : height = 0;
                  // });
                  return await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: CupertinoAlertDialog(
                          title: Text(
                            "Logout",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          content: Text('Are you sure to log out?'),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                AuthService().signOut();
                                Navigator.pop(context);
                              },
                              child: Text('confirm'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('No'),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
          // SizedBox(
          //   width: 40,
          //   height: height,
          //   child: Container(
          //     //color: Colors.red,
          //     child: Column(
          //       children: [
          //         Container(
          //           color: Colors.white,
          //           child: IconButton(
          //             color: Colors.black54,
          //             iconSize: 30,
          //             onPressed: () {
          //               AuthService().signOut();
          //             },
          //             icon: Icon(Icons.login_outlined),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
