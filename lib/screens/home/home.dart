import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:live/provider/HomepageProvider.dart';
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
          provider.loadUser();
          final user = provider.user;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(color: Colors.black),
              elevation: 0,
              title: Text(
                'CHOOSE YOUR BRAND',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  color: Colors.black,
                ),
              ),
            ),
            drawer: Drawer(
              child: user != null
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
                                      backgroundImage:
                                          NetworkImage(user['photoUrl']),
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
                                  title:
                                      Text('language: \t ${user['language']}'),
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
                                  title: Text(
                                      'phone no: \t ${user["phone_number"]}'),
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
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
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
                  : Container(),
            ),
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
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
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: RenderBrands(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
