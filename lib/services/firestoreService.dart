import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:live/models/companyData.dart';

class FirestoreService {
  //refernce to users collection
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  //return a user's data
  Stream<DocumentSnapshot> user(String userId) {
    return users.doc(userId).snapshots();
  }

  //reference to companies collection
  CollectionReference companies =
      FirebaseFirestore.instance.collection('companies');

  //create a company
  Future<void> createCompany(
      {required String country,
      required String city,
      required String developer,
      required String agent,
      required String agency,
      required String brandName,
      required String brandLogo}) async {
    CompanyModel companyModel = CompanyModel(
      country: country,
      city: city,
      developer: developer,
      agent: agent,
      agency: agency,
      brandName: brandName,
      brandLogo: brandLogo,
    );
    try {
      await companies.add(companyModel.company());
    } on FirebaseException catch (e) {
      print(e.toString());
    }
  }

  Future<Map<String, dynamic>> changeLanguage(
      String userId, String language) async {
    try {
      await users.doc(userId).update({'language': language});
      return {'success': true, 'error': ''};
    } on FirebaseException catch (e) {
      return {'success': false, 'error': e.code};
    }
  }

  Future<Map<String, dynamic>> changePhone(String userId, String phone) async {
    try {
      await users.doc(userId).update({'phone_number': phone});
      return {'success': true, 'error': ''};
    } on FirebaseException catch (e) {
      return {'success': false, 'error': e.code};
    }
  }
}
