import 'package:flutter/cupertino.dart';

class CompanyInfoProvider extends ChangeNotifier {
  //design related (for all screens).
  double headingFontsize = 14;
  double normalFontSize = 11;
  double smallFontSize = 9;
  double heightOfInfoButton = 40.0;
  String bgImage = 'assets/images/background1.jpg';

  void scaleDefault() {
    headingFontsize = 14;
    normalFontSize = 11;
    smallFontSize = 9;
    heightOfInfoButton = 40;
    notifyListeners();
  }

  void scaleDouble() {
    headingFontsize = 18;
    normalFontSize = 22;
    smallFontSize = 18;
    heightOfInfoButton = 60;
    notifyListeners();
  }

  List? _companyPojectList;
  String? _selectedCompany;
  String? _selectedProject;
  List? _propertyNameList;
  Map? factSheetOfProperty;
  bool showPropertyFactSheet = false;
  String selectedProperty = '';

  List? get companyProjectList => this._companyPojectList;
  String? get selectedCompany => this._selectedCompany;
  String? get selectedProject => this._selectedProject;
  List? get propertyNameList => this._propertyNameList;

  set setSelectedCompanyName(String companyName) {
    this._selectedCompany = companyName;
  }

  set setSelectedCompanyProjectList(List projectList) {
    this._companyPojectList = projectList;
  }

  void selectProject(String projectName, Map project) {
    this._selectedProject = projectName;
    this._companyPojectList = null;
    project['properties']
        .forEach((item) => this._propertyNameList = item.keys.toList());
    notifyListeners();
  }

  void changePropertyFactSheetShow() {
    if (showPropertyFactSheet == true) {
      showPropertyFactSheet = false;
    } else {
      showPropertyFactSheet = true;
    }
    notifyListeners();
  }

  void selectProperty(String propertyName) {
    selectedProperty = propertyName;
    var project = companyProjectList!.firstWhere(
        (element) => element.toString().contains('$selectedProject'));
    var property = project[selectedProject]['properties'];
    factSheetOfProperty = property.firstWhere((element) =>
            element.toString().contains('$selectedProperty'))[selectedProperty]
        ['fact_sheet_data'];
    notifyListeners();
  }

  void reset() {
    _selectedProject = null;
    _propertyNameList = null;
    notifyListeners();
  }

  //project fact sheet related. FS means fact sheet.
  bool showProjectFSSelOpt = false;
  bool showProjectFS = false;
  Map? factsheetOfProject;
  void changeProjectFSStatus() {
    showProjectFSSelOpt = !showProjectFSSelOpt;
    notifyListeners();
  }

  void changeProjectFSViewStatus() {
    showProjectFSSelOpt = !showProjectFSSelOpt;
    showProjectFS = !showProjectFS;
    notifyListeners();
  }

  void fsOfSelectedProject(String projectName, int index) {
    _selectedProject = projectName;
    factSheetOfProperty = null;
    factsheetOfProject =
        companyProjectList![index][projectName]['fact_sheet_data'];
  }
}
