import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_facebook_sign_in/domain/entities/user_entity.dart';
import 'package:google_facebook_sign_in/domain/repositories/auth_repository.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _firebase_auth = FirebaseAuth.instance;

  UserEntity? _userFromFirebase(User? user) {
    if (user == null) return null;
    return UserEntity(uid: user.uid, email: user.email, name: user.displayName);
  }

  @override
  Future<UserEntity?> signUp(String email, String password) async {
    final credential = await _firebase_auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return _userFromFirebase(credential.user);
  }

  @override
  Future<UserEntity?> signIn(String email, String password) async {
    final credential = await _firebase_auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return _userFromFirebase(credential.user);
  }

  @override
  Future<UserEntity?> googleSignIn() async {
    // final googleAuth = await GoogleSignIn.instance.authenticate();
    // final credential = GoogleAuthProvider.credential(
    //   accessToken: googleAuth.acce
    // );
    // TODO: implement facebookSignIn
    throw UnimplementedError();
  }

  @override
  Future<UserEntity?> facebookSignIn() async {
    final result = await FacebookAuth.instance.login();
    if (result.status == LoginStatus.success) {
      final credential = FacebookAuthProvider.credential(
        result.accessToken!.tokenString,
      );
      final userCred = await _firebase_auth.signInWithCredential(credential);
      return _userFromFirebase(userCred.user);
    }
    return null;
  }

  @override
  Future<void> signOut() async{
    await _firebase_auth.signOut();
  }

  @override
  // TODO: implement user
  Stream<UserEntity?> get user {
    return _firebase_auth.authStateChanges().map(_userFromFirebase);
  }
}
