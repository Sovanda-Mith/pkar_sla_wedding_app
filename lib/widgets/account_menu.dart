import 'package:flutter/material.dart';
import 'package:pkar_sla_wedding_app/screens/account_info_screen.dart';

class AccountMenu extends StatelessWidget {
  const AccountMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Profile Section
        Row(
          children: [
            const CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/default_avatar.png'),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'ឈ្មោះអ្នកប្រើប្រាស់', // Replace dynamically
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  'user@example.com', // Replace with user email/phone
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),

        const SizedBox(height: 24),

        const Text(
          'ការកំណត់គណនី', // "Account Settings"
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),

        Card(
          elevation: 2,
          shadowColor: Colors.black12,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.person_outline),
                title: const Text('ព័ត៌មានគណនី'), // Account Info
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  // Navigate to account info
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => const AccountInfoScreen(),
                      transitionsBuilder:
                          (_, animation, __, child) =>
                              FadeTransition(opacity: animation, child: child),
                    ),
                  );
                },
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.lock_outline),
                title: const Text('ផ្លាស់ប្តូរពាក្យសម្ងាត់'), // Change Password
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  // Navigate to change password
                },
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.red),
                title: const Text(
                  'ចាកចេញ',
                  style: TextStyle(color: Colors.red),
                ), // Logout
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.red,
                ),
                onTap: () {
                  // Handle logout
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
