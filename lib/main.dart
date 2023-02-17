import 'package:beryl/screens/home.dart';
import 'package:beryl/screens/login.dart';
import 'package:beryl/screens/splashscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beryl Consulting',
      initialRoute: '/',
      routes: {
        '': (context) => const HomeScreen(),
        'login': (context) => const LoginScreen(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
