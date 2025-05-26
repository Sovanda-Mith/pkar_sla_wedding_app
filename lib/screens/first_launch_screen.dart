import 'package:flutter/material.dart';
import 'user_choice_screen.dart';
import 'log_in_screen.dart';

void main() {
  runApp(const WeddingApp());
}

class WeddingApp extends StatelessWidget {
  const WeddingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const FirstLaunchPage(),
    );
  }
}

class FirstLaunchPage extends StatelessWidget {
  const FirstLaunchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 16),
          decoration: BoxDecoration(
            color: const Color(0xFF9BFA9B),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/bride_groom.png',
                height: 280,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 280,
                    color: Colors.grey[200],
                    child: const Icon(Icons.image_not_supported, size: 50),
                  );
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'ផ្កាស្លា',
                style: TextStyle(
                  fontSize: 36,
                  color: Colors.white,
                  fontFamily: 'Khmer OS Battambang',
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  const Text(
                    'ចង់រៀបចំមង្គលការ​?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                      fontFamily: 'Khmer OS Battambang',
                    ),
                  ),
                  const Text(
                    'យើងអាចជួយអ្នកបាន',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                      fontFamily: 'Khmer OS Battambang',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LogInScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3E6839),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 80,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  shadowColor: const Color.fromARGB(252, 253, 252, 252),
                  elevation: 6,
                ),
                child: const Text(
                  'ចូលកម្មវិធី',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Khmer OS Battambang',
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UserChoiceScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 80,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  shadowColor: Colors.grey,
                  elevation: 4,
                ),
                child: const Text(
                  'ចុះឈ្មោះ',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Khmer OS Battambang',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
