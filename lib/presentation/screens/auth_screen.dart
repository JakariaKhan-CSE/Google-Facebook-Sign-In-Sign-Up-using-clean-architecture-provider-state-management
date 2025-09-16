import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/image/register.png',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20,),
              Text('Hello',style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Text('Welcome to little Drop, where you manage you daily task',style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),textAlign: TextAlign.center,),
              ),
              SizedBox(height: 30,),
              ElevatedButton(style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurpleAccent,
                minimumSize: Size(200, 45)
              ),onPressed: () {
                
              }, child: Text('Login',style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 20
              ),)),
              SizedBox(height: 20,),
              ElevatedButton(style: ElevatedButton.styleFrom(
                side: BorderSide(color: Colors.deepPurpleAccent),
                  backgroundColor: Colors.white,
                  minimumSize: Size(200, 45)
              ),onPressed: () {

              }, child: Text('Sign Up',style: TextStyle(
                  color: Colors.deepPurpleAccent,
                  fontWeight: FontWeight.w600,
                  fontSize: 20
              ),)),
            ],
          ),
        ),
      ),
    );
  }
}
