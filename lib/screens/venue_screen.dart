import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Photography Service',
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//         fontFamily: 'NotoSansKhmer-Regular',
//       ),
//       home: PhotographyServicePage(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

class PhotographyServicePage extends StatelessWidget {
  const PhotographyServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Color(0xFF4A7C59),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'ទីកន្លែង',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.w800,
            fontFamily: 'NotoSansKhmer-Bold',
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.notifications_outlined, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Dropdown section
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.keyboard_arrow_down, size: 24),
                SizedBox(width: 8),
                Text(
                  'ភ្នំពេញ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),

          // Services list
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                ServiceCard(
                  title: 'ម៉ាក់ពិសី សម្អាងការ',
                  location: 'ទីតាំង: ភ្នំពេញ',
                  price: 'តម្លៃ: 450\$ - 2000\$',
                  imageUrl: './assets/venue.png', // Placeholder for image
                ),
                SizedBox(height: 16),
                ServiceCard(
                  title: 'សម្អាងការ ប្រពៃ',
                  location: 'ទីតាំង: ភ្នំពេញ',
                  price: 'តម្លៃ: 500\$ - 1500\$',
                  imageUrl: './assets/venue.png', // Placeholder for image
                ),
                SizedBox(height: 16),
                ServiceCard(
                  title: 'សម្អាងការ អប្បរា',
                  location: 'ទីតាំង: ភ្នំពេញ',
                  price: 'តំលៃ: 450\$ - 1500\$',
                  imageUrl: './assets/venue.png', // Placeholder for image
                ),
                SizedBox(height: 16),
                ServiceCard(
                  title: 'សម្អាងការ មយូរា',
                  location: 'ទីតាំង: ភ្នំពេញ',
                  price: 'តំលៃ: 450\$ - 1000\$',
                  imageUrl: './assets/venue.png', // Placeholder for image
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'ទំព័រដើម'),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'សេវាកម្ម',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'គណនី',
          ),
        ],
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String title;
  final String location;
  final String price;
  final String imageUrl;

  const ServiceCard({
    super.key,
    required this.title,
    required this.location,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Image placeholder
          Container(
            width: 100,
            height: 100,
            margin: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
          ),

          // Content
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    location,
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                  SizedBox(height: 4),
                  Text(
                    price,
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
