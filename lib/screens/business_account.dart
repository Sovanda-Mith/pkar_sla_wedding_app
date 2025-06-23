import 'package:flutter/material.dart';
import 'package:pkar_sla_wedding_app/screens/home_screen.dart';
import 'package:pkar_sla_wedding_app/screens/photo_gallery.dart';
import 'package:pkar_sla_wedding_app/widgets/header_nav.dart';
import 'package:pkar_sla_wedding_app/widgets/footer_nav.dart';

class BusinessAccountScreen extends StatelessWidget {
  const BusinessAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isOwner = checkIfUserIsOwner();
    return isOwner
        ? BusinessAccountScreenOwner()
        : BusinessAccountScreenViewer();
  }
}

bool checkIfUserIsOwner() {
  return true;
}

class BusinessAccountScreenViewer extends StatelessWidget {
  const BusinessAccountScreenViewer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const HeaderNav(),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Image.asset(
              'assets/decorb.png',
              height: 240,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/hall.png', width: 90),
                SizedBox(width: 4),
                Image.asset('assets/decor.png', width: 90),
                SizedBox(width: 4),
                Image.asset('assets/makeup.png', width: 90),
                SizedBox(width: 4),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PhotoGallery(),
                      ),
                    );
                  },
                  child: SizedBox(
                    width: 80,
                    height: 80,
                    child: Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/green_right_arrow.png',
                        width: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Text(
            'ឧត្តមមង្គល សំអាងការ',
            style: TextStyle(
              fontSize: 32,
              color: Color(0xFF000000),
              fontFamily: 'Noto Sans Khmer',
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 20),
          infoRow('ប្រភេទ:', ' រោងការ, ម្ហូបអាហារ, សម្លៀកបំពាក់'),
          infoRow('តម្លៃ:', '\$\$ - \$\$\$\$'),
          infoRow('ទីតាំង:', 'ភ្នំពេញ'),
          infoRow('លេខទូរស័ព្ទ:', '012 345 678'),
          Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFAFDBAF),
              minimumSize: Size(360, 56),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
            child: Text(
              'ទំនាក់ទំនង',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontFamily: 'Noto Sans Khmer',
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          Spacer(),
          const FooterNav(),
        ],
      ),
    );
  }
}

Widget infoRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 40),
    child: Row(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 20,
            color: Color(0xFF000000),
            fontFamily: 'Noto Sans Khmer',
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontSize: 20,
              color: Color(0xFF000000),
              fontFamily: 'Noto Sans Khmer',
            ),
          ),
        ),
      ],
    ),
  );
}

// Owner

class BusinessAccountScreenOwner extends StatefulWidget {
  const BusinessAccountScreenOwner({super.key});

  @override
  State<BusinessAccountScreenOwner> createState() =>
      _BusinessAccountScreenOwnerState();
}

class _BusinessAccountScreenOwnerState
    extends State<BusinessAccountScreenOwner> {
  Set<String> selectedTypes = {'រោងការ', 'ម្ហូបអាហារ', 'សម្លៀកបំពាក់'};

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

  final List<String> imageAssets = [
    'assets/hall.png',
    'assets/decor.png',
    'assets/makeup.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFF6EF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderNav(),
            const SizedBox(height: 20),
            _buildMainImage(),
            const SizedBox(height: 10),
            _buildImageGallery(),
            const SizedBox(height: 20),
            _buildEditableInfo(),
            const SizedBox(height: 30),
            _buildActionButtons(),
            const SizedBox(height: 20),
            const FooterNav(),
          ],
        ),
      ),
    );
  }

  Widget _buildMainImage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/decorb.png',
              height: 240,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 12,
            right: 12,
            child: PopupMenuButton<String>(
              icon: const Icon(Icons.edit, color: Colors.white),
              onSelected: (value) {
                print('$value selected');
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...imageAssets.map(
            (img) => Stack(
              children: [
                Container(
                  width: 90,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage(img),
                      fit: BoxFit.cover,
                    ),
                  ),
                  margin: const EdgeInsets.only(right: 8),
                ),
                Positioned(
                  top: 4,
                  right: 4,
                  child: PopupMenuButton<String>(
                    icon: const Icon(Icons.edit, size: 18, color: Colors.white),
                    onSelected: (value) {
                      print('$value selected on $img');
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
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const PhotoGallery();
                  },
                ),
              );
            },
            child: Container(
              width: 80,
              height: 80,
              padding: const EdgeInsets.all(20),
              child: Align(
                alignment: Alignment.center,
                child: Image.asset('assets/green_right_arrow.png', width: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEditableInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _editableTextRow('ឈ្មោះហាង:', 'ឧត្តមមង្គល សំអាងការ'),
          _editableTextRow(
            'ប្រភេទ:',
            selectedTypes.isEmpty
                ? 'មិនទាន់ជ្រើសរើស'
                : selectedTypes.join(', '),
            onTap: _showMultiSelectDialog,
          ),
          _editableTextRow('តម្លៃ:', '5000 ៛'),
          _editableTextRow('ទីតាំង:', 'ភ្នំពេញ'),
          _editableTextRow('លេខទូរស័ព្ទ:', '012 345 678'),
        ],
      ),
    );
  }

  Widget _editableTextRow(String label, String value, {VoidCallback? onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 6),
          Expanded(child: Text(value, style: const TextStyle(fontSize: 16))),
          IconButton(
            icon: const Icon(Icons.edit, size: 18),
            onPressed: onTap ?? () => print('Edit $label'),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
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
              print('Saved changes');
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
              print('Canceled edits');
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

  void _showMultiSelectDialog() {
    final tempSelected = Set<String>.from(selectedTypes);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('ជ្រើសរើសប្រភេទ'),
          content: StatefulBuilder(
            builder: (context, setState) {
              return ListView(
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
