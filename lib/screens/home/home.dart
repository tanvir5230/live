import 'package:flutter/material.dart';
import 'package:live/provider/HomepageProvider.dart';
import 'package:live/screens/home/filterWidget.dart';
import 'package:live/screens/home/renderBrands.dart';
import 'package:live/screens/home/searchWidget.dart';
import 'package:live/screens/home/sideSmallMenu.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              ChangeNotifierProvider<HomepageProvider>(
                create: (context) => HomepageProvider(),
                child: Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            'CHOOSE YOUR BRAND',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.3,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                        child: FilterSection(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SearchBox(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: RenderBrands(),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                child: MyMenu(),
                top: 10,
                left: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
