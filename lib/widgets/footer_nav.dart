import 'package:flutter/material.dart';

class FooterNav extends StatelessWidget {
  const FooterNav({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> items = [
      {'icon': 'assets/icons/home.png', 'text': 'ទំព័រដើម', 'nav': '/home'},
      {
        'icon': 'assets/icons/service.png',
        'text': 'សេវាកម្ម',
        'nav': '/vendor',
      },
      {
        'icon': 'assets/icons/user.png',
        'text': 'គណនី',
        'nav': '/businessAccount',
      },
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children:
          items.map((item) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, item['nav']);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(item['icon'], height: 30, width: 30),
                  const SizedBox(height: 4),
                  Text(
                    item['text'],
                    style: const TextStyle(
                      fontWeight: FontWeight.w200,
                      fontSize: 14,
                      color: Color.fromRGBO(0, 0, 0, 1),
                    ),
                  ),
                  const SizedBox(height: 4),
                ],
              ),
            );
          }).toList(),
    );
  }
}
