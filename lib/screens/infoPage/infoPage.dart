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
    return SingleChildScrollView(
      child: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(.1), BlendMode.darken),
              fit: BoxFit.cover,
              image: AssetImage(
                'assets/images/background1.jpeg',
              ),
            ),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              menu(),
              Column(
                children: <Widget>[
                  logo(size),
                  renderInfoHeaders(size),
                  menuContainer(size),
                  footer(size),
                ],
              ),
              Positioned(
                child: Container(
                  padding: EdgeInsets.zero,
                  color: Colors.white.withOpacity(.9),
                  child: Icon(
                    Icons.qr_code_2_outlined,
                    size: 40,
                    color: Colors.black,
                  ),
                ),
                bottom: 80,
                left: size.width * .45,
              )
            ],
          )),
    );
  }
}
