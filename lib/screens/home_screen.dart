import 'package:flutter/material.dart';
import 'package:pkar_sla_wedding_app/widgets/header_nav.dart';
import 'package:pkar_sla_wedding_app/widgets/footer_nav.dart';
import 'package:pkar_sla_wedding_app/screens/clothes_screen.dart';
import 'package:pkar_sla_wedding_app/screens/decor_screen.dart';
import 'package:pkar_sla_wedding_app/screens/food_screen.dart';
import 'package:pkar_sla_wedding_app/screens/makeup_screen.dart';
import 'package:pkar_sla_wedding_app/screens/photography_screen.dart';
import 'package:pkar_sla_wedding_app/screens/music_screen.dart';
import 'package:pkar_sla_wedding_app/screens/venue_screen.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Map<String, String>> categories = [
    {
      'title': 'រោងការ',
      'iconPath': 'assets/icons/hall.png',
      'imagePath': 'assets/hall.png',
      'route': 'hall',
    },
    {
      'title': 'ដេគ័រ',
      'iconPath': 'assets/icons/decor.png',
      'imagePath': 'assets/decor.png',
      'route': 'decor',
    },
    {
      'title': 'សម្លៀកបំពាក់',
      'iconPath': 'assets/icons/clothes.png',
      'imagePath': 'assets/clothes.png',
      'route': 'clothes',
    },
    {
      'title': 'ជាងផាត់មុខ',
      'iconPath': 'assets/icons/makeup.png',
      'imagePath': 'assets/makeup.png',
      'route': 'makeup',
    },
    {
      'title': 'ជាងថតរូប',
      'iconPath': 'assets/icons/photographer.png',
      'imagePath': 'assets/photographer.png',
      'route': 'photographer',
    },
    {
      'title': 'ឥន្ត្រី',
      'iconPath': 'assets/icons/music.png',
      'imagePath': 'assets/music.png',
      'route': 'music',
    },
    {
      'title': 'ទីកន្លែង',
      'iconPath': 'assets/icons/venue.png',
      'imagePath': 'assets/venue.png',
      'route': 'venue',
    },
    {
      'title': 'ម្ហូបអាហារ',
      'iconPath': 'assets/icons/food.png',
      'imagePath': 'assets/food.png',
      'route': 'food',
    },
  ];

  void _navigateToService(BuildContext context, String route, String title) {
    switch (route) {
      case 'clothes':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ClothesScreen(clothesType: title),
          ),
        );
        break;
      case 'decor':
        Navigator.push(context, MaterialPageRoute(builder: (context) => DecorScreen(decorType: title, serviceType: '')));
        break;
      case 'makeup':
        Navigator.push(context, MaterialPageRoute(builder: (context) => MakeupScreen(makeupType: title, serviceType: '',)));
        break;
      case 'photographer':
        Navigator.push(context, MaterialPageRoute(builder: (context) => PhotographyScreen(photographyType: title, serviceType: '')));
        break;
      case 'music':
        Navigator.push(context, MaterialPageRoute(builder: (context) => MusicScreen(musicType: title, serviceType: '' )));
        break;
      case 'venue':
        Navigator.push(context, MaterialPageRoute(builder: (context) => VenueScreen(venueType: title, serviceType: '')));
        break;
      case 'food':
        Navigator.push(context, MaterialPageRoute(builder: (context) => FoodScreen(foodType: title, serviceType: '')));
        break;
      default:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$title screen not implemented yet')),
        );
    }
  }

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
                    onTap: () => _navigateToService(context, category['route']!, category['title']!),
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
  final VoidCallback onTap;

  const CategoryCard({
    super.key,
    required this.iconPath,
    required this.imagePath,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
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
      ),
    );
  }
}