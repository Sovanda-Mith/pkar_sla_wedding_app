import 'package:flutter/material.dart';

class AccountInfoScreen extends StatelessWidget {
  const AccountInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('ព័ត៌មានគណនី'), // "Account Info"
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0.5,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // Profile Section
          Center(
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/default_avatar.png'),
                ),
                const SizedBox(height: 12),
                Text(
                  'ឈ្មោះអ្នកប្រើប្រាស់',
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'user@example.com',
                  style: textTheme.bodyMedium?.copyWith(color: Colors.grey),
                ),
              ],
            ),
          ),

          const SizedBox(height: 32),

          // Personal Info
          Text(
            'ព័ត៌មានផ្ទាល់ខ្លួន',
            style: textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          _infoTile(
            title: 'ឈ្មោះ',
            value: 'ឈ្មោះអ្នកប្រើប្រាស់',
            icon: Icons.person_outline,
          ),
          _infoTile(
            title: 'លេខទូរស័ព្ទ',
            value: '+855 12 345 678',
            icon: Icons.phone_outlined,
          ),

          const SizedBox(height: 32),

          // Account Info
          Text(
            'ព័ត៌មានគណនី',
            style: textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          _infoTile(
            title: 'លេខសម្គាល់អតិថិជន',
            value: 'CU001234',
            icon: Icons.badge_outlined,
          ),
          _infoTile(
            title: 'ប្រភេទគណនី',
            value: 'អ្នកប្រើប្រាស់',
            icon: Icons.account_circle_outlined,
          ),
          _infoTile(
            title: 'ថ្ងៃចុះឈ្មោះ',
            value: '01/01/2020',
            icon: Icons.calendar_today_outlined,
          ),
        ],
      ),
    );
  }

  Widget _infoTile({
    required String title,
    required String value,
    required IconData icon,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      elevation: 0.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        leading: Icon(icon, color: Colors.deepPurple),
        title: Text(title),
        subtitle: Text(value),
      ),
    );
  }
}
