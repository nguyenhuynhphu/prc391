import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth {
  Future<String> signIn(String email, String password);

  Future<String> signUp(String email, String password);

  Future<User> getCurrentUser();

  Future<void> signOut();

  Stream<String> get onAuthStateChanged;
}

class Auth implements BaseAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Stream<String> get onAuthStateChanged {
    return _auth.authStateChanges().map((user) => user?.uid);
  }

  User currentUser;
  @override
  Future<String> signIn(String email, String password) async {
    try {
      var result = await _auth
          .signInWithEmailAndPassword(
              email: email.toString().trim(), password: password)
          .then((value) {});
    } catch (e) {
      return e.toString();
    }
  }

  @override
  Future<void> signOut() {
    return _auth.signOut();
  }

  @override
  Future<String> signUp(String email, String password) async {
    FirebaseAuth tempAuth = FirebaseAuth.instance;
    var result = await tempAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  @override
  Future<User> getCurrentUser() async {
    return _auth.currentUser;
  }
}
