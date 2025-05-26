import 'package:flutter/material.dart';
import 'first_launch_screen.dart';
import 'user_register_screen.dart';

class UserChoiceScreen extends StatelessWidget {
  const UserChoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button with PNG icon
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FirstLaunchPage(),
                    ),
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/back_arrow.png', width: 24, height: 24),
                    const SizedBox(width: 8),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Title
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
                    const SizedBox(height: 40),
                    Stack(
                      children: [
                        Text(
                          'អ្នកចុះឈ្មោះធ្វើជា',
                          style: TextStyle(
                            foreground:
                                Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 2
                                  ..color = Colors.black,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Noto Sans Khmer',
                          ),
                        ),
                        Text(
                          'អ្នកចុះឈ្មោះធ្វើជា',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF9BFA9B),
                            fontFamily: 'Noto Sans Khmer',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 60),

              // Two options
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UserRegister(),
                        ),
                      );
                    },
                    child: OptionCard(
                      imagePath: 'assets/profile.png',
                      label: 'អ្នកប្រើប្រាស់ធម្មតា',
                    ),
                  ),
                  SizedBox(width: 16),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FirstLaunchPage(),
                        ),
                      );
                    },
                    child: OptionCard(
                      imagePath: 'assets/service.png',
                      label: 'អ្នកផ្ដល់សេវាកម្ម',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OptionCard extends StatelessWidget {
  final String imagePath;
  final String label;

  const OptionCard({super.key, required this.imagePath, required this.label});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: 150,
        width: 150,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Color(0xFFF1F1F1),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: [
            Expanded(child: Image.asset(imagePath)),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3A693A),
                fontFamily: 'Khmer OS Battambang',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
