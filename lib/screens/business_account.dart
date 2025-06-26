import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pkar_sla_wedding_app/screens/home_screen.dart';
import 'package:pkar_sla_wedding_app/screens/photo_gallery.dart';
import 'package:pkar_sla_wedding_app/widgets/account_header.dart';
import 'package:pkar_sla_wedding_app/widgets/header_nav.dart';
import 'package:pkar_sla_wedding_app/widgets/footer_nav.dart';
import 'package:image_picker/image_picker.dart';

class BusinessAccountScreen extends StatelessWidget {
  const BusinessAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isOwner = checkIfUserIsOwner();
    return isOwner
        ? BusinessAccountScreenOwner()
        : BusinessAccountScreenViewer();
  }
}

bool checkIfUserIsOwner() {
  return true;
}

class BusinessAccountScreenViewer extends StatelessWidget {
  const BusinessAccountScreenViewer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const AccountHeader(),
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
          const FooterNav(),
        ],
      ),
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

// Owner

class BusinessAccountScreenOwner extends StatelessWidget {
  const BusinessAccountScreenOwner({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const AccountHeader(),
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
                  builder: (context) => BusinessAccountScreenViewer(),
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
                  builder: (context) => BusinessAccountScreenViewer(),
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
          const FooterNav(),
        ],
      ),
    );
  }
}
