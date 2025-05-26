import 'package:flutter/material.dart';

class HeaderNav extends StatelessWidget {
  const HeaderNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF3A693A),
      height: 100,
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: 50, right: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'ផ្កាស្លា',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Row(
            children: [
              GestureDetector(
                onLongPressDown: (details) {},
                onTap: () {},

                child: Image.asset(
                  'assets/icons/chat.png',
                  height: 30,
                  width: 30,
                ),
              ),
              SizedBox(width: 20),
              GestureDetector(
                onLongPressDown: (details) {},
                onTap: () {},
                child: Image.asset(
                  'assets/icons/notification.png',
                  height: 30,
                  width: 30,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
