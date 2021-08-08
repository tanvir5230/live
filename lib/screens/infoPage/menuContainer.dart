import 'dart:math';
import 'package:flutter/material.dart';
import 'package:live/metadata.dart';
import 'package:live/provider/companyInfoProvider.dart';
import 'package:live/screens/authenticate/signup/shared.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:provider/provider.dart';

class MenuContainer extends StatelessWidget {
  const MenuContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          child: manInTheMiddle(),
        ),
        Consumer<CompanyInfoProvider>(
          builder: (context, provider, child) {
            return Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height - 270,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 35,
                    child: renderMenuContainerLeft(
                      brand: provider.selectedCompany,
                    ),
                  ),
                  Flexible(
                    flex: MediaQuery.of(context).size.width > 900 ? 15 : 30,
                    child: Container(),
                  ),
                  Flexible(
                    flex: 35,
                    child: MenuContainerRight(),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

Widget renderMenuContainerLeft({required brand}) {
  return SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        menuButtonLeft(brandName: brand, buttonText: 'LIVE'),
        menuButtonLeft(brandName: brand, buttonText: 'project'),
        menuButtonLeft(brandName: brand, buttonText: 'factsheet'),
        menuButtonLeft(brandName: null, buttonText: 'youtube record'),
        menuButtonLeft(brandName: null, buttonText: 'youtube live'),
        menuButtonLeft(brandName: null, buttonText: 'zoom live'),
        menuButtonLeft(brandName: null, buttonText: 'skype live'),
      ],
    ),
  );
}

//MenuContainerRight
class MenuContainerRight extends StatelessWidget {
  const MenuContainerRight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CompanyInfoProvider>(
      builder: (context, value, child) =>
          value.companyProjectList != null && value.propertyNameList == null
              ? ListView.builder(
                  itemCount: value.companyProjectList!.length,
                  itemBuilder: (BuildContext context, index) {
                    Map projectData = value.companyProjectList![index];
                    String key = projectData.keys.elementAt(0);
                    return projectButtonRight(
                        buttonText: key,
                        projectData: projectData,
                        projectSelectionFunc: value.selectProject,
                        bg: false,
                        showPropertyFactSheet: false);
                  },
                )
              : ListView.builder(
                  itemCount: value.propertyNameList!.length + 1,
                  itemBuilder: (BuildContext context, index) {
                    return index == 0
                        ? projectButtonRight(
                            buttonText: value.selectedProject,
                            projectData: null,
                            projectSelectionFunc: null,
                            bg: true,
                            showPropertyFactSheet: false,
                          )
                        : projectButtonRight(
                            buttonText: value.propertyNameList![index - 1],
                            projectData: null,
                            projectSelectionFunc: null,
                            bg: false,
                            showPropertyFactSheet: true,
                          );
                  },
                ),
    );
  }
}

Widget projectButtonRight(
    {required buttonText,
    required projectSelectionFunc,
    required projectData,
    required bool bg,
    required bool showPropertyFactSheet}) {
  return Consumer<CompanyInfoProvider>(
    builder: (context, provider, child) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 6.0),
        child: Transform(
          transform: Matrix4.rotationZ(-1 / 180 * pi),
          alignment: Alignment.center,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: double.infinity,
                height: provider.heightOfInfoButton,
                decoration: bg
                    ? BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.red.shade900,
                            Colors.red.withOpacity(.1)
                          ],
                        ),
                      )
                    : null,
                child: OutlineGradientButton(
                  onTap: () {
                    if (projectData != null && showPropertyFactSheet != true)
                      provider.selectProject(
                          buttonText, projectData[buttonText]);
                    if (showPropertyFactSheet) {
                      provider.changePropertyFactSheetShow();
                      provider.selectProperty(buttonText);
                    }
                  },
                  child: Center(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        buttonText.toString().toUpperCase(),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: provider.normalFontSize,
                        ),
                      ),
                    ),
                  ),
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(.1),
                      Colors.white.withOpacity(.9),
                    ],
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                  ),
                  strokeWidth: 2,
                ),
              ),
              Positioned(
                left: -4,
                top: provider.heightOfInfoButton > 40 ? 27 : 16,
                height: 10,
                child: Icon(
                  Icons.circle,
                  color: bg ? Colors.amber : Colors.white,
                  size: 10,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget manInTheMiddle() {
  return Transform.translate(
    offset: Offset(-10, 0),
    child: Container(
      height: 350,
      decoration: BoxDecoration(
        //color: Colors.yellow,
        image: DecorationImage(image: AssetImage('assets/images/man.png')),
      ),
    ),
  );
}

Widget menuButtonLeft({required String? brandName, required buttonText}) {
  return Consumer<CompanyInfoProvider>(builder: (context, provider, child) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Transform(
        transform: Matrix4.rotationZ(1 / 180 * pi),
        alignment: Alignment.center,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: double.infinity,
              height: provider.heightOfInfoButton,
              child: OutlineGradientButton(
                onTap: () {
                  if (buttonText == 'factsheet') {
                    provider.changeProjectFSStatus();
                  } else if (buttonText == 'youtube live') {
                    launchURL(links['youtube_live']);
                  } else if (buttonText == 'youtube record') {
                    launchURL(links['youtube']);
                  } else if (buttonText == 'zoom live') {
                    launchURL(links['zoom']);
                  } else if (buttonText == 'skype live') {
                    launchURL(links['skype']);
                  }
                },
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        brandName != null
                            ? brandName +
                                ' ' +
                                buttonText.toString().toUpperCase()
                            : buttonText.toString().toUpperCase(),
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          color: Colors.white.withOpacity(.9),
                          fontSize: provider.normalFontSize,
                        ),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                    ],
                  ),
                ),
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(.1),
                    Colors.white.withOpacity(.9),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                strokeWidth: 2,
              ),
            ),
            Positioned(
              right: -4,
              top: provider.heightOfInfoButton > 40 ? 27 : 16,
              height: 10,
              child: Icon(
                Icons.circle,
                color: buttonText.toString().toLowerCase() == 'project'
                    ? Colors.green
                    : Colors.white,
                size: 10,
              ),
            ),
          ],
        ),
      ),
    );
  });
}
