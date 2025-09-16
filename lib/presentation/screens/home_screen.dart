import 'package:flutter/material.dart';
import 'package:google_facebook_sign_in/presentation/providers/auth_provider.dart';
import 'package:google_facebook_sign_in/presentation/screens/auth_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthNotifier>(context,listen: false);
    return Scaffold(
appBar: AppBar(
  automaticallyImplyLeading: false,
  title: Text('Home'),centerTitle: true,
  actions: [
    IconButton(onPressed: () {
      auth.signOut();
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => AuthScreen(),));
    }, icon: Icon(Icons.logout))
  ],
),
      body: Center(
        child: Text('Welcome ${auth.user?.email}',style: Theme.of(context).textTheme.headlineMedium,),
      ),
    );
  }
}
