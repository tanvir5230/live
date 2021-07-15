import 'package:flutter/material.dart';
import 'package:live/services/authenticationService.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
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
                  ),
                ],
              ),
              child: IconButton(
                splashColor: Colors.grey,
                padding: EdgeInsets.zero,
                icon: Icon(Icons.menu_rounded),
                onPressed: () {
                  setState(() {
                    height == 0 ? height = 200 : height = 0;
                  });
                },
              ),
            ),
          ),
          SizedBox(
            width: 40,
            height: height,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    padding: EdgeInsets.all(5.0),
                    color: Colors.black,
                    iconSize: 30,
                    onPressed: () {},
                    icon: Image.asset('assets/images/phone.png'),
                  ),
                  IconButton(
                    padding: EdgeInsets.all(5.0),
                    color: Colors.black,
                    iconSize: 30,
                    onPressed: () {},
                    icon: Image.asset('assets/images/whatsapp.png'),
                  ),
                  IconButton(
                    padding: EdgeInsets.all(5.0),
                    color: Colors.white,
                    iconSize: 25,
                    onPressed: () {
                      AuthService().signOut();
                    },
                    icon: Icon(Icons.login_outlined),
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
