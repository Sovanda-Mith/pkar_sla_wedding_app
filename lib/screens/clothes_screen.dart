import 'package:flutter/material.dart';
import 'package:pkar_sla_wedding_app/widgets/header_nav.dart';
import 'package:pkar_sla_wedding_app/widgets/footer_nav.dart';
import 'package:pkar_sla_wedding_app/widgets/title_header.dart';

class ClothesScreen extends StatefulWidget {
  final String clothesType;

  const ClothesScreen({super.key, required this.clothesType});

  @override
  State<ClothesScreen> createState() => _ClothesScreenState();
}

class _ClothesScreenState extends State<ClothesScreen> {
  String selectedCity = 'ភ្នំពេញ';
  bool isDropdownOpen = false;

  // Get filtered clothes based on selected city
  List<ClothesItem> get filteredClothes {
    return clothes.where((clothes) => clothes.type == selectedCity).toList();
  }

  final List<String> cities = [
    'ភ្នំពេញ',
    'សៀមរាប',
    'បាត់ដំបង',
    'កំពង់ចាម',
    'កំពង់ស្ពឺ',
    'ក្រចេះ',
    'មណ្ឌលគិរី',
    'ព្រៃវែង',
    'បន្ទាយមានជ័យ',
    'កំពត',
    'កោះកុង',
    'ឧត្ដរមានជ័យ',
    'ប៉ៃលិន',
    'ព្រះវិហារ',
    'ព្រះសីហនុ',
    'រតនគិរី',
    'ស្ទឹងត្រែង',
    'ស្វាយរៀង',
    'តាកែវ',
    'ត្បូងឃ្មុំ',
  ];

  final List<ClothesItem> clothes = [
    ClothesItem(
      name: 'សម្សាញ់ភ្លើង ភ្លើងអេឡិចត្រូនិច',
      type: 'កំពត',
      priceRange: '450\$ - 2000\$',
      imageUrl: 'assets/image1.png',
    ),
    ClothesItem(
      name: 'ចន្ទ្រា ផលិតវីដេអូខេមរា',
      type: 'ភ្នំពេញ',
      priceRange: '500\$ - 1500\$',
      imageUrl: 'assets/image2.png',
    ),
    ClothesItem(
      name: 'សោភ័ណ្ឌ សេវាបង្ហាញផ្កា',
      type: 'បាត់ដំបង',
      priceRange: '150\$ - 600\$',
      imageUrl: 'assets/image3.png',
    ),
    ClothesItem(
      name: 'រ័ត្នដែន សេវាបញ្ជាក់ទីតាំង',
      type: 'ព្រះវិហារ',
      priceRange: '300\$ - 1000\$',
      imageUrl: 'assets/image4.png',
    ),
    ClothesItem(
      name: 'ពន្លឺព្រះច័ន្ទ បន្លឺឆ្លុះ',
      type: 'សៀមរាប', // Changed from 'កំពង់ធំ' to match cities list
      priceRange: '500\$ - 2000\$',
      imageUrl: 'assets/image5.png',
    ),
    ClothesItem(
      name: 'មរតកស្នេហា សេវាទៀនរចនា',
      type: 'តាកែវ',
      priceRange: '200\$ - 700\$',
      imageUrl: 'assets/image6.png',
    ),
    ClothesItem(
      name: 'ស្នាមអនុស្សាវរីយ៍ ថតព្រឹត្តិការណ៍',
      type: 'កំពត',
      priceRange: '450\$ - 1800\$',
      imageUrl: 'assets/image7.png',
    ),
    ClothesItem(
      name: 'កញ្ញាសោភា សេវាម៉ូតការពារ',
      type: 'ប៉ោយប៉ែត',
      priceRange: '300\$ - 1200\$',
      imageUrl: 'assets/image8.png',
    ),
    ClothesItem(
      name: 'សុវត្ថិភាព ដឹកជញ្ជូនភ្ញៀវ',
      type: 'កណ្ដាល',
      priceRange: '250\$ - 900\$',
      imageUrl: 'assets/image9.png',
    ),
    ClothesItem(
      name: 'សុណ្ឌតារា សេវាបង្ហាញអលង្ការ',
      type: 'កំពង់ចាម',
      priceRange: '500\$ - 2000\$',
      imageUrl: 'assets/image10.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Column(
        children: [
          // Custom Header with back arrow and venue title
          /*
          Container(
            color: Color(0xFF3A693A),
            height: 100,
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 20, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.arrow_back, color: Colors.white, size: 30),
                ),
                Text(
                  widget.clothesType,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/icons/chat.png',
                      height: 30,
                      width: 30,
                      color: Colors.white,
                    ),
                    SizedBox(width: 20),
                    Image.asset(
                      'assets/icons/notification.png',
                      height: 30,
                      width: 30,
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
          */
          TitleHeader(title: widget.clothesType),

          // City Dropdown Bar
          GestureDetector(
            onTap: () {
              setState(() {
                isDropdownOpen = !isDropdownOpen;
              });
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(color: Colors.grey[300]!, width: 1),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    isDropdownOpen
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: Colors.black87,
                  ),
                  SizedBox(width: 10),
                  Text(
                    selectedCity,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Dropdown List
          if (isDropdownOpen)
            Container(
              width: double.infinity,
              constraints: BoxConstraints(maxHeight: 200),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: cities.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCity = cities[index];
                        isDropdownOpen = false;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey[200]!,
                            width: 0.5,
                          ),
                        ),
                      ),
                      child: Text(
                        cities[index],
                        style: TextStyle(
                          fontSize: 16,
                          color:
                              selectedCity == cities[index]
                                  ? Color(0xFF3A693A)
                                  : Colors.black87,
                          fontWeight:
                              selectedCity == cities[index]
                                  ? FontWeight.w600
                                  : FontWeight.normal,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

          const SizedBox(height: 10),

          // Venue List
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children:
                    filteredClothes
                        .map((clothes) => ClothesCard(clothes: clothes))
                        .toList(),
              ),
            ),
          ),

          SizedBox(height: 10),
          const FooterNav(currentRoute: '/services'),
        ],
      ),
    );
  }
}

class ClothesItem {
  final String name;
  final String type;
  final String priceRange;
  final String imageUrl;

  const ClothesItem({
    required this.name,
    required this.type,
    required this.priceRange,
    required this.imageUrl,
  });
}

class ClothesCard extends StatelessWidget {
  final ClothesItem clothes;

  const ClothesCard({super.key, required this.clothes});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          // Navigate to clothes details
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ClothesDetailScreen(clothes: clothes),
            ),
          ); // Debug print
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Clothes Image
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: 80,
                  height: 80,
                  color: Colors.grey[300],
                  child:
                      _buildPlaceholder(), // Use placeholder instead of asset images
                ),
              ),

              const SizedBox(width: 16),

              // Venue Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      clothes.name,
                      style: const TextStyle(
                        fontFamily: 'KhmerOS',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'ទីកន្លែង: ${clothes.type}',
                      style: const TextStyle(
                        fontFamily: 'KhmerOS',
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'តម្លៃ: ${clothes.priceRange}',
                      style: const TextStyle(
                        fontFamily: 'KhmerOS',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF3A693A),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      width: 80,
      height: 80,
      color: Colors.grey[300],
      child: const Center(
        child: Icon(Icons.image, color: Colors.grey, size: 30),
      ),
    );
  }
}

class ClothesDetailScreen extends StatelessWidget {
  final ClothesItem clothes;

  const ClothesDetailScreen({super.key, required this.clothes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const HeaderNav(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Main Image
                  Container(
                    width: double.infinity,
                    height: 300,
                    margin: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        clothes.imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey[300],
                            child: const Icon(Icons.image, size: 80),
                          );
                        },
                      ),
                    ),
                  ),

                  // Thumbnail Images
                  Container(
                    height: 80,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        _buildThumbnail(clothes.imageUrl),
                        const SizedBox(width: 12),
                        _buildThumbnail(clothes.imageUrl),
                        const SizedBox(width: 12),
                        _buildThumbnail(clothes.imageUrl),
                        const Spacer(),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: const Color(0xFF4A7C59),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Title and Details
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          clothes.name,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Details Row
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildDetailRow(
                                    'ប្រពេណ្ធ:',
                                    'ម៉ាករ, ម្តុមអាណា, សម្ល្បីកបរកាដ',
                                  ),
                                  const SizedBox(height: 8),
                                  _buildDetailRow('តម្លៃ:', clothes.priceRange),
                                  const SizedBox(height: 8),
                                  _buildDetailRow('ទីតាំង:', clothes.type),
                                  const SizedBox(height: 8),
                                  _buildDetailRow(
                                    'លេខទូរស័ព្ទ:',
                                    '012 345 678',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 100), // Space for bottom button
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 1,
              blurRadius: 8,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Contact Button
            Container(
              width: double.infinity,
              height: 50,
              margin: const EdgeInsets.only(bottom: 16),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF90EE90),
                  foregroundColor: Colors.black,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  'ទំនាក់ទំនង',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
            ),

            // Footer Navigation
            const FooterNav(currentRoute: '/services'),
          ],
        ),
      ),
    );
  }

  Widget _buildThumbnail(String imagePath) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey[300],
              child: const Icon(Icons.image, size: 30),
            );
          },
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            style: TextStyle(fontSize: 14, color: Colors.grey[800]),
          ),
        ),
      ],
    );
  }
}
