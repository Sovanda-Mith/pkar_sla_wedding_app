import 'package:flutter/material.dart';
import './screens/account_screen.dart';
import './screens/vendor_screen.dart';
import './screens/home_screen.dart';
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
      theme: ThemeData(fontFamily: 'Noto Sans Khmer'),
      initialRoute: '/launch',
      routes: {
        '/launch': (context) => FirstLaunchPage(),
        '/home': (context) => HomeScreen(),
        '/account':
            (context) =>
                const AccountScreen(isOwner: true, userType: UserType.normal),
        '/services': (context) => const ServicesScreen(),
      },
      home: HomeScreen(),
    );
  }
}
