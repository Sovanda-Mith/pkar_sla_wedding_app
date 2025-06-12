import 'package:flutter/material.dart';
import 'package:pkar_sla_wedding_app/widgets/footer_nav.dart';
import 'package:pkar_sla_wedding_app/widgets/header_nav.dart';

class BusinessAccountScreen extends StatefulWidget {
  const BusinessAccountScreen({super.key});

  @override
  State<BusinessAccountScreen> createState() => _BusinessAccountScreenState();
}

class _BusinessAccountScreenState extends State<BusinessAccountScreen> {
  final nameController = TextEditingController(
    text: 'ឈ្មោះហាង: ឯកមនុស្ស សាខាខាង',
  );
  final typeController = TextEditingController(
    text: 'ប្រភេទ: ហាងការ, មុខរបរ, សេវាកម្មផ្សេងៗ',
  );
  final priceController = TextEditingController(text: 'តម្លៃ: ');
  final locationController = TextEditingController(text: 'ទីតាំង: ភ្នំពេញ');
  final phoneController = TextEditingController(
    text: 'លេខទូរស័ព្ទ: 012 345 678',
  );

  @override
  void dispose() {
    nameController.dispose();
    typeController.dispose();
    priceController.dispose();
    locationController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFF6EF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderNav(),
            const SizedBox(height: 8),
            _buildImageSection(),
            const SizedBox(height: 16),
            _buildTextFields(),
            const SizedBox(height: 16),
            _buildButtons(),
          ],
        ),
      ),
      bottomNavigationBar: const FooterNav(),
    );
  }

  Widget _buildImageSection() {
    return Column(
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset('assets/hall.png'),
            ),
            const Positioned(bottom: 10, right: 10, child: Icon(Icons.edit)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(3, (i) {
            return Stack(
              children: [
                Container(
                  width: 90,
                  height: 90,
                  margin: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage('assets/hall_$i.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 4,
                  right: 4,
                  child: PopupMenuButton<String>(
                    icon: const Icon(Icons.edit),
                    onSelected: (value) => print('$value tapped for $i'),
                    itemBuilder:
                        (_) => [
                          const PopupMenuItem(
                            value: 'upload',
                            child: ListTile(
                              leading: Icon(Icons.upload),
                              title: Text('Upload'),
                            ),
                          ),
                          const PopupMenuItem(
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
            );
          })..add(const Icon(Icons.arrow_forward, color: Colors.green)),
        ),
      ],
    );
  }

  Widget _buildTextFields() {
    return Column(
      children: [
        _buildField('ឈ្មោះហាង', nameController),
        _buildField('ប្រភេទ', typeController),
        _buildField('តម្លៃ', priceController),
        _buildField('ទីតាំង', locationController),
        _buildField('លេខទូរស័ព្ទ', phoneController),
      ],
    );
  }

  Widget _buildField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _buildButtons() {
    return Column(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF3F6B3F),
            minimumSize: const Size.fromHeight(50),
          ),
          onPressed: () {},
          child: const Text('រក្សាទុក', style: TextStyle(fontSize: 18)),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFB5DCB5),
            minimumSize: const Size.fromHeight(50),
          ),
          onPressed: () {},
          child: const Text(
            'បិទការកែប្រែទាំងអស់',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}
