import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:live/provider/HomepageProvider.dart';
import 'package:live/screens/authenticate/signup/shared.dart';
import 'package:live/screens/home/filterWidget.dart';
import 'package:live/screens/home/homeDrawerContent/homeDrawer.dart';
import 'package:live/screens/home/renderBrands.dart';
import 'package:live/screens/home/searchWidget.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<HomepageProvider>(
        builder: (context, provider, child) {
          // final user = provider.user;
          // if (user == null) {
          //   provider.loadUser();
          // }
          return Scaffold(
            appBar: MediaQuery.of(context).size.width > 1000
                ? PreferredSize(
                    preferredSize: Size.fromHeight(150),
                    child: Column(
                      children: [
                        AuthHeaderForPC(),
                        myAppBar(),
                      ],
                    ),
                  )
                : myAppBar(),
            drawer: Drawer(
              child: HomeDrawerContent(),
            ),
            backgroundColor: Colors.grey.shade100,
            body: LayoutBuilder(
              builder: (context, constrains) {
                if (constrains.maxWidth < 1000) {
                  return SingleChildScrollView(
                    child: Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
                            child: FilterSection(),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: SearchBox(),
                          ),
                          SingleChildScrollView(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: RenderBrands(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 15,
                          child: Container(),
                        ),
                        Expanded(
                          flex: 20,
                          child: FilterSection(),
                        ),
                        Expanded(
                          flex: 40,
                          child: SingleChildScrollView(
                            child: Container(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: SearchBox(),
                                  ),
                                  SingleChildScrollView(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: RenderBrands(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 25,
                          child: Container(),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}

AppBar myAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.black),
    elevation: 0,
    centerTitle: true,
    title: Text(
      'CHOOSE YOUR BRAND',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        letterSpacing: 1,
        color: Colors.black,
      ),
    ),
  );
}
