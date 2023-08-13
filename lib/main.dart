import 'package:adv_basics/SignupPage.dart';
import 'package:adv_basics/Start_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Alignment startAlign = Alignment.topLeft;
Alignment endAlign = Alignment.bottomRight;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'advance',
      home: Scaffold(
        body: Container(
          
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: const [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: startAlign,
              end: endAlign,
            ),
          ),
          child: SignupPage(),
        ),
      ),
    );
  }
}
