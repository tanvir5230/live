import 'package:firebase_auth/firebase_auth.dart';
import 'package:live/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //my custom user model
  CustomUser? customUser(User? user) {
    return user != null ? CustomUser(user.uid) : null;
  }

  //sign up
  Future signUp(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return {'user': customUser(result.user)!.uid, 'error': null};
    } on FirebaseAuthException catch (e) {
      return {
        'user': null,
        'error': e,
      };
    } catch (e) {
      return {
        'user': null,
        'error': e,
      };
    }
  }

  //sign in
  Future signIn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return {'user': customUser(result.user), 'error': null};
    } on FirebaseAuthException catch (e) {
      return {
        'user': null,
        'error': e,
      };
    } catch (e) {
      return {
        'user': null,
        'error': e,
      };
    }
  }

  //signout
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      return null;
    }
  }
}
