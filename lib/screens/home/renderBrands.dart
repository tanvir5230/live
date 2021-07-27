import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:live/provider/HomepageProvider.dart';
import 'package:live/provider/companyInfoProvider.dart';
import 'package:live/screens/infoPage/infoPage.dart';
import 'package:provider/provider.dart';

class RenderBrands extends StatefulWidget {
  const RenderBrands({Key? key}) : super(key: key);

  @override
  _RenderBrandsState createState() => _RenderBrandsState();
}

class _RenderBrandsState extends State<RenderBrands> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomepageProvider>(
      builder: (context, provider, child) => SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 10),
          height: MediaQuery.of(context).size.height - 163,
          child: FutureBuilder(
            future: FirebaseFirestore.instance.collection('companies').get(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasData) {
                List companies = snapshot.data!.docs;

                List getFilteredList(companyList) {
                  return companyList
                      .where((element) => element['brandName']
                          .toString()
                          .contains(provider.searchedBrandName))
                      .toList();
                }

                void filterByCountry(List companyList) {
                  List filteredBrandByCountry = companies
                      .where((element) =>
                          element['country'].toString().toLowerCase() ==
                          provider.selectedCountryName.toLowerCase())
                      .toList();
                  companies = filteredBrandByCountry;
                }

                void filterByCity(List companyList) {
                  List filteredBrandByCity = companies
                      .where((element) =>
                          element['city'].toString().toLowerCase() ==
                          provider.selectedCityName.toLowerCase())
                      .toList();
                  companies = filteredBrandByCity;
                }

                void filterBydevelopers(List companyList) {
                  List filteredBrandByDevelopers = companies
                      .where((element) =>
                          element['developer'].toString().toLowerCase() ==
                          provider.selectedDevelopersName.toLowerCase())
                      .toList();
                  companies = filteredBrandByDevelopers;
                }

                void filterByAgent(List companyList) {
                  List filteredBrandByAgent = companies
                      .where((element) =>
                          element['agent'].toString().toLowerCase() ==
                          provider.selectedAgentName.toLowerCase())
                      .toList();
                  companies = filteredBrandByAgent;
                }

                void filterByAgencies(List companyList) {
                  List filteredBrandByAgencies = companies
                      .where((element) =>
                          element['agency'].toString().toLowerCase() ==
                          provider.selectedAgenciesName.toLowerCase())
                      .toList();
                  companies = filteredBrandByAgencies;
                }

                if (provider.enabledCountryFilter) filterByCountry(companies);
                if (provider.enabledCityFilter) filterByCity(companies);
                if (provider.enabledDevelopersFilter)
                  filterBydevelopers(companies);
                if (provider.enabledAgentFilter) filterByAgent(companies);
                if (provider.enabledAgenciesFilter) filterByAgencies(companies);

                return ListView.builder(
                    itemCount: getFilteredList(companies).length > 0
                        ? getFilteredList(companies).length
                        : 1,
                    itemBuilder: (BuildContext context, index) {
                      final List filteredBrandNames =
                          getFilteredList(companies).toList();
                      return filteredBrandNames.length > 0
                          ? renderBrandList(filteredBrandNames, index)
                          : Center(
                              child: Text('nothing found.',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                            );
                    });
              } else {
                return Text('error');
              }
            },
          ),
        ),
      ),
    );
  }
}

Widget renderBrandList(List companies, int index) {
  return ChangeNotifierProvider<CompanyInfoProvider>(
    create: (context) => CompanyInfoProvider(),
    child: Container(
      height: 70,
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Center(
        child: Consumer<CompanyInfoProvider>(
          builder: (context, provider, child) {
            return ListTile(
              onTap: () {
                provider.setSelectedCompanyName = companies[index]['brandName'];
                provider.setSelectedCompanyProjectList =
                    companies[index]['project'];
                var companyName = provider.selectedCompany;
                var companyList = provider.companyProjectList;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Scaffold(
                      body: ChangeNotifierProvider<CompanyInfoProvider>(
                        create: (context) => CompanyInfoProvider(),
                        child: InfoPage(companyName!, companyList!),
                      ),
                    ),
                  ),
                );
              },
              leading: CircleAvatar(
                backgroundImage: NetworkImage(companies[index]['brandLogo']),
              ),
              title: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(companies[index]['brandName']),
              ),
            );
          },
        ),
      ),
    ),
  );
}
