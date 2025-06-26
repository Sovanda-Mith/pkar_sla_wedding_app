import 'package:flutter/material.dart';
import 'package:pkar_sla_wedding_app/widgets/long_press_icon_label.dart';

class AccountHeader extends StatelessWidget {
  const AccountHeader({super.key});

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
              Navigator.pop(context);
            },
            child: Image.asset(
              'assets/back_arrow_long.png',
              width: 25,
              height: 25,
            ),
          ),
          Text(
            'គណនី',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
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
