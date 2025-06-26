import 'package:flutter/material.dart';
import 'package:pkar_sla_wedding_app/screens/home_screen.dart';
import 'package:pkar_sla_wedding_app/screens/photo_gallery.dart';
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
          FooterNav(currentRoute: '/account'),
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Image.asset(
            'assets/decorb.png',
            height: 240,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/hall.png', width: 90),
              SizedBox(width: 4),
              Image.asset('assets/decor.png', width: 90),
              SizedBox(width: 4),
              Image.asset('assets/makeup.png', width: 90),
              SizedBox(width: 4),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PhotoGallery(),
                    ),
                  );
                },
                child: SizedBox(
                  width: 80,
                  height: 80,
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/green_right_arrow.png',
                      width: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Text(
          'ឧត្តមមង្គល សំអាងការ',
          style: TextStyle(
            fontSize: 32,
            color: Color(0xFF000000),
            fontFamily: 'Noto Sans Khmer',
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 20),
        infoRow('ប្រភេទ:', ' រោងការ, ម្ហូបអាហារ, សម្លៀកបំពាក់'),
        infoRow('តម្លៃ:', '\$\$ - \$\$\$\$'),
        infoRow('ទីតាំង:', 'ភ្នំពេញ'),
        infoRow('លេខទូរស័ព្ទ:', '012 345 678'),
        Spacer(),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF3A693A),
            minimumSize: Size(360, 56),
          ),
          onPressed: () {},
          child: Text(
            'រក្សាទុក',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontFamily: 'Noto Sans Khmer',
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        SizedBox(height: 10),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFAFDBAF),
            minimumSize: Size(360, 56),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => AccountScreen(
                      isOwner: false,
                      userType: UserType.business,
                    ),
              ),
            );
          },
          child: Text(
            'មើលជាអ្នកប្រើផ្សេង',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontFamily: 'Noto Sans Khmer',
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        SizedBox(height: 10),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFAFDBAF),
            minimumSize: Size(360, 56),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) =>
                        AccountScreen(userType: UserType.normal, isOwner: true),
              ),
            );
          },
          child: Text(
            'កែប្រែគណនី',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontFamily: 'Noto Sans Khmer',
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        Spacer(),
      ],
    );
  }

  Widget _businessGuestView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Image.asset(
            'assets/decorb.png',
            height: 240,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/hall.png', width: 90),
              SizedBox(width: 4),
              Image.asset('assets/decor.png', width: 90),
              SizedBox(width: 4),
              Image.asset('assets/makeup.png', width: 90),
              SizedBox(width: 4),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PhotoGallery(),
                    ),
                  );
                },
                child: SizedBox(
                  width: 80,
                  height: 80,
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/green_right_arrow.png',
                      width: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Text(
          'ឧត្តមមង្គល សំអាងការ',
          style: TextStyle(
            fontSize: 32,
            color: Color(0xFF000000),
            fontFamily: 'Noto Sans Khmer',
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 20),
        infoRow('ប្រភេទ:', ' រោងការ, ម្ហូបអាហារ, សម្លៀកបំពាក់'),
        infoRow('តម្លៃ:', '\$\$ - \$\$\$\$'),
        infoRow('ទីតាំង:', 'ភ្នំពេញ'),
        infoRow('លេខទូរស័ព្ទ:', '012 345 678'),
        Spacer(),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFAFDBAF),
            minimumSize: Size(360, 56),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
          child: Text(
            'ទំនាក់ទំនង',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontFamily: 'Noto Sans Khmer',
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        Spacer(),
      ],
    );
  }
}

Widget infoRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 40),
    child: Row(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 20,
            color: Color(0xFF000000),
            fontFamily: 'Noto Sans Khmer',
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontSize: 20,
              color: Color(0xFF000000),
              fontFamily: 'Noto Sans Khmer',
            ),
          ),
        ),
      ],
    ),
  );
}
