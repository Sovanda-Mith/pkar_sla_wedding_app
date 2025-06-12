import 'package:flutter/material.dart';
import 'package:pkar_sla_wedding_app/widgets/header_nav.dart';
import 'package:pkar_sla_wedding_app/widgets/footer_nav.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Map<String, String>> categories = [
    {
      'title': 'រោងការ',
      'iconPath': 'assets/icons/hall.png',
      'imagePath': 'assets/hall.png',
    },
    {
      'title': 'ដេគ័រ',
      'iconPath': 'assets/icons/decor.png',
      'imagePath': 'assets/decor.png',
    },
    {
      'title': 'សម្លៀកបំពាក់',
      'iconPath': 'assets/icons/clothes.png',
      'imagePath': 'assets/clothes.png',
    },
    {
      'title': 'ជាងផាត់មុខ',
      'iconPath': 'assets/icons/makeup.png',
      'imagePath': 'assets/makeup.png',
    },
    {
      'title': 'ជាងថតរូប',
      'iconPath': 'assets/icons/photographer.png',
      'imagePath': 'assets/photographer.png',
    },
    {
      'title': 'ឥន្ត្រី',
      'iconPath': 'assets/icons/music.png',
      'imagePath': 'assets/music.png',
    },
    {
      'title': 'ទីកន្លែង',
      'iconPath': 'assets/icons/venue.png',
      'imagePath': 'assets/venue.png',
    },
    {
      'title': 'ម្ហូបអាហារ',
      'iconPath': 'assets/icons/food.png',
      'imagePath': 'assets/food.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const HeaderNav(),
          SizedBox(height: 20),
          Stack(
            children: [
              Text(
                'រៀបចំអាពាហ៍ពិពាហ៍ដ៏ល្អឥតខ្ចោះរបស់អ្នកជាមួយ',
                style: TextStyle(
                  foreground:
                      Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 2
                        ..color = Color(0xFF135313),
                  fontSize: 23,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'រៀបចំអាពាហ៍ពិពាហ៍ដ៏ល្អឥតខ្ចោះរបស់អ្នកជាមួយ',
                style: TextStyle(
                  fontSize: 23,
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Stack(
            children: [
              Text(
                'ផ្កាស្លា',
                style: TextStyle(
                  foreground:
                      Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 2
                        ..color = Color(0xFF135413),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'ផ្កាស្លា',
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xFFAFDBAF),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(10),
            crossAxisSpacing: 6,
            mainAxisSpacing: 40,
            children:
                categories.map((category) {
                  return CategoryCard(
                    iconPath: category['iconPath']!,
                    imagePath: category['imagePath']!,
                    title: category['title']!,
                  );
                }).toList(),
          ),
          Spacer(),
          const FooterNav(),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String iconPath;
  final String imagePath;
  final String title;

  const CategoryCard({
    super.key,
    required this.iconPath,
    required this.imagePath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(iconPath, width: 15, height: 15),
        SizedBox(height: 8),
        Image.asset(imagePath, width: 80, height: 80),
        SizedBox(height: 5),
        Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
