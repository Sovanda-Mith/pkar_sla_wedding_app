import 'package:flutter/material.dart';
import './screens/home_screen.dart';
import './screens/services_screen.dart';
import './screens/account_screen.dart';
import './screens/first_launch_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wedding Services',
      initialRoute: '/launch',
      routes: {
        '/launch': (context) => FirstLaunchPage(),
        '/home': (context) => HomeScreen(),
        '/services': (context) => const ServicesScreen(),
        '/account': (context) => const AccountScreen(),
      },
      home: HomeScreen(),
    );
  }
}
