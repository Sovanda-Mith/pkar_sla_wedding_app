import 'package:flutter/material.dart';

class AccountInfoScreen extends StatelessWidget {
  const AccountInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ព័ត៌មានគណនី'), // "Account Info"
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(
                    'assets/images/default_avatar.png',
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'ឈ្មោះអ្នកប្រើប្រាស់', // Replace dynamically
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                const Text(
                  'user@example.com',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          const Text(
            'ព័ត៌មានផ្ទាល់ខ្លួន', // Personal Info
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          _infoTile(title: 'ឈ្មោះ', value: 'ឈ្មោះអ្នកប្រើប្រាស់'), // Name
          _infoTile(title: 'លេខទូរស័ព្ទ', value: '+855 12 345 678'), // Phone

          const SizedBox(height: 24),
          const Text(
            'ព័ត៌មានគណនី', // Account Info
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          _infoTile(
            title: 'លេខសម្គាល់អតិថិជន',
            value: 'CU001234',
          ), // Customer ID
          _infoTile(
            title: 'ប្រភេទគណនី',
            value: 'អ្នកប្រើប្រាស់',
          ), // Account Type: Individual
          _infoTile(
            title: 'ថ្ងៃចុះឈ្មោះ',
            value: '01/01/2020',
          ), // Registration Date
        ],
      ),
    );
  }

  Widget _infoTile({required String title, required String value}) {
    return Column(
      children: [
        ListTile(
          title: Text(title),
          subtitle: Text(value),
          leading: const Icon(Icons.info_outline),
        ),
        const Divider(height: 1),
      ],
    );
  }
}
