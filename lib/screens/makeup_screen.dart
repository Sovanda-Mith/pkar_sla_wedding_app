import 'package:flutter/material.dart';
import 'package:pkar_sla_wedding_app/widgets/footer_nav.dart';
import 'package:pkar_sla_wedding_app/widgets/title_header.dart';

class MakeupScreen extends StatefulWidget {
  final String makeupType;

  const MakeupScreen({
    super.key,
    required this.makeupType,
    required String serviceType,
  });

  @override
  State<MakeupScreen> createState() => _MakeupScreenState();
}

class _MakeupScreenState extends State<MakeupScreen> {
  String selectedCity = 'ភ្នំពេញ';
  bool isDropdownOpen = false;

  // Get filtered makeups based on selected city
  List<MakeupItem> get filteredMakeups {
    return makeups.where((makeup) => makeup.type == selectedCity).toList();
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
    'ក្រចេះ',
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

  final List<MakeupItem> makeups = [
    MakeupItem(
      name: 'សម្សាញ់ភ្លើង ភ្លើងអេឡិចត្រូនិច',
      type: 'កំពត',
      priceRange: '450\$ - 2000\$',
      imageUrl: 'assets/image1.png',
    ),
    MakeupItem(
      name: 'ចន្ទ្រា ផលិតវីដេអូខេមរា',
      type: 'កែប',
      priceRange: '500\$ - 1500\$',
      imageUrl: 'assets/image2.png',
    ),
    MakeupItem(
      name: 'សោភ័ណ្ឌ សេវាបង្ហាញផ្កា',
      type: 'បាត់ដំបង',
      priceRange: '150\$ - 600\$',
      imageUrl: 'assets/image3.png',
    ),
    MakeupItem(
      name: 'រ័ត្នដែន សេវាបញ្ជាក់ទីតាំង',
      type: 'ព្រះវិហារ',
      priceRange: '300\$ - 1000\$',
      imageUrl: 'assets/image4.png',
    ),
    MakeupItem(
      name: 'ពន្លឺព្រះច័ន្ទ បន្លឺឆ្លុះ',
      type: 'កំពង់ធំ',
      priceRange: '500\$ - 2000\$',
      imageUrl: 'assets/image5.png',
    ),
    MakeupItem(
      name: 'ប៉ូលីណា ផាត់មុខម៉ូដថ្មី',
      type: 'សៀមរាប',
      priceRange: '200\$ - 700\$',
      imageUrl: 'assets/image14.png',
    ),
    MakeupItem(
      name: 'សុភា ម៉េកអាប់ជួរមុខឯកទេស',
      type: 'កែប',
      priceRange: '250\$ - 580\$',
      imageUrl: 'assets/image15.png',
    ),
    MakeupItem(
      name: 'អុិនណា សេវាផាត់មុខពិធីសំខាន់',
      type: 'ត្បូងឃ្មុំ',
      priceRange: '300\$ - 900\$',
      imageUrl: 'assets/image16.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Column(
        children: [
          // Custom Header with back arrow and makeup title
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
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Text(
                  widget.makeupType,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Spacer(),
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
          TitleHeader(title: widget.makeupType),

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
                    filteredMakeups
                        .map((makeup) => MakeupCard(makeup: makeup))
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

class MakeupItem {
  final String name;
  final String type;
  final String priceRange;
  final String imageUrl;

  const MakeupItem({
    required this.name,
    required this.type,
    required this.priceRange,
    required this.imageUrl,
  });
}

class MakeupCard extends StatelessWidget {
  final MakeupItem makeup;

  const MakeupCard({super.key, required this.makeup});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          // Navigate to makeup details
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // makeup Image
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: 80,
                  height: 80,
                  color: Colors.grey[300],
                  child:
                      makeup.imageUrl.startsWith('http')
                          ? Image.network(
                            makeup.imageUrl,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return _buildPlaceholder();
                            },
                          )
                          : Image.asset(
                            makeup.imageUrl,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return _buildPlaceholder();
                            },
                          ),
                ),
              ),

              const SizedBox(width: 16),

              // Makeup Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      makeup.name,
                      style: const TextStyle(
                        fontFamily: 'KhmerOS',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'ទីកន្លែង: ${makeup.type}',
                      style: const TextStyle(
                        fontFamily: 'KhmerOS',
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'តម្លៃ: ${makeup.priceRange}',
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
