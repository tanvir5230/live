import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:live/services/authenticationService.dart';
import 'package:live/services/firestoreService.dart';

class HomepageProvider extends ChangeNotifier {
//load user data
  Map<String, dynamic>? user;
  void loadUser() async {
    user = await FirestoreService().user(AuthService().getCurrentUser()!.uid);
  }

//this will all dropdown item for filter section such as countries, cities etc. after getting company data from firebase
  Set allCountries = {};
  Set allCities = {};
  Set allDevelopers = {};
  Set allAgents = {};
  Set allAgencies = {};

  void loadDropDownItems() async {
    QuerySnapshot brands =
        await FirebaseFirestore.instance.collection('companies').get();
    List listOfBrands = brands.docs.map<dynamic>((item) => item).toList();
    List allCountries2 = <String>[];
    List allCities2 = <String>[];
    List allDevelopers2 = <String>[];
    List allAgents2 = <String>[];
    List allAgencies2 = <String>[];
    listOfBrands.forEach((item) {
      allCountries2.add(item['country']);
      allCities2.add(item['city']);
      allDevelopers2.add(item['developer']);
      allAgents2.add(item['agent']);
      allAgencies2.add(item['agency']);
    });
    allCountries = allCountries2.toSet();
    allCities = allCities2.toSet();
    allDevelopers = allDevelopers2.toSet();
    allAgents = allAgents2.toSet();
    allAgencies = allAgencies2.toSet();
    notifyListeners();
  }

  //this is for search text field
  String searchedBrandName = '';
  void brandSearch(String value) {
    searchedBrandName = value;
    notifyListeners();
  }

  //this is for country filtering
  String selectedCountryName = '';
  bool enabledCountryFilter = false;
  void countrySearch(String value) {
    selectedCountryName = value;
    enabledCountryFilter = !enabledCountryFilter;
    notifyListeners();
  }

  void cancelCountryFilter() {
    enabledCountryFilter = false;
    notifyListeners();
  }

  //this is city filtering
  String selectedCityName = '';
  bool enabledCityFilter = false;
  void citySearch(String value) {
    selectedCityName = value;
    enabledCityFilter = !enabledCityFilter;
    notifyListeners();
  }

  void cancelCityFilter() {
    enabledCityFilter = false;
    notifyListeners();
  }

  //this is developers filtering
  String selectedDevelopersName = '';
  bool enabledDevelopersFilter = false;
  void developersSearch(String value) {
    selectedDevelopersName = value;
    enabledDevelopersFilter = !enabledDevelopersFilter;
    notifyListeners();
  }

  void cancelDevelopersFilter() {
    enabledDevelopersFilter = false;
    notifyListeners();
  }

//this is agent filtering
  String selectedAgentName = '';
  bool enabledAgentFilter = false;
  void agentSearch(String value) {
    selectedAgentName = value;
    enabledAgentFilter = !enabledAgentFilter;
    notifyListeners();
  }

  void cancelAgentFilter() {
    enabledAgentFilter = false;
    notifyListeners();
  }

  //this is agencies filtering
  String selectedAgenciesName = '';
  bool enabledAgenciesFilter = false;
  void agenciesSearch(String value) {
    selectedAgenciesName = value;
    enabledAgenciesFilter = !enabledAgenciesFilter;
    notifyListeners();
  }

  void cancelAgenciesFilter() {
    enabledAgenciesFilter = false;
    notifyListeners();
  }
}
