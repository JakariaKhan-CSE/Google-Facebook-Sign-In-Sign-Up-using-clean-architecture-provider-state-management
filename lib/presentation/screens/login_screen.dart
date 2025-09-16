import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_facebook_sign_in/presentation/providers/auth_provider.dart';
import 'package:google_facebook_sign_in/presentation/screens/home_screen.dart';
import 'package:provider/provider.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthNotifier>(context,listen: true);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              'https://t4.ftcdn.net/jpg/01/19/11/55/360_F_119115529_mEnw3lGpLdlDkfLgRcVSbFRuVl6sMDty.jpg',
              fit: BoxFit.cover,
            ),
            SizedBox(height: 30),
            Text(
              'Login',
              style: Theme.of(
                context,
              ).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            Form(
                key: auth.loginFormKey,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(children: [
                    TextFormField(
                      controller: emailController,
                      enableSuggestions: true,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        label: Text('Email'),
                        hintText: 'Enter Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50)
                        )
                      ),
                      validator: (value) {
                        if(value!.isEmpty){
                          return "Please Enter Email";
                        }
                        else{
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 20,),
                    TextFormField(
                      controller: passwordController,
                      obscureText: auth.obsecureLogin,
                      enableSuggestions: true,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(onPressed: () {
                          auth.obsecureLogin = true;
                        }, icon: Icon(auth.obsecureLogin? Icons.visibility_off: Icons.visibility)),
                          label: Text('Password'),
                          hintText: 'Enter password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50)
                          )
                      ),
                      validator: (value) {
                        if(value!.isEmpty){
                          return "Please Enter Password";
                        }
                        else{
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 20,),
                    ElevatedButton(style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurpleAccent,
                        minimumSize: Size(200, 45)
                    ),onPressed: () {
                      if(auth.loginValidateAndSave()){
                        auth.signIn(emailController.text.trim(), passwordController.text.trim(),context);

                      }
                    }, child: Text('Sign In',style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20
                    ),)),
                  ]),
                )),
          ],
        ),
      ),
    );
  }
}
