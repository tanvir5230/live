import 'package:avatar_glow/avatar_glow.dart';
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
                  return Stack(
                    children: [
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
                              child: FilterSection(),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: SearchBox(),
                            ),
                            SingleChildScrollView(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Container(
                                  padding: EdgeInsets.only(top: 5.0),
                                  height:
                                      MediaQuery.of(context).size.height - 180,
                                  child: RenderBrands(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      provider.showVoiceWidget
                          ? voiceInputContainer(provider)
                          : Container(),
                    ],
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
                          child: Stack(
                            children: [
                              Container(
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
                                        child: Container(
                                          padding: EdgeInsets.only(top: 5.0),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height -
                                              205,
                                          child: RenderBrands(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              provider.showVoiceWidget
                                  ? voiceInputContainer(provider)
                                  : Container(),
                            ],
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

Widget voiceInputContainer(HomepageProvider provider) {
  return Positioned(
    bottom: 0,
    left: 0,
    right: 0,
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      // height: 300,
      color: Colors.black87,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              provider.isListening
                  ? 'Speak to search brand'
                  : 'click the button and Start Speaking',
              style: TextStyle(
                color: Colors.red,
                fontSize: 14,
              ),
            ),
            AvatarGlow(
              startDelay: null,
              glowColor: Colors.white,
              endRadius: 80.0,
              duration: Duration(milliseconds: 2000),
              repeat: true,
              showTwoGlows: true,
              repeatPauseDuration: Duration(milliseconds: 100),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.transparent,
                  onSurface: Colors.transparent,
                  primary: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                onPressed: () {
                  provider.listen();
                },
                child: Material(
                  elevation: 8.0,
                  shape: CircleBorder(),
                  color: Colors.transparent,
                  child: CircleAvatar(
                    child: Icon(
                      Icons.mic,
                      size: 50,
                    ),
                    radius: 50.0,
                  ),
                ),
              ),
              shape: BoxShape.circle,
              animate: provider.isListening,
              curve: Curves.fastOutSlowIn,
            ),
            (provider.isListening && provider.voiceInputText.length == 0)
                ? Text(
                    '...'.toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                    ),
                  )
                : Text(
                    provider.voiceInputText.length > 0
                        ? 'you have search for \n${provider.voiceInputText.toUpperCase()}'
                        : '',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 16,
                    ),
                  ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red.shade900,
              ),
              onPressed: () {
                provider.resetVoiceSearch();
                provider.stopVoiceSearch();
                provider.showOrHideVoiceWidget();
              },
              child: Text('cancel voice search'),
            ),
          ],
        ),
      ),
    ),
  );
}
