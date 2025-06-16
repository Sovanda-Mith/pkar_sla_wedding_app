import 'package:flutter/material.dart';
import 'package:pkar_sla_wedding_app/widgets/long_press_icon_label.dart';

class TitleHeader extends StatelessWidget {
  final String title;

  const TitleHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF3A693A),
      height: 100,
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              'assets/icons/arrow_back.png',
              height: 26,
              width: 26,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/home');
            },
            child: Text(
              title,
              style: TextStyle(
                fontSize: 24,
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
