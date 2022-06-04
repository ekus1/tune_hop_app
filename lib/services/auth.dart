import 'package:firebase_auth/firebase_auth.dart';
import 'package:tune_hop_app/models/user.dart';
import 'package:tune_hop_app/services/database.dart';

class AuthService {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  TuneHopUser _mapUserFromUserCredentials(UserCredential userCredential) {
    return TuneHopUser(userCredential.user!.uid, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, userCredential.additionalUserInfo?.username);
  }

  TuneHopUser? _mapUserFromUser(User? user) {
    if (user != null) {
      return TuneHopUser(user.uid, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, user.displayName);
    }
    return null;
  }

  Stream<TuneHopUser?> get user {
    return _firebaseAuth.authStateChanges().map((user) => _mapUserFromUser(user));
  }

  Future signInAnon(String displayName) async {
    try {
      UserCredential userCredential = await _firebaseAuth.signInAnonymously();

      User? user = userCredential.user;
      if (user != null) {
        await DatabaseService(user.uid).updateUserData(displayName, 0, 0, 0, 0, 0, 0);
      }

      return _mapUserFromUserCredentials(userCredential);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  String? getCurrentUserUid() {
    final User? user = _firebaseAuth.currentUser;
    return user?.uid;
  }

  Future signOut() async {
    try {
      return await _firebaseAuth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

}
