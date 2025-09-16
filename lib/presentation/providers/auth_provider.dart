import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_facebook_sign_in/domain/entities/user_entity.dart';
import 'package:google_facebook_sign_in/domain/repositories/auth_repository.dart';
import 'package:google_facebook_sign_in/presentation/screens/home_screen.dart';
import 'package:google_facebook_sign_in/presentation/screens/login_screen.dart';

class AuthNotifier extends ChangeNotifier{
  // Login
  final loginFormKey = GlobalKey<FormState>();
  bool loginValidateAndSave(){
    final form = loginFormKey.currentState;
    if(form != null && form.validate()){
      form.save();
      return true;
    }
    else{
      return false;
    }
  }
// Register
  final registerFormKey = GlobalKey<FormState>();
  bool registerValidateAndSave(){
    final form = registerFormKey.currentState;
    if(form != null && form.validate()){
      form.save();
      return true;
    }
    else{
      return false;
    }
  }

  final AuthRepository authRepository;
  UserEntity? _user;
  UserEntity? get user => _user;
  AuthNotifier(this.authRepository){
    authRepository.user.listen((user) {
      _user = user;
      notifyListeners();
    },);
  }

  Future<void> signUp(String email, String password, BuildContext context)async{
    _user = await authRepository.signUp(email, password);
    if(_user!.uid.isNotEmpty){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Register Successful'),backgroundColor: Colors.green,));
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen(),));
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Register Failed'),backgroundColor: Colors.red,));
    }

    notifyListeners();
  }

  Future<void> signIn(String email, String password, BuildContext context)async{
    _user = await authRepository.signIn(email, password);
    if(_user!.uid.isNotEmpty){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login Successful'),backgroundColor: Colors.green,));
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen(),));
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login Failed'),backgroundColor: Colors.red,));
    }
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