import 'package:flutter/material.dart';
import 'package:pkar_sla_wedding_app/screens/account_info_screen.dart';
import 'package:pkar_sla_wedding_app/screens/log_in_screen.dart';

class AccountMenu extends StatelessWidget {
  const AccountMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Profile Card with soft background
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFFFF8E1),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.50),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Color(0xFFF8B500), width: 2),
                ),
                child: const CircleAvatar(
                  radius: 32,
                  backgroundImage: AssetImage('assets/default_avatar.png'),
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'ឈ្មោះអ្នកប្រើប្រាស់',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3A3A3A),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'user@example.com',
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 30),

        // Settings Section Title
        const Text(
          '⚙ ការកំណត់គណនី',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),

        // Menu Cards
        _buildMenuCard(
          context,
          icon: Icons.person_outline,
          text: 'ព័ត៌មានគណនី',
          onTap: () {
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
        const SizedBox(height: 12),
        _buildMenuCard(
          context,
          icon: Icons.lock_outline,
          text: 'ផ្លាស់ប្តូរពាក្យសម្ងាត់',
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => const ChangePasswordDialog(),
            );
          },
        ),
        const SizedBox(height: 12),
        _buildMenuCard(
          context,
          icon: Icons.logout,
          text: 'ចាកចេញ',
          iconColor: Colors.red,
          textColor: Colors.red,
          onTap: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder:
                  (context) => Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 24,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.logout, size: 48, color: Colors.red),
                          const SizedBox(height: 16),
                          const Text(
                            'ចាកចេញពីគណនី?',
                            style: TextStyle(
                              fontFamily: 'KhmerOS',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF3A3A3A),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'តើអ្នកប្រាកដថាចង់ចាកចេញពីគណនីនេះមែនទេ?\nអ្នកនឹងត្រូវចូលឡើងវិញ។',
                            style: TextStyle(
                              fontFamily: 'KhmerOS',
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: const Text(
                                    'បោះបង់',
                                    style: TextStyle(
                                      fontFamily: 'KhmerOS',
                                      fontSize: 14,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(); // Close dialog

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (context) => const LogInScreen(),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 12,
                                    ),
                                  ),
                                  child: const Text(
                                    'ចាកចេញ',
                                    style: TextStyle(
                                      fontFamily: 'KhmerOS',
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildMenuCard(
    BuildContext context, {
    required IconData icon,
    required String text,
    Color iconColor = const Color(0xFF3A693A),
    Color textColor = Colors.black87,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 2,
      shadowColor: Colors.black12,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: iconColor.withValues(alpha: 0.12),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: iconColor),
        ),
        title: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: textColor,
          ),
        ),
        trailing: Icon(Icons.arrow_forward_ios, size: 16, color: iconColor),
        onTap: onTap,
      ),
    );
  }
}

class ChangePasswordDialog extends StatefulWidget {
  const ChangePasswordDialog({super.key});

  @override
  State<ChangePasswordDialog> createState() => _ChangePasswordDialogState();
}

class _ChangePasswordDialogState extends State<ChangePasswordDialog> {
  final _formKey = GlobalKey<FormState>();
  final _oldPassword = TextEditingController();
  final _newPassword = TextEditingController();
  final _confirmPassword = TextEditingController();

  bool _isLoading = false;
  bool _obscure = true;

  void _toggleVisibility() {
    setState(() => _obscure = !_obscure);
  }

  void _handleSubmit() {
    if (_formKey.currentState?.validate() != true) return;

    if (_newPassword.text != _confirmPassword.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('ពាក្យសម្ងាត់ថ្មីមិនដូចគ្នាទេ')),
      );
      return;
    }

    setState(() => _isLoading = true);
    Future.delayed(const Duration(seconds: 2), () {
      setState(() => _isLoading = false);
      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('បានផ្លាស់ប្តូរពាក្យសម្ងាត់ដោយជោគជ័យ')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.lock_reset, size: 48, color: Color(0xFFF8B500)),
              const SizedBox(height: 12),
              const Text(
                'ផ្លាស់ប្តូរពាក្យសម្ងាត់',
                style: TextStyle(
                  fontFamily: 'KhmerOS',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3A3A3A),
                ),
              ),
              const SizedBox(height: 16),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    _buildField(
                      label: 'ពាក្យសម្ងាត់ចាស់',
                      controller: _oldPassword,
                      icon: Icons.lock_outline,
                    ),
                    const SizedBox(height: 12),
                    _buildField(
                      label: 'ពាក្យសម្ងាត់ថ្មី',
                      controller: _newPassword,
                      icon: Icons.lock,
                    ),
                    const SizedBox(height: 12),
                    _buildField(
                      label: 'បញ្ជាក់ពាក្យសម្ងាត់',
                      controller: _confirmPassword,
                      icon: Icons.lock,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              _isLoading
                  ? const CircularProgressIndicator()
                  : Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text(
                            'បោះបង់',
                            style: TextStyle(
                              fontFamily: 'KhmerOS',
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _handleSubmit,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF3A693A),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'រក្សាទុក',
                            style: TextStyle(fontFamily: 'KhmerOS'),
                          ),
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

  Widget _buildField({
    required String label,
    required TextEditingController controller,
    required IconData icon,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: _obscure,
      validator:
          (value) =>
              (value == null || value.isEmpty) ? 'សូមបញ្ចូល $label' : null,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: const Color(0xFF3A693A)),
        suffixIcon: IconButton(
          icon: Icon(
            _obscure ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey,
          ),
          onPressed: _toggleVisibility,
        ),
        labelStyle: const TextStyle(fontFamily: 'KhmerOS'),
        filled: true,
        fillColor: const Color(0xFFF9F9F9),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFDADADA)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF3A693A), width: 1.5),
        ),
      ),
    );
  }
}
