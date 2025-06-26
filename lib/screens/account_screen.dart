import 'package:flutter/material.dart';
import 'package:pkar_sla_wedding_app/screens/account_info_screen.dart';
import 'package:pkar_sla_wedding_app/widgets/custom_button.dart';
import 'package:pkar_sla_wedding_app/widgets/footer_nav.dart';
import 'package:pkar_sla_wedding_app/widgets/title_header.dart';

enum UserType { normal, business }

class AccountScreen extends StatefulWidget {
  final UserType userType;
  final bool isOwner;

  const AccountScreen({
    super.key,
    required this.userType,
    required this.isOwner,
  });

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    Widget content;

    if (widget.userType == UserType.normal && widget.isOwner) {
      content = _normalOwnerView();
    } else if (widget.userType == UserType.normal && !widget.isOwner) {
      content = _normalGuestView();
    } else if (widget.userType == UserType.business && widget.isOwner) {
      content = _businessOwnerView();
    } else {
      content = _businessGuestView();
    }

    return Scaffold(
      body: Column(
        children: [
          TitleHeader(title: 'គណនី'),
          Expanded(child: content),
          FooterNav(),
        ],
      ),
    );
  }

  Widget _normalOwnerView() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Profile Section
        Row(
          children: [
            const CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(
                'assets/images/default_avatar.png',
              ), // Replace with your asset or network image
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AccountInfoScreen(),
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

  Widget _normalGuestView() {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(
                'assets/images/default_avatar.png',
              ), // Replace with your asset or network image
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
                  'ចុះឈ្មោះនៅថ្ងៃ', // Replace with user email/phone
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 50),
        CustomButton(text: 'ផ្ញើសារ'),
      ],
    );
  }

  Widget _businessOwnerView() {
    return ListView();
  }

  Widget _businessGuestView() {
    return ListView();
  }
}
