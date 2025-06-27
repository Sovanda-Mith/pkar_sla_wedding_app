import 'package:flutter/material.dart';
import 'first_launch_screen.dart';
import 'home_screen.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(top: 70),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FirstLaunchPage(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/back_arrow.png',
                        width: 24,
                        height: 24,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Text(
                          'ផ្កាស្លា',
                          style: TextStyle(
                            foreground:
                                Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 2
                                  ..color = Colors.black,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Noto Sans Khmer',
                          ),
                        ),
                        Text(
                          'ផ្កាស្លា',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF3A693A),
                            fontFamily: 'Noto Sans Khmer',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Stack(
                      children: [
                        Text(
                          'ចូលគណនី',
                          style: TextStyle(
                            foreground:
                                Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 1
                                  ..color = Colors.black,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Noto Sans Khmer',
                          ),
                        ),
                        Text(
                          'ចូលគណនី',
                          style: TextStyle(
                            fontSize: 28,
                            color: Color(0xFF9BFA9B),
                            fontFamily: 'Noto Sans Khmer',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'អុីម៉ែល',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[900],
                      fontFamily: 'Noto Sans Khmer',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: TextField(
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'លេខកូដ',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[900],
                      fontFamily: 'Noto Sans Khmer',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: TextField(
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[900],
                  padding: const EdgeInsets.symmetric(
                    horizontal: 60,
                    vertical: 10,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  ); // Handle button press
                },
                child: Text(
                  'ចូលគណនី',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Noto Sans Khmer',
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Image.asset(
                'assets/couple.png', // Replace with your asset path
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
