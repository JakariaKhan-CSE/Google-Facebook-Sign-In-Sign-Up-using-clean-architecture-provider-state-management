import 'package:flutter/cupertino.dart';
import 'package:google_facebook_sign_in/domain/entities/user_entity.dart';
import 'package:google_facebook_sign_in/domain/repositories/auth_repository.dart';

class AuthProvider extends ChangeNotifier{
  final AuthRepository authRepository;
  UserEntity? _user;
  UserEntity? get user => _user;
  AuthProvider(this.authRepository){
    authRepository.user.listen((user) {
      _user = user;
      notifyListeners();
    },);
  }

  Future<void> signUp(String email, String password)async{
    _user = await authRepository.signUp(email, password);
    notifyListeners();
  }

  Future<void> signIn(String email, String password)async{
    _user = await authRepository.signIn(email, password);
    notifyListeners();
  }

  Future<void> googleSignIn() async {
    _user = await authRepository.googleSignIn();
    notifyListeners();
  }

  Future<void> facebookSignIn()async{
    _user = await authRepository.facebookSignIn();
  }

  Future<void> signOut()async{
    await authRepository.signOut();
    _user = null;
    notifyListeners();
  }
}