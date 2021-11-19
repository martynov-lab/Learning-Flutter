import 'package:firebase_auth/firebase_auth.dart';

class AthorizationService {
  static Future<User?> singIn({
    required String email,
    required String password,
  }) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = result.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided.');
      }
    }
    return user;
  }

  static Future<User?> register(
      {required String name,
      required String email,
      required String password}) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      user = result.user;
      await user!.updateDisplayName(name);
      await user.reload();
      user = _auth.currentUser;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      return null;
    }
    return user;
  }

  static Future<User?> refreshUser(User user) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    await user.reload();
    User? refreshedUser = auth.currentUser;

    return refreshedUser;
  }

  Future<User?> getCurrentUser() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User user = auth.currentUser!;

    return user;
  }

  Future<User?> updateUserPhoto(String url) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User _user = auth.currentUser!;
    await _user.updatePhotoURL(url);
    await _user.reload();
    User updateUser = auth.currentUser!;
    return updateUser;
  }

  Future<void> singOut() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    await _auth.signOut();
  }
}
