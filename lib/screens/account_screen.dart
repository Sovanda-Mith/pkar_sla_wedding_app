import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pkar_sla_wedding_app/screens/home_screen.dart';
import 'package:pkar_sla_wedding_app/screens/photo_gallery.dart';
import 'package:pkar_sla_wedding_app/widgets/account_menu.dart';
import 'package:pkar_sla_wedding_app/widgets/custom_button.dart';
import 'package:pkar_sla_wedding_app/widgets/footer_nav.dart';
import 'package:pkar_sla_wedding_app/widgets/title_header.dart';

enum UserType { normal, business }

class AccountScreen extends StatefulWidget {
  final UserType userType;
  final bool isOwner;
  final String? title;

  const AccountScreen({
    super.key,
    required this.userType,
    required this.isOwner,
    this.title,
  });

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  String _businessName = 'ឧត្តមមង្គល សំអាងការ';
  List<String> _selectedServices = ['រោងការ', 'អ្នកផាត់មុខ'];
  String _priceRange = '100\$ - 200\$';
  List<String> _selectedLocations = ['ភ្នំពេញ'];
  String _phoneNumber = '012 345 678';

  final _priceOptions = [
    '100\$ - 200\$',
    '200\$ - 300\$',
    '300\$ - 400\$',
    '400\$ - 500\$',
    '500\$ - 1000\$',
    '1000\$ - 2000\$',
  ];

  // New image state
  File? _bannerImage;
  File? _hallImage;
  File? _decorImage;
  File? _makeupImage;

  Future<void> _pickImage(Function(File) onPicked) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      onPicked(File(pickedFile.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content;

    if (widget.userType == UserType.normal && widget.isOwner) {
      content = _normalOwnerView();
    } else if (widget.userType == UserType.normal && !widget.isOwner) {
      content = _normalGuestView();
    } else if (widget.userType == UserType.business && widget.isOwner) {
      content = _businessOwnerView();
    } else {
      content = _businessGuestView();
    }

    return Scaffold(
      body: Column(
        children: [
          TitleHeader(title: widget.title ?? 'គណនី'),
          Expanded(child: content),
          FooterNav(currentRoute: '/account'),
        ],
      ),
    );
  }

  void _editFieldDialog({
    required String title,
    required String initialValue,
    required Function(String) onSaved,
    List<String>? dropdownOptions,
  }) {
    String tempValue = initialValue;
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder:
              (context, setStateDialog) => AlertDialog(
                title: Text(title),
                content:
                    dropdownOptions != null
                        ? DropdownButton<String>(
                          value: tempValue,
                          isExpanded: true,
                          items:
                              dropdownOptions
                                  .map(
                                    (option) => DropdownMenuItem(
                                      value: option,
                                      child: Text(option),
                                    ),
                                  )
                                  .toList(),
                          onChanged: (value) {
                            if (value != null) {
                              setStateDialog(() => tempValue = value);
                            }
                          },
                        )
                        : TextField(
                          controller: TextEditingController(text: tempValue),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (val) => tempValue = val,
                        ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('បោះបង់'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      onSaved(tempValue);
                      Navigator.pop(context);
                    },
                    child: Text('រក្សាទុក'),
                  ),
                ],
              ),
        );
      },
    );
  }

  void _editListDialog({
    required String title,
    required List<String> options,
    required List<String> selectedValues,
    required Function(List<String>) onSaved,
  }) {
    List<String> temp = [...selectedValues];
    showDialog(
      context: context,
      builder:
          (_) => StatefulBuilder(
            builder:
                (context, setStateDialog) => AlertDialog(
                  title: Text(title),
                  content: Wrap(
                    spacing: 8,
                    children:
                        options.map((opt) {
                          final selected = temp.contains(opt);
                          return FilterChip(
                            label: Text(opt),
                            selected: selected,
                            onSelected: (val) {
                              setStateDialog(() {
                                if (val && !temp.contains(opt)) {
                                  temp.add(opt);
                                } else if (!val) {
                                  temp.remove(opt);
                                }
                              });
                            },
                          );
                        }).toList(),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('បោះបង់'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        onSaved(temp);
                        Navigator.pop(context);
                      },
                      child: Text('រក្សាទុក'),
                    ),
                  ],
                ),
          ),
    );
  }

  Widget _normalOwnerView() => AccountMenu();

  Widget _normalGuestView() {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/images/default_avatar.png'),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'ឈ្មោះអ្នកប្រើប្រាស់',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text('ចុះឈ្មោះនៅថ្ងៃ', style: TextStyle(color: Colors.grey)),
              ],
            ),
          ],
        ),
        SizedBox(height: 50),
        CustomButton(text: 'ផ្ញើសារ'),
      ],
    );
  }

  Widget _businessOwnerView() {
    return Column(
      children: [
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GestureDetector(
            onTap:
                () => _pickImage((file) => setState(() => _bannerImage = file)),
            child:
                _bannerImage != null
                    ? Image.file(
                      _bannerImage!,
                      height: 240,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )
                    : Image.asset(
                      'assets/decorb.png',
                      height: 240,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
          ),
        ),
        SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap:
                    () =>
                        _pickImage((file) => setState(() => _hallImage = file)),
                child:
                    _hallImage != null
                        ? Image.file(_hallImage!, width: 90)
                        : Image.asset('assets/hall.png', width: 90),
              ),
              GestureDetector(
                onTap:
                    () => _pickImage(
                      (file) => setState(() => _decorImage = file),
                    ),
                child:
                    _decorImage != null
                        ? Image.file(_decorImage!, width: 90)
                        : Image.asset('assets/decor.png', width: 90),
              ),
              GestureDetector(
                onTap:
                    () => _pickImage(
                      (file) => setState(() => _makeupImage = file),
                    ),
                child:
                    _makeupImage != null
                        ? Image.file(_makeupImage!, width: 90)
                        : Image.asset('assets/makeup.png', width: 90),
              ),
              GestureDetector(
                onTap:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const PhotoGallery()),
                    ),
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
        GestureDetector(
          onTap:
              () => _editFieldDialog(
                title: 'កែឈ្មោះ',
                initialValue: _businessName,
                onSaved: (val) => setState(() => _businessName = val),
              ),
          child: Text(
            _businessName,
            style: TextStyle(
              fontSize: 32,
              color: Colors.black,
              fontFamily: 'Noto Sans Khmer',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: 20),
        _editableInfoRow(
          'ប្រភេទ:',
          _selectedServices.join(', '),
          () => _editListDialog(
            title: 'ជ្រើសសេវាកម្ម',
            options: [
              'រោងការ',
              'ម្ហូបអាហារ',
              'សម្លៀកបំពាក់',
              'អ្នកផាត់មុខ',
              'ចុងភៅ',
              'ដេគ័រ',
              'ជាងថត​',
              'តន្ត្រី',
              'ទីកន្លែង',
            ],
            selectedValues: _selectedServices,
            onSaved: (val) => setState(() => _selectedServices = val),
          ),
        ),
        _editableInfoRow(
          'តម្លៃ:',
          _priceRange,
          () => _editFieldDialog(
            title: 'កែតម្លៃ',
            initialValue: _priceRange,
            dropdownOptions: _priceOptions,
            onSaved: (val) => setState(() => _priceRange = val),
          ),
        ),
        _editableInfoRow(
          'ទីតាំង:',
          _selectedLocations.join(', '),
          () => _editListDialog(
            title: 'ជ្រើសទីតាំង',
            options: ['ភ្នំពេញ', 'សៀមរាប', 'កំពង់ឆ្នាំង', 'បាត់ដំបង'],
            selectedValues: _selectedLocations,
            onSaved: (val) => setState(() => _selectedLocations = val),
          ),
        ),
        _editableInfoRow(
          'លេខទូរស័ព្ទ:',
          _phoneNumber,
          () => _editFieldDialog(
            title: 'កែលេខទូរស័ព្ទ',
            initialValue: _phoneNumber,
            onSaved: (val) => setState(() => _phoneNumber = val),
          ),
        ),
        Spacer(),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF3A693A),
            minimumSize: Size(360, 56),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (_) => AccountScreen(
                      userType: UserType.business,
                      isOwner: false,
                    ),
              ),
            );
          },
          child: Text(
            'មើលជាអ្នកប្រើផ្សេង',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontFamily: 'Noto Sans Khmer',
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        SizedBox(height: 10),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFAFDBAF),
            minimumSize: Size(360, 56),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (_) =>
                        AccountScreen(userType: UserType.normal, isOwner: true),
              ),
            );
          },
          child: Text(
            'កែប្រែគណនី',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontFamily: 'Noto Sans Khmer',
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        Spacer(),
      ],
    );
  }

  Widget _editableInfoRow(String label, String value, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 40),
        child: Row(
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Noto Sans Khmer',
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                value,
                style: TextStyle(fontSize: 20, fontFamily: 'Noto Sans Khmer'),
              ),
            ),
            Icon(Icons.edit, size: 18, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget _businessGuestView() {
    return Column(
      children: [
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child:
              _bannerImage != null
                  ? Image.file(
                    _bannerImage!,
                    height: 240,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )
                  : Image.asset(
                    'assets/decorb.png',
                    height: 240,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
        ),
        SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _hallImage != null
                  ? Image.file(_hallImage!, width: 90)
                  : Image.asset('assets/hall.png', width: 90),
              _decorImage != null
                  ? Image.file(_decorImage!, width: 90)
                  : Image.asset('assets/decor.png', width: 90),
              _makeupImage != null
                  ? Image.file(_makeupImage!, width: 90)
                  : Image.asset('assets/makeup.png', width: 90),
              GestureDetector(
                onTap:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const PhotoGallery()),
                    ),
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
          _businessName,
          style: TextStyle(
            fontSize: 32,
            color: Colors.black,
            fontFamily: 'Noto Sans Khmer',
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 20),
        infoRow('ប្រភេទ:', _selectedServices.join(', ')),
        infoRow('តម្លៃ:', _priceRange),
        infoRow('ទីតាំង:', _selectedLocations.join(', ')),
        infoRow('លេខទូរស័ព្ទ:', _phoneNumber),
        Spacer(),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFAFDBAF),
            minimumSize: Size(360, 56),
          ),
          onPressed:
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => HomeScreen()),
              ),
          child: Text(
            'ទំនាក់ទំនង',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontFamily: 'Noto Sans Khmer',
            ),
          ),
        ),
        Spacer(),
      ],
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
