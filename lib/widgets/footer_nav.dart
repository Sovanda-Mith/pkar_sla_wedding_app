import 'package:flutter/material.dart';

class FooterNav extends StatelessWidget {
  final String currentRoute;

  const FooterNav({super.key, required this.currentRoute});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> items = [
      {'icon': 'assets/icons/home.png', 'text': 'ទំព័រដើម', 'nav': '/home'},
      {
        'icon': 'assets/icons/service.png',
        'text': 'សេវាកម្ម',
        'nav': '/vendor',
      },
      {'icon': 'assets/icons/user.png', 'text': 'គណនី', 'nav': '/account'},
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:
            items.map((item) {
              final bool isActive = currentRoute == item['nav'];

              return GestureDetector(
                onTap: () {
                  if (!isActive) {
                    Navigator.pushReplacementNamed(context, item['nav']);
                  }
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      item['icon'],
                      height: 30,
                      width: 30,
                      color: isActive ? Colors.deepPurple : Colors.black54,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item['text'],
                      style: TextStyle(
                        fontWeight:
                            isActive ? FontWeight.bold : FontWeight.w200,
                        fontSize: 14,
                        color: isActive ? Colors.deepPurple : Colors.black87,
                      ),
                    ),
                    if (isActive)
                      Container(
                        margin: const EdgeInsets.only(top: 4),
                        height: 3,
                        width: 20,
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      )
                    else
                      const SizedBox(height: 7), // balance height if not active
                  ],
                ),
              );
            }).toList(),
      ),
    );
  }
}
