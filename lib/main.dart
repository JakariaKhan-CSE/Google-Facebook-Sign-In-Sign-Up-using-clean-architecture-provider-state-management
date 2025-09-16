import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_facebook_sign_in/data/repositories/auth_repository_impl.dart';
import 'package:google_facebook_sign_in/presentation/providers/auth_provider.dart';
import 'package:google_facebook_sign_in/presentation/screens/auth_screen.dart';
import 'package:google_facebook_sign_in/presentation/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: 'AIzaSyC0WLIgrqQkXis5Iv2GXDwDPtP-_3T8TE4',
        appId: '1:674935823382:android:0b7f45c8e98c32e6fc6937',
        messagingSenderId: '263223493740',
        projectId: 'facebook--auth-80df2',
      ),
    );
  } catch (e) {
    print("${e} Error Occured!!! Not Connect firebase");
  }
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(AuthRepositoryImpl()),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clean Auth App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: RootPage(),
    );
  }
}

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context, listen: false);
    if (auth.user != null) {
      return HomeScreen();
    }
    return const AuthScreen();
  }
}
