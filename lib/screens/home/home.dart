import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:live/provider/HomepageProvider.dart';
import 'package:live/screens/authenticate/signup/shared.dart';
import 'package:live/screens/home/filterWidget.dart';
import 'package:live/screens/home/renderBrands.dart';
import 'package:live/screens/home/searchWidget.dart';
import 'package:live/services/authenticationService.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<HomepageProvider>(
        builder: (context, provider, child) {
          final user = provider.user;
          if (user == null) {
            provider.loadUser();
          }
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
              child: HomeDrawerContent(user: user),
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

class HomeDrawerContent extends StatelessWidget {
  const HomeDrawerContent({Key? key, required this.user}) : super(key: key);

  final user;
  @override
  Widget build(BuildContext context) {
    return user != null
        ? Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.greenAccent,
                        Colors.blueAccent,
                      ],
                    ),
                  ),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 80,
                          height: 80,
                          child: CircleAvatar(
                            radius: 30.0,
                            backgroundImage: NetworkImage(user['photoUrl']),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(user['name'].toString().toUpperCase()),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      ListTile(
                        title: Text('language: ${user['language']}'),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: Colors.blue,
                          ),
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ListTile(
                        title: Text('phone no: ${user["phone_number"]}'),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.edit_rounded,
                            color: Colors.blue,
                          ),
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),

                //########### sign out button ##############//
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red.shade900,
                  ),
                  onPressed: () async {
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
                  child: Text('sign out'),
                ),
                //########### sign out button ##############//

                //########### admin button ##############//
                user['user_type'] == 'admin'
                    ? ElevatedButton(
                        onPressed: () {},
                        child: Text('admin panel'),
                      )
                    : Text(''),
                //########### admin button ##############//
              ],
            ),
          )
        : Container();
  }
}
