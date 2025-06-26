import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(home: VendorScreen());
//   }
// }

class VendorScreen extends StatelessWidget {
  const VendorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'ផ្កាស្លា', // "Vendors" in Khmer
          style: TextStyle(
            color: Colors.green,
            fontSize: 36,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.chat_bubble_outline, color: Colors.black),
            onPressed: () {
              // Handle chat action
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Colors.black),
            onPressed: () {
              // Handle notification action
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  VendorCategoryCard(
                    title: 'ជ្រើសរើសអ្នកផាត់មុខ', // Photography & Videography
                    imagePath: 'assets/makeup.png',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => const CategoryDetailScreen(
                                category: 'Photography & Videography',
                                titleKhmer: 'រូបថតនិងថតវីដេអូ',
                              ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  VendorCategoryCard(
                    title: 'ជ្រើសរើសសម្លៀកបំពាក់', // Wedding Attire
                    imagePath: 'assets/clothes.png',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => const CategoryDetailScreen(
                                category: 'Wedding Attire',
                                titleKhmer: 'រូបសំលៀកបំពាក់',
                              ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  VendorCategoryCard(
                    title: 'ជ្រើសរើសដេគ័រ', // Wedding Venue
                    imagePath: 'assets/decor.png',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => const CategoryDetailScreen(
                                category: 'Wedding Venue',
                                titleKhmer: 'រូបសំលៀកបំពាក់ការ',
                              ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  VendorCategoryCard(
                    title: 'ជ្រើសរើសជាងថត', // Temple Wedding
                    imagePath: 'assets/photographer.png',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => const CategoryDetailScreen(
                                category: 'Temple Wedding',
                                titleKhmer: 'រូបសំលៀកបំពាក់ត',
                              ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  VendorCategoryCard(
                    title: 'ជ្រើសរើសទីកន្លែង', // Wedding Catering
                    imagePath: 'assets/venue.png',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => const CategoryDetailScreen(
                                category: 'Wedding Catering',
                                titleKhmer: 'រូបសំលៀកបំពាក់ហ្វូដ',
                              ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  VendorCategoryCard(
                    title: 'ជ្រើសរើសតន្រ្តី', // Wedding Venue
                    imagePath: 'assets/music.png',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => const CategoryDetailScreen(
                                category: 'Wedding Venue',
                                titleKhmer: 'រូបសំលៀកបំពាក់ការ',
                              ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  VendorCategoryCard(
                    title: 'ជ្រើសរើសម្ហូបអាហារ', // Wedding Venue
                    imagePath: 'assets/food.png',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => const CategoryDetailScreen(
                                category: 'Wedding Venue',
                                titleKhmer: 'រូបសំលៀកបំពាក់ការ',
                              ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.green[700],
        unselectedItemColor: Colors.grey[600],
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            label: 'ទំព័រដើម', // Home
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'សេវាកម្ម', // Services
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'គណនី', // Account
          ),
        ],
      ),
    );
  }
}

class VendorCategoryCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback onTap;

  const VendorCategoryCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 1,
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Left side - Text
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ),
            // Right side - Image
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                    // Fallback for missing images
                    onError: (exception, stackTrace) {},
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    // Placeholder color when image fails to load
                    color: Colors.grey[300],
                  ),
                  child: const Icon(Icons.image, color: Colors.grey, size: 40),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Sample detail screen for categories
class CategoryDetailScreen extends StatelessWidget {
  final String category;
  final String titleKhmer;

  const CategoryDetailScreen({
    super.key,
    required this.category,
    required this.titleKhmer,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          titleKhmer,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.construction, size: 64, color: Colors.grey[400]),
            const SizedBox(height: 16),
            Text(
              '$category vendors will be listed here',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
