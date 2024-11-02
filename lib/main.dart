import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/auth_provider.dart';
import 'providers/authentication.dart';
import 'screens/register_screen.dart';
import 'screens/home_screen.dart';
import 'screens/atbash.dart';
import 'screens/caesar.dart';
import 'screens/vigenere.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => myAuthProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login/Register App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => AuthenticationPage(),
        '/register': (context) => RegisterScreen(),
        '/home': (context) => HomeScreen(),
        '/atbash': (context) => AtbashPage(),
        '/caesar': (context) => CaesarPage(),
        '/vigenere': (context) => VigenerePage(),



      },

    );

  }

}
