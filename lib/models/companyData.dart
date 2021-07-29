class CompanyModel {
  final String country;
  final String city;
  final String developer;
  final String agent;
  final String agency;
  final String brandName;
  final String brandLogo;
  final List project = [];
  CompanyModel({
    required this.country,
    required this.city,
    required this.developer,
    required this.agent,
    required this.agency,
    required this.brandName,
    required this.brandLogo,
  });
  Map<String, dynamic> company() {
    return {
      'country': this.country,
      'city': this.city,
      'developer': this.developer,
      'agency': this.agency,
      'agent': this.agent,
      'brandName': this.brandName,
      'brandLogo': this.brandLogo,
      'project': [],
    };
  }
}

class ProjectModel {
  final String projectName;
  final List properties = [];
  final Map<String, dynamic> factsheetData = {
    'units type': '',
    'sizes from': '',
    'sizes to': '',
    'prices from': '',
    'prices to': '',
    'prices/sqt from': '',
    'prices/sqt to': '',
    'google map': '',
    'land name': '',
    'address': '',
    'land size': '',
    'project status': '',
    'project type': '',
    'total units': '',
    'payment terms': '',
  };
  ProjectModel(this.projectName);
}

class PropertyModel {
  final String properyName;
  final Map<String, dynamic> factsheetData = {
    'google map': '',
    'property size': '',
    'address': 'dhaka',
    'property status': '',
    'property type': '',
    'no of beds': '',
    'no of baths': '',
    'floor no': '',
    'total price': '',
    'price per sq ft': '',
    'service charges': '',
    'down payment': '',
    'installment period': '',
    'last payment': '',
    'registration fees': '',
  };
  PropertyModel(this.properyName);
}
