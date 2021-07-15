import 'package:flutter/material.dart';
import 'package:live/screens/infoPage/footer.dart';
import 'package:live/screens/infoPage/infoHeader.dart';
import 'package:live/screens/infoPage/logo.dart';
import 'package:live/screens/infoPage/menu.dart';
import 'package:live/screens/infoPage/menuContainer.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter:
              ColorFilter.mode(Colors.black.withOpacity(.1), BlendMode.darken),
          fit: BoxFit.cover,
          image: AssetImage(
            'assets/images/background1.png',
          ),
        ),
      ),
      child: SafeArea(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: 10,
              left: 10,
              child: Menu(),
            ),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  logo(size),
                  renderInfoHeaders(size),
                  menuContainer(size),
                ],
              ),
            ),
            Positioned(
              child: footer(),
              bottom: 5,
              left: 0,
              right: 0,
            )
          ],
        ),
      ),
    );
  }
}
