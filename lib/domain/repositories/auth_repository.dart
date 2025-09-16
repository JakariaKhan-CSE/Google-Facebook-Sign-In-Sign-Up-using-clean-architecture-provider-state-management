import 'package:flutter/cupertino.dart';
import 'package:google_facebook_sign_in/domain/entities/user_entity.dart';

abstract class AuthRepository{
  Future<UserEntity?> signUp(String email, String password, BuildContext context);
  Future<UserEntity?> signIn(String email, String password, BuildContext context);
  Future<UserEntity?> googleSignIn();
  Future<UserEntity?> facebookSignIn();
  Future<void> signOut();
  Stream<UserEntity?> get user;
}