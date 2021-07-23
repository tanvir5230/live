import 'package:flutter/material.dart';
import 'package:live/propertyFactSheet/propertyFactSheet.dart';
import 'package:live/provider/companyInfoProvider.dart';
import 'package:live/screens/infoPage/footer.dart';
import 'package:live/screens/infoPage/infoHeader.dart';
import 'package:live/screens/infoPage/menu.dart';
import 'package:live/screens/infoPage/menuContainer.dart';
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
                if (provider.showPropertyFactSheet)
                  Center(
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
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
