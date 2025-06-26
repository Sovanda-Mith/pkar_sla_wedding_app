import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AccountInfoScreen extends StatefulWidget {
  const AccountInfoScreen({super.key});

  @override
  State<AccountInfoScreen> createState() => _AccountInfoScreenState();
}

class _AccountInfoScreenState extends State<AccountInfoScreen> {
  String userName = 'ឈ្មោះអ្នកប្រើប្រាស់';
  String userEmail = 'user@example.com';
  String userPhone = '+855 12 345 678';

  ImageProvider avatarImage = const AssetImage('assets/default_avatar.png');
  File? _avatarFile;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickAvatar() async {
    final XFile? pickedFile = await showModalBottomSheet<XFile?>(
      context: context,
      builder:
          (context) => SafeArea(
            child: Wrap(
              children: [
                ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text('រើសរូបពីផ្សារូបភាព'),
                  onTap: () async {
                    Navigator.pop(
                      context,
                      await _picker.pickImage(
                        source: ImageSource.gallery,
                        maxWidth: 600,
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.camera_alt),
                  title: const Text('ថតរូប'),
                  onTap: () async {
                    Navigator.pop(
                      context,
                      await _picker.pickImage(
                        source: ImageSource.camera,
                        maxWidth: 600,
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.close),
                  title: const Text('បោះបង់'),
                  onTap: () => Navigator.pop(context, null),
                ),
              ],
            ),
          ),
    );

    if (pickedFile != null) {
      setState(() {
        _avatarFile = File(pickedFile.path);
        avatarImage = FileImage(_avatarFile!);
      });
    }
  }

  Future<void> _showEditDialog({
    required String title,
    required String currentValue,
    required Function(String) onSave,
  }) async {
    final TextEditingController controller = TextEditingController(
      text: currentValue,
    );

    await showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(title, style: const TextStyle(fontFamily: 'KhmerOS')),
            content: TextField(
              controller: controller,
              autofocus: true,
              decoration: InputDecoration(
                labelText: title,
                border: const OutlineInputBorder(),
              ),
              keyboardType:
                  title == 'លេខទូរស័ព្ទ'
                      ? TextInputType.phone
                      : TextInputType.text,
            ),
            actions: [
              TextButton(
                child: const Text(
                  'បោះបង់',
                  style: TextStyle(fontFamily: 'KhmerOS'),
                ),
                onPressed: () => Navigator.pop(context),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                ),
                child: const Text(
                  'រក្សាទុក',
                  style: TextStyle(fontFamily: 'KhmerOS'),
                ),
                onPressed: () {
                  if (controller.text.trim().isEmpty) return;
                  onSave(controller.text.trim());
                  Navigator.pop(context);
                },
              ),
            ],
          ),
    );
  }

  Future<bool?> _showPhoneEditWarning() {
    return showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text(
              'ការព្រមាន',
              style: TextStyle(fontFamily: 'KhmerOS'),
            ),
            content: const Text(
              'ការផ្លាស់ប្តូរលេខទូរស័ព្ទគឺមានសារៈសំខាន់ និងអាចមានគ្រោះថ្នាក់។ តើអ្នកពិតជាចង់បន្ត?',
              style: TextStyle(fontFamily: 'KhmerOS'),
            ),
            actions: [
              TextButton(
                child: const Text(
                  'បោះបង់',
                  style: TextStyle(fontFamily: 'KhmerOS'),
                ),
                onPressed: () => Navigator.of(context).pop(false),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.deepPurple,
                  side: const BorderSide(color: Colors.deepPurple),
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                ),
                child: const Text(
                  'បន្ត',
                  style: TextStyle(fontFamily: 'KhmerOS'),
                ),
                onPressed: () => Navigator.of(context).pop(true),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        title: const Text(
          'ព័ត៌មានគណនី',
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black87),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        foregroundColor: Colors.black,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // Profile section
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Column(
              children: [
                GestureDetector(
                  onTap: _pickAvatar,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(radius: 50, backgroundImage: avatarImage),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey[300]!),
                        ),
                        padding: const EdgeInsets.all(4),
                        child: const Icon(
                          Icons.edit,
                          size: 18,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                GestureDetector(
                  onTap:
                      () => _showEditDialog(
                        title: 'ឈ្មោះ',
                        currentValue: userName,
                        onSave: (val) => setState(() => userName = val),
                      ),
                  child: Text(
                    userName,
                    style: const TextStyle(
                      fontFamily: 'KhmerOS',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  userEmail,
                  style: const TextStyle(
                    fontFamily: 'KhmerOS',
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          _sectionTitle('ព័ត៌មានផ្ទាល់ខ្លួន'),
          _infoCard([
            ListTile(
              leading: _circleIcon(Icons.person_outline),
              title: const Text(
                'ឈ្មោះ',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              subtitle: Text(
                userName,
                style: const TextStyle(fontSize: 14, color: Colors.black54),
              ),
              trailing: const Icon(Icons.edit, color: Colors.deepPurple),
              onTap:
                  () => _showEditDialog(
                    title: 'ឈ្មោះ',
                    currentValue: userName,
                    onSave: (val) => setState(() => userName = val),
                  ),
            ),
            ListTile(
              leading: _circleIcon(Icons.phone_android_outlined),
              title: const Text(
                'លេខទូរស័ព្ទ',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              subtitle: Text(
                userPhone,
                style: const TextStyle(fontSize: 14, color: Colors.black54),
              ),
              trailing: const Icon(Icons.edit, color: Colors.deepPurple),
              onTap: () async {
                final proceed = await _showPhoneEditWarning();
                if (proceed == true) {
                  _showEditDialog(
                    title: 'លេខទូរស័ព្ទ',
                    currentValue: userPhone,
                    onSave: (val) => setState(() => userPhone = val),
                  );
                }
              },
            ),
          ]),

          const SizedBox(height: 24),

          _sectionTitle('ព័ត៌មានគណនី'),
          _infoCard([
            _infoTile('លេខសម្គាល់អតិថិជន', 'CU001234', Icons.badge_outlined),
            _infoTile(
              'ប្រភេទគណនី',
              'អ្នកប្រើប្រាស់',
              Icons.account_circle_outlined,
            ),
            _infoTile(
              'ថ្ងៃចុះឈ្មោះ',
              '01/01/2020',
              Icons.calendar_today_outlined,
            ),
          ]),
        ],
      ),
    );
  }

  Widget _sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        text,
        style: const TextStyle(
          fontFamily: 'KhmerOS',
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Color(0xFF333333),
        ),
      ),
    );
  }

  Widget _circleIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.deepPurple.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.deepPurple),
    );
  }

  Widget _infoCard(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 5, offset: Offset(0, 2)),
        ],
      ),
      child: Column(children: children),
    );
  }

  Widget _infoTile(String title, String value, IconData icon) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      leading: _circleIcon(icon),
      title: Text(
        title,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        value,
        style: const TextStyle(fontSize: 14, color: Colors.black54),
      ),
    );
  }
}
