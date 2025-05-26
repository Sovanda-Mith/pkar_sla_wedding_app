import 'package:flutter/material.dart';
import 'package:pkar_sla_wedding_app/widgets/long_press_icon_label.dart';

class HeaderNav extends StatelessWidget {
  const HeaderNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF3A693A),
      height: 100,
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: 50, right: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/home');
            },
            child: Text(
              'ផ្កាស្លា',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Row(
            children: [
              LongPressIconLabel(
                imagePath: 'assets/icons/chat.png',
                label: 'ប្រអប់សារ',
              ),
              SizedBox(width: 20),
              LongPressIconLabel(
                imagePath: 'assets/icons/notification.png',
                label: 'ការជូនដំណឹង',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
