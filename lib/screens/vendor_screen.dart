import 'package:flutter/material.dart';
import 'package:pkar_sla_wedding_app/widgets/header_nav.dart';
import 'package:pkar_sla_wedding_app/widgets/footer_nav.dart';
import 'package:pkar_sla_wedding_app/screens/venue_screen.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});
  
  static const List<ServiceItem> services = [
    ServiceItem(
      text: 'ជ្រើសរើសអ្នកផាត់មុខ',
      imageUrl: 'assets/makeup.png',
      serviceType: 'ជាងផាត់មុខ',
    ),
    ServiceItem(
      text: 'ជ្រើសរើសសម្លៀកបំពាក់',
      imageUrl: 'assets/clothes.png',
      serviceType: 'សម្លៀកបំពាក់',
    ),
    ServiceItem(
      text: 'ជ្រើសរើសរោងការ',
      imageUrl: 'assets/hall.png',
      serviceType: 'រោងការ',
    ),
    ServiceItem(
      text: 'ជ្រើសរើសជាងថត',
      imageUrl: 'assets/photographer.png',
      serviceType: 'ជាងថតរូប',
    ),
    ServiceItem(
      text: 'ជ្រើសរើសទីកន្លែង',
      imageUrl: 'assets/venue.png',
      serviceType: 'ទីកន្លែង',
    ),
    ServiceItem(
      text: 'ជ្រើសរើសតន្រ្តី',
      imageUrl: 'assets/music.png',
      serviceType: 'តន្រ្តី',
    ),
    ServiceItem(
      text: 'ជ្រើសរើសចុងភៅ',
      imageUrl: 'assets/food.png',
      serviceType: 'ម្ហូបអាហារ',
    ),
    ServiceItem(
      text: 'ជ្រើសរើសដេគ័រ',
      imageUrl: 'assets/decor.png',
      serviceType: 'ដេគ័រ',
    ),
    ServiceItem(
      text: 'ជ្រើសរើសគ្រឿងតុបតែង',
      imageUrl: 'assets/image.png',
      serviceType: 'គ្រឿងតុបតែង',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Column(
        children: [
          const HeaderNav(),
          const SizedBox(height: 10),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: constraints.maxHeight),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: services
                          .map((service) => ItemWidget(
                                text: service.text,
                                imageUrl: service.imageUrl,
                                onTap: () => _onServiceTap(context, service),
                              ))
                          .toList(),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 10,),
          const FooterNav(),
        ],
      ),
    );
  }

  void _onServiceTap(BuildContext context, ServiceItem service) {
    // Navigate to venue screen for venue-related services
    if (service.serviceType == 'ជាងផាត់មុខ' ||
        service.serviceType == 'សម្លៀកបំពាក់' ||
        service.serviceType == 'រោងការ' ||
        service.serviceType == 'ជាងថតរូប' ||
        service.serviceType == 'ទីកន្លែង' || 
        service.serviceType == 'តន្រ្តី' || 
        service.serviceType == 'ម្ហូបអាហារ' ||
        service.serviceType == 'ដេគ័រ') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VenueScreen(serviceType: service.text, venueType: service.serviceType),
        ),
      );
    } else {
      // For other services, you can create similar screens or show a placeholder
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${service.text} screen coming soon!'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}

class ServiceItem {
  final String text;
  final String imageUrl;
  final String serviceType;

  const ServiceItem({
    required this.text,
    required this.imageUrl,
    required this.serviceType,
  });
}

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    super.key,
    required this.text,
    required this.imageUrl,
    this.onTap,
  });

  final String text;
  final String imageUrl;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: SizedBox(
          height: 120,
          child: Row(
            children: [
              // Text section
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      text,
                      style: const TextStyle(
                        fontFamily: 'KhmerOS',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
              ),
              // Image section
              Expanded(
                flex: 1,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                  child: SizedBox(
                    height: 120,
                    child: imageUrl.startsWith('http')
                        ? Image.network(
                            imageUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return _buildPlaceholder();
                            },
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes != null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              );
                            },
                          )
                        : Image.asset(
                            imageUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return _buildPlaceholder();
                            },
                          ),
                  ),
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
      height: 120,
      color: Colors.grey[300],
      child: const Center(
        child: Icon(
          Icons.image,
          color: Colors.grey,
          size: 40,
        ),
      ),
    );
  }
}