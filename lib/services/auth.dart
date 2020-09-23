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

  // UserRepository userRepository = new UserRepository();

  @override
  Stream<String> get onAuthStateChanged {
    return _auth.authStateChanges().map((user) => user?.uid);
  }

  // @override
  // Future<FirebaseUser> getCurrentUser() async {
  //   FirebaseUser user = await _auth.currentUser();
  //   var tmp = user.providerData.toList()[0];
  //   return user;
  // }

  User currentUser;
  @override
  Future<String> signIn(String email, String password) async {
    try {
      var result = await _auth
          .signInWithEmailAndPassword(
              email: email.toString().trim(), password: password)
          .then((value) {});
      // userRepository
      //     .fetchUserByEmail(email.toString().trim())
      //     .then((value) => currentUser = value);
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
    var result = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  @override
  Future<FirebaseUser> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }
}
