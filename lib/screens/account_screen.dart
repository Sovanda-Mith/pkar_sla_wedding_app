import 'package:flutter/material.dart';
import 'package:pkar_sla_wedding_app/screens/account_info_screen.dart';
import 'package:pkar_sla_wedding_app/widgets/account_menu.dart';
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
    return AccountMenu();
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
    return AccountMenu();
  }

  Widget _businessGuestView() {
    return ListView();
  }
}
