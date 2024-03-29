import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:live/services/authenticationService.dart';
import 'package:path/path.dart';

class AuthenticationProvider extends ChangeNotifier {
  //toggleview is used to toggle between sign up and login
  bool showSignup = false;
  bool showLogin = true;

  void toggleView() {
    if (showLogin) {
      showSignup = true;
      showLogin = false;
    } else {
      showLogin = true;
      showSignup = false;
    }
    notifyListeners();
  }

// both for sign up and login //

  String email = '';
  String password = '';
  String error = '';

  void changeMail(String mail) {
    email = mail;
    notifyListeners();
  }

  void changePass(String pass) {
    password = pass;
    notifyListeners();
  }

// both for sign up and login //

// ################################## //
// login related ################### //

  final loginFormKey = GlobalKey<FormState>();
  bool isChecked = false;
  bool loginLoading = false;

  void check(bool checkedVal) {
    isChecked = checkedVal;
    notifyListeners();
  }

  void submitLogin() async {
    if (loginFormKey.currentState!.validate()) {
      //result will contain a Map having two props name user and error
      loginLoading = true;
      notifyListeners();
      final result = await AuthService().signIn(email, password);
      if (result['user'] == null) {
        loginLoading = false;
        error = result['error'].code;
        notifyListeners();
      } else {
        error = '';
        loginFormKey.currentState!.reset();
        notifyListeners();
      }
    } else {
      return;
    }
  }
// ################################## //
// login finsished ################### //

// ################################## //
// signup related ################### //

  final signupFormKey = GlobalKey<FormState>();

  //registered users information
  String name = '';
  String phoneNo = '';
  String countryCode = '+974';
  String confirmPassword = '';
  dynamic currentSelectedLanguage;
  bool showDropdownError = false;
  XFile? img;
  String? fileName = '';
  String imageUrl = '';
  String sourceOfPhoto = '';
  bool signupLoading = false;

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  void changeName(String name) {
    this.name = name;
    notifyListeners();
  }

  void changePhone(String phone) {
    this.phoneNo = phone;
    notifyListeners();
  }

  void changeCountryCode(String code) {
    this.countryCode = code;
  }

  void passConfirmation(String pass) {
    this.confirmPassword = pass;
    notifyListeners();
  }

  void selectLanguage(dynamic val) {
    this.currentSelectedLanguage = val;
    notifyListeners();
  }

  void takeImage(String source) async {
    if (source.length > 0) {
      img = await ImagePicker().pickImage(
        source: source == 'camera' ? ImageSource.camera : ImageSource.gallery,
      );
      File file = File(img!.path);
      fileName = basename(file.path);
    }
    notifyListeners();
  }

  void submitReg() async {
    if (currentSelectedLanguage == null) {
      showDropdownError = true;
      notifyListeners();
    }

    if (signupFormKey.currentState!.validate() &&
        currentSelectedLanguage != null) {
      signupLoading = true;
      notifyListeners();
      final result = await AuthService().signUp(email, password);
      if (result['user'] == null) {
        signupLoading = false;
        error = result['error'].code;
        notifyListeners();
      } else {
        error = '';
        final uid = result['user'];
        await addUser(uid, fileName == null ? "" : fileName!);
        signupFormKey.currentState!.reset();
        notifyListeners();
      }
    }
  }

  Future<void> addUser(String uid, String imageName) async {
    //add user first
    try {
      await users.doc(uid).set({
        'name': name,
        'phone_number': countryCode + phoneNo,
        'email': email,
        'language': currentSelectedLanguage,
        'photoUrl': imageUrl,
      });
    } on FirebaseException catch (e) {
      print(e.code);
    }
    //upload image
    if (img != null) {
      File file = File(img!.path);
      try {
        final fileName = '${DateTime.now()}$imageName';
        await firebase_storage.FirebaseStorage.instance
            .ref('profile images/$fileName')
            .putFile(file);
        imageUrl = await firebase_storage.FirebaseStorage.instance
            .ref('profile images/$fileName')
            .getDownloadURL();
        await users.doc(uid).update({'photoUrl': imageUrl});
      } on FirebaseException catch (e) {
        print(e.code);
      }
    }
  }

// ################################## //
// signup finished ################### //
}
