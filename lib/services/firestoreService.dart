import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:live/models/companyData.dart';

class FirestoreService {
  //refernce to users collection
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  //check a user whether he is admin or not
  Future user(String userId) async {
    try {
      final DocumentSnapshot snapshot = await users.doc(userId).get();
      Map<String, dynamic> userData = snapshot.data() as Map<String, dynamic>;
      return userData;
    } catch (e) {
      return null;
    }
  }
  // .then((value) {
  //     if (value.exists) {
  //       Map<String, dynamic> user = value.data() as Map<String, dynamic>;
  //       if (user['user_type'] == 'admin') {
  //         admin = true;
  //       }
  //     } else {
  //       admin = false;
  //     }
  //   });

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
    } catch (e) {
      print(e.toString());
    }
  }
}
