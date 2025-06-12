import 'package:flutter/material.dart';
import 'package:pkar_sla_wedding_app/widgets/header_nav.dart';
import 'package:pkar_sla_wedding_app/widgets/footer_nav.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const HeaderNav(),
          const SizedBox(height: 20),
          Image.asset('assets/decorb.png', height: 240, fit: BoxFit.cover),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/hall.png', width: 60),
              SizedBox(width: 4),
              Image.asset('assets/decor.png', width: 60),
              SizedBox(width: 4),
              Image.asset('assets/makeup.png', width: 60),
              SizedBox(width: 4),
              Icon(Icons.arrow_forward_ios, size: 14),
            ],
          ),
          SizedBox(height: 20),
          Text(
            'ឧត្តមមង្គល សំអាងការ',
            style: TextStyle(
              fontSize: 24,
              color: Color(0xFF3A693A),
              fontFamily: 'Noto Sans Khmer',
            ),
          ),
          SizedBox(height: 20),
          infoRow('ទីតាំង:', ' រោងការ, ម្ហូបអាហារ, សម្លៀកបំពាក់'),
          infoRow('ថ្លៃ:', '\$\$ - \$\$\$\$'),
          infoRow('ទីតាំង:', 'ភ្នំពេញ់'),
          infoRow('លេខទូរស័ព្ទ:', '012 345 678'),
          SizedBox(height: 180),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF2E5F31),
              minimumSize: Size(360, 56),
            ),
            onPressed: () {},
            child: Text(
              'ទំនាក់ទំនង',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontFamily: 'Noto Sans Khmer',
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
            color: Color(0xFF3A693A),
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
              color: Color(0xFF3A693A),
              fontFamily: 'Noto Sans Khmer',
            ),
          ),
        ),
      ],
    ),
  );
}
