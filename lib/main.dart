//import 'package:avatar_glow/avatar_glow.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:live/data.dart';
import 'package:live/screens/home/filterWidget.dart';
import 'package:live/screens/home/renderBrands.dart';
import 'package:live/screens/home/searchWidget.dart';
import 'package:live/screens/home/sideSmallMenu.dart';
import 'package:live/screens/wrapper.dart';
//import 'package:live/screens/wrapper.dart';
//import 'package:speech_to_text/speech_to_text.dart' as stt;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '@live',
      home: Scaffold(
        body: Wrapper(),
      ),
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: '@live',
//       home: Scaffold(
//         body: Home(),
//       ),
//     );
//   }
// }

// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);

//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   //this will all dropdown item for filter section such as countries, cities etc. after getting comapny data from firebase
//   Set allCountries = {};
//   Set allCities = {};
//   Set allDevelopers = {};
//   Set allAgents = {};
//   Set allAgencies = {};
//   void loadDropDownItems() async {
//     // QuerySnapshot brands =
//     //     await FirebaseFirestore.instance.collection('companies').get();
//     // List listOfBrands = brands.docs.map((item) => item).toList();
//     List listOfBrands = companies;
//     List allCountries2 = <String>[];
//     List allCities2 = <String>[];
//     List allDevelopers2 = <String>[];
//     List allAgents2 = <String>[];
//     List allAgencies2 = <String>[];
//     listOfBrands.forEach((item) {
//       allCountries2.add(item['country']);
//       allCities2.add(item['city']);
//       allDevelopers2.add(item['developer']);
//       allAgents2.add(item['agent']);
//       allAgencies2.add(item['agency']);
//     });
//     setState(() {
//       allCountries = allCountries2.toSet();
//       allCities = allCities2.toSet();
//       allDevelopers = allDevelopers2.toSet();
//       allAgents = allAgents2.toSet();
//       allAgencies = allAgencies2.toSet();
//     });
//   }

//   //this is for search textfield
//   String searchedBrandName = '';
//   void brandSearch(String value) {
//     setState(() {
//       searchedBrandName = value;
//     });
//   }

//   //this is for country filtering
//   String selectedCountryName = '';
//   bool enabledCountryFilter = false;
//   void countrySearch(String value) {
//     setState(() {
//       selectedCountryName = value;
//       enabledCountryFilter = !enabledCountryFilter;
//     });
//   }

//   void cancelCountryFilter() {
//     setState(() {
//       enabledCountryFilter = false;
//     });
//   }

//   //this is city filtering
//   String selectedCityName = '';
//   bool enabledCityFilter = false;
//   void citySearch(String value) {
//     setState(() {
//       selectedCityName = value;
//       enabledCityFilter = !enabledCityFilter;
//     });
//   }

//   void cancelCitytyFilter() {
//     setState(() {
//       enabledCityFilter = false;
//     });
//   }

//   //this is developers filtering
//   String selectedDevelopersName = '';
//   bool enabledDevelopersFilter = false;
//   void developersSearch(String value) {
//     setState(() {
//       selectedDevelopersName = value;
//       enabledDevelopersFilter = !enabledDevelopersFilter;
//     });
//   }

//   void cancelDevelopersFilter() {
//     setState(() {
//       enabledDevelopersFilter = false;
//     });
//   }

// //this is agent filtering
//   String selectedAgentName = '';
//   bool enabledAgentFilter = false;
//   void agentSearch(String value) {
//     setState(() {
//       selectedAgentName = value;
//       enabledAgentFilter = !enabledAgentFilter;
//     });
//   }

//   void cancelAgentFilter() {
//     setState(() {
//       enabledAgentFilter = false;
//     });
//   }

//   //this is agencies filtering
//   String selectedAgenciesName = '';
//   bool enabledAgenciesFilter = false;
//   void agenciesSearch(String value) {
//     setState(() {
//       selectedAgenciesName = value;
//       enabledAgenciesFilter = !enabledAgenciesFilter;
//     });
//   }

//   void cancelAgenciesFilter() {
//     setState(() {
//       enabledAgenciesFilter = false;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     loadDropDownItems();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: SingleChildScrollView(
//           child: Stack(
//             children: [
//               Container(
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: 50,
//                       width: double.infinity,
//                       child: Center(
//                         child: Text('CHOOSE YOUR BRAND',
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 letterSpacing: 1.3)),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
//                       child: filterSection(
//                         enabledCountryFilter,
//                         countrySearch,
//                         cancelCountryFilter,
//                         enabledCityFilter,
//                         citySearch,
//                         cancelCitytyFilter,
//                         enabledDevelopersFilter,
//                         developersSearch,
//                         cancelDevelopersFilter,
//                         enabledAgentFilter,
//                         agentSearch,
//                         cancelAgentFilter,
//                         enabledAgenciesFilter,
//                         agenciesSearch,
//                         cancelAgenciesFilter,
//                         {
//                           'countries': allCountries.toList(),
//                           'cities': allCities.toList(),
//                           'developers': allDevelopers.toList(),
//                           'agents': allAgents.toList(),
//                           'agencies': allAgencies.toList(),
//                         },
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 20),
//                       child: searchBox(brandSearch),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 20),
//                       child: RenderBrands(
//                           searchedBrandName,
//                           selectedCountryName,
//                           enabledCountryFilter,
//                           selectedCityName,
//                           enabledCityFilter,
//                           selectedDevelopersName,
//                           enabledDevelopersFilter,
//                           selectedAgentName,
//                           enabledAgentFilter,
//                           selectedAgenciesName,
//                           enabledAgenciesFilter,
//                           loadDropDownItems),
//                     )
//                   ],
//                 ),
//               ),
//               Positioned(
//                 child: MyMenu(),
//                 top: 10,
//                 left: 20,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class RenderBrands extends StatefulWidget {
//   final String searchedBrandName;
//   final String selectedCountry;
//   final bool coutryFilterEnabled;
//   final String selectedCity;
//   final bool cityFilterEnabled;
//   final String selectedDeveloper;
//   final bool developerFilterEnabled;
//   final String selectedAgent;
//   final bool agentFilterEnabled;
//   final String selectedAgency;
//   final bool agencyFilterEnabled;
//   final Function loadDropDownItems;

//   const RenderBrands(
//     this.searchedBrandName,
//     this.selectedCountry,
//     this.coutryFilterEnabled,
//     this.selectedCity,
//     this.cityFilterEnabled,
//     this.selectedDeveloper,
//     this.developerFilterEnabled,
//     this.selectedAgent,
//     this.agentFilterEnabled,
//     this.selectedAgency,
//     this.agencyFilterEnabled,
//     this.loadDropDownItems,
//   );

//   @override
//   _RenderBrandsState createState() => _RenderBrandsState();
// }

// class _RenderBrandsState extends State<RenderBrands> {
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Container(
//         padding: EdgeInsets.only(top: 10),
//         height: MediaQuery.of(context).size.height - 163,
//         child: FutureBuilder(
//           future: comData(),
//           builder: (BuildContext context, AsyncSnapshot snapshot) {
//             if (!snapshot.hasData) {
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             } else if (snapshot.hasData) {
//               List companies = snapshot.data;

//               List getFilteredList(companyList) {
//                 return companyList
//                     .where((element) => element['brandName']
//                         .toString()
//                         .contains(widget.searchedBrandName))
//                     .toList();
//               }

//               void filterByCountry(List companyList) {
//                 List filteredBrandByCountry = companies
//                     .where((element) =>
//                         element['country'].toString().toLowerCase() ==
//                         widget.selectedCountry.toLowerCase())
//                     .toList();
//                 companies = filteredBrandByCountry;
//               }

//               void filterByCity(List companyList) {
//                 List filteredBrandByCity = companies
//                     .where((element) =>
//                         element['country'].toString().toLowerCase() ==
//                         widget.selectedCountry.toLowerCase())
//                     .toList();
//                 companies = filteredBrandByCity;
//               }

//               if (widget.coutryFilterEnabled) filterByCountry(companies);
//               if (widget.cityFilterEnabled) filterByCity(companies);

//               return ListView.builder(
//                   itemCount: getFilteredList(companies).length > 0
//                       ? getFilteredList(companies).length
//                       : 1,
//                   itemBuilder: (BuildContext context, index) {
//                     final List filteredBrandNames =
//                         getFilteredList(companies).toList();
//                     return filteredBrandNames.length > 0
//                         ? renderBrandList(filteredBrandNames, index)
//                         : Text('nothing found.');
//                   });
//             } else {
//               return Text('error');
//             }
//           },
//         ),
//       ),
//     );
//   }
// }

// Widget renderBrandList(List companies, int index) {
//   return Container(
//     height: 70,
//     margin: EdgeInsets.symmetric(vertical: 10),
//     decoration: BoxDecoration(
//         border: Border.all(color: Colors.black12),
//         borderRadius: BorderRadius.all(Radius.circular(10))),
//     child: Center(
//       child: ListTile(
//         onTap: () {},
//         leading: CircleAvatar(
//           backgroundImage: NetworkImage(companies[index]['brandLogo']),
//         ),
//         title: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10),
//           child: Text(companies[index]['brandName']),
//         ),
//       ),
//     ),
//   );
// }
