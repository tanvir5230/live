import 'package:flutter/material.dart';
import 'package:live/propertyFactSheet/propertyFactSheet.dart';
import 'package:live/provider/companyInfoProvider.dart';
import 'package:live/screens/infoPage/footer.dart';
import 'package:live/screens/infoPage/infoHeader.dart';
import 'package:live/screens/infoPage/menu.dart';
import 'package:live/screens/infoPage/menuContainer.dart';
import 'package:live/screens/projectFactSheet/projectFactSheet.dart';
import 'package:provider/provider.dart';

class InfoPage extends StatelessWidget {
  final String selectedCompany;
  final List companyProjectList;
  InfoPage(this.selectedCompany, this.companyProjectList);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<CompanyInfoProvider>(
      builder: (context, provider, child) {
        provider.setSelectedCompanyName = selectedCompany;
        provider.setSelectedCompanyProjectList = companyProjectList;

        return Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(provider.bgImage),
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(.1), BlendMode.darken),
                fit: BoxFit.cover),
          ),
          child: SafeArea(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: size.height,
                  width: size.width,
                  child: Column(
                    children: [
                      InfoHeader(),
                      MenuContainer(),
                      Footer(),
                    ],
                  ),
                ),
                Positioned(
                  child: Menu(),
                  top: 10,
                  left: 10,
                ),
                provider.showPropertyFactSheet
                    ? propertyFS(context, provider)
                    : Text(''),
                provider.showProjectFSSelOpt
                    ? projectOptionsForFS(provider)
                    : Text(''),
                provider.showProjectFS ? projectFS(context, provider) : Text('')
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget propertyFS(context, provider) {
  return Center(
    child: Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(provider.bgImage),
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(.1), BlendMode.darken),
            fit: BoxFit.cover),
      ),
      child: PropertyFactSheet(),
    ),
  );
}

Widget projectOptionsForFS(provider) {
  return Container(
    height: double.infinity,
    width: double.infinity,
    color: Colors.black87,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "choose a project to show its fact sheet".toUpperCase(),
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            height: 300,
            width: 150,
            child: ListView.builder(
              itemCount: provider.companyProjectList!.length,
              itemBuilder: (context, index) {
                Map projectData = provider.companyProjectList![index];
                String key = projectData.keys.elementAt(0);
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.all(20),
                      side: BorderSide(
                        color: Colors.white,
                        width: 1,
                      ),
                    ),
                    onPressed: () {
                      provider.changeProjectFSViewStatus();
                      provider.fsOfSelectedProject(key, index);
                    },
                    child: Text(
                      '$key',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        SizedBox(
          width: 200,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              provider.changeProjectFSStatus();
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.red.shade900,
            ),
            child: Text('cancel'),
          ),
        ),
      ],
    ),
  );
}

Widget projectFS(context, provider) {
  return Center(
    child: Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(provider.bgImage),
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(.1), BlendMode.darken),
            fit: BoxFit.cover),
      ),
      child: ProjectFactSheet(),
    ),
  );
}
