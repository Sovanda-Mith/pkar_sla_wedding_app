import 'package:flutter/material.dart';
import 'package:pkar_sla_wedding_app/widgets/footer_nav.dart';
import 'package:pkar_sla_wedding_app/widgets/header_nav.dart';

class BusinessAccountScreen extends StatefulWidget {
  const BusinessAccountScreen({super.key});

  @override
  State<BusinessAccountScreen> createState() => _BusinessAccountScreenState();
}

class _BusinessAccountScreenState extends State<BusinessAccountScreen> {
  Set<String> selectedTypes = {'សេវាកម្មផ្សេងៗ'};

  final List<String> options = [
    'រោងការ',
    'អ្នកផាត់មុខ',
    'ដេគ័រ',
    'សម្លៀកបំពាក់',
    'ជាងថតរូប',
    'តន្រ្តី',
    'ទីកន្លែង',
    'ម្ហូបអាហារ',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFF6EF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderNav(),
            const SizedBox(height: 8),
            _buildMainImage(),
            _buildImageGallery(),
            const SizedBox(height: 16),
            _buildEditableTextDisplay(),
            const SizedBox(height: 16),
            _buildActionButtons(),
          ],
        ),
      ),
      bottomNavigationBar: const FooterNav(),
    );
  }

  Widget _buildMainImage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                image: AssetImage('assets/hall.png'),
                fit: BoxFit.cover,
                opacity: 0.7,
              ),
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: PopupMenuButton<String>(
              icon: const Icon(Icons.edit, size: 20, color: Colors.white),
              onSelected: (value) {
                print('$value selected for main image');
              },
              itemBuilder:
                  (context) => const [
                    PopupMenuItem(
                      value: 'upload',
                      child: ListTile(
                        leading: Icon(Icons.upload),
                        title: Text('Upload'),
                      ),
                    ),
                    PopupMenuItem(
                      value: 'delete',
                      child: ListTile(
                        leading: Icon(Icons.delete),
                        title: Text('Delete'),
                      ),
                    ),
                  ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageGallery() {
    final images = [
      'assets/makeup.png',
      'assets/music.png',
      'assets/photographer.png',
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          for (int i = 0; i < images.length; i++)
            Stack(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  margin: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage(images[i]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 4,
                  right: 4,
                  child: PopupMenuButton<String>(
                    icon: const Icon(Icons.edit, size: 18),
                    onSelected: (value) => print('$value selected on image $i'),
                    itemBuilder:
                        (context) => const [
                          PopupMenuItem(
                            value: 'upload',
                            child: ListTile(
                              leading: Icon(Icons.upload),
                              title: Text('Upload'),
                            ),
                          ),
                          PopupMenuItem(
                            value: 'delete',
                            child: ListTile(
                              leading: Icon(Icons.delete),
                              title: Text('Delete'),
                            ),
                          ),
                        ],
                  ),
                ),
              ],
            ),
          const Icon(Icons.arrow_forward, color: Colors.green),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF3F6B3F),
              minimumSize: const Size.fromHeight(50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              // Save action here
            },
            child: const Text('រក្សាទុក', style: TextStyle(fontSize: 18)),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFB5DCB5),
              minimumSize: const Size.fromHeight(50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              // Cancel edit action here
            },
            child: const Text(
              'បិទការកែប្រែទាំងអស់',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEditableTextDisplay() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'ឈ្មោះហាង: ឯកមនុស្ស សាខាខាង',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 6),
              const Icon(Icons.edit, size: 18),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'ប្រភេទ: ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Expanded(
                child: Text(
                  selectedTypes.isEmpty
                      ? 'មិនទាន់ជ្រើសរើស'
                      : selectedTypes.join(', '),
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.edit, size: 18),
                onPressed: () {
                  _showMultiSelectDialog();
                },
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: const [
              Text(
                'តម្លៃ: ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text('5000 ៛', style: TextStyle(fontSize: 16)),
              SizedBox(width: 4),
              Icon(Icons.edit, size: 18),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: const [
              Text(
                'ទីតាំង: ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text('ភ្នំពេញ', style: TextStyle(fontSize: 16)),
              SizedBox(width: 4),
              Icon(Icons.edit, size: 18),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: const [
              Text(
                'លេខទូរស័ព្ទ: ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text('012 345 678', style: TextStyle(fontSize: 16)),
              SizedBox(width: 4),
              Icon(Icons.edit, size: 18),
            ],
          ),
        ],
      ),
    );
  }

  void _showMultiSelectDialog() {
    final tempSelected = Set<String>.from(selectedTypes);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('ជ្រើសរើសប្រភេទ'),
          content: StatefulBuilder(
            builder: (context, setState) {
              return SizedBox(
                width: double.maxFinite,
                child: ListView(
                  shrinkWrap: true,
                  children:
                      options.map((option) {
                        return CheckboxListTile(
                          title: Text(option),
                          value: tempSelected.contains(option),
                          onChanged: (bool? checked) {
                            setState(() {
                              if (checked == true) {
                                tempSelected.add(option);
                              } else {
                                tempSelected.remove(option);
                              }
                            });
                          },
                        );
                      }).toList(),
                ),
              );
            },
          ),
          actions: [
            TextButton(
              child: const Text('បោះបង់'),
              onPressed: () => Navigator.pop(context),
            ),
            ElevatedButton(
              child: const Text('យល់ព្រម'),
              onPressed: () {
                setState(() {
                  selectedTypes = tempSelected;
                });
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
