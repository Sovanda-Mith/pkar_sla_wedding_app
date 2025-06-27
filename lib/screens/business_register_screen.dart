import 'package:flutter/material.dart';
import 'package:pkar_sla_wedding_app/screens/account_screen.dart';
import 'package:pkar_sla_wedding_app/screens/user_choice_screen.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BusinessRegister(),
    ),
  );
}

class BusinessRegister extends StatefulWidget {
  const BusinessRegister({super.key});

  @override
  State<BusinessRegister> createState() => _BusinessRegisterState();
}

class _BusinessRegisterState extends State<BusinessRegister> {
  List<String> _selectedServices = [];
  List<String> _selectedCity = [];
  bool checkBoxAllCities = false;
  bool contactPermission = false;
  bool accountActivationConsent = false;

  void _showServiceSelectDialog() async {
    final List<String> services = [
      'រោងការ',
      'អ្នកផាត់មុខ',
      'ដេគ័រ',
      'សម្លៀកបំពាក់',
      'ជាងថតរូប',
      'តន្រ្តី',
      'ទីកន្លែង',
      'ម្ហូបអាហារ',
    ];

    final List<String>? results = await showDialog(
      context: context,
      builder: (context) => _MultiSelectDialog(items: services),
    );

    if (results != null) {
      setState(() {
        _selectedServices = results;
      });
    }
  }

  void _showCitySelectDialog() async {
    final List<String> cities = [
      'ភ្នំពេញ',
      'បាត់ដំបង',
      'កណ្តាល',
      'កំពង់ចាម',
      'កំពង់ឆ្នាំង',
      'កំពង់ស្ពឺ',
      'កំពង់ធំ',
      'កំពត',
      'កណ្ដាល',
      'កែប',
      'កោះកុង',
      'ក្រចេះ',
      'មណ្ឌលគិរី',
      'ឧត្ដរមានជ័យ',
      'ប៉ៃលិន',
      'ព្រះវិហារ',
      'ព្រះសីហនុ',
      'ព្រៃវែង',
      'រតនគិរី',
      'សៀមរាប',
      'ស្ទឹងត្រែង',
      'ស្វាយរៀង',
      'តាកែវ',
      'ត្បូងឃ្មុំ',
    ];

    final List<String>? results = await showDialog(
      context: context,
      builder: (context) => _MultiSelectDialog(items: cities),
    );

    if (results != null) {
      setState(() {
        _selectedCity = results;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UserChoiceScreen(),
                      ),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image(
                          image: AssetImage('assets/back_arrow.png'),
                          width: 24,
                          height: 24,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Center(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Text(
                            'ផ្កាស្លា',
                            style: TextStyle(
                              foreground:
                                  Paint()
                                    ..style = PaintingStyle.stroke
                                    ..strokeWidth = 2
                                    ..color = Colors.black,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Noto Sans Khmer',
                            ),
                          ),
                          Text(
                            'ផ្កាស្លា',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF3A693A),
                              fontFamily: 'Noto Sans Khmer',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Stack(
                        children: [
                          Text(
                            'ចុះឈ្មោះចូល',
                            style: TextStyle(
                              foreground:
                                  Paint()
                                    ..style = PaintingStyle.stroke
                                    ..strokeWidth = 1
                                    ..color = Colors.black,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Noto Sans Khmer',
                            ),
                          ),
                          Text(
                            'ចុះឈ្មោះចូល',
                            style: TextStyle(
                              fontSize: 28,
                              color: Color(0xFF9BFA9B),
                              fontFamily: 'Noto Sans Khmer',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 28),

                _buildLabel('ឈ្មោះ'),
                _buildTextField(),

                const SizedBox(height: 40),

                _buildLabel('អុីម៉ែល'),
                _buildTextField(),

                const SizedBox(height: 30),

                _buildLabel('លេខកូដ'),
                _buildTextField(),

                const SizedBox(height: 40),

                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Row(
                    children: [
                      _buildLabel('សេវាកម្ម'),
                      const SizedBox(width: 70),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green[900],
                          padding: const EdgeInsets.symmetric(
                            horizontal: 60,
                            vertical: 10,
                          ),
                        ),
                        onPressed: _showServiceSelectDialog,
                        child: Row(
                          children: const [
                            Image(
                              image: AssetImage('assets/search.png'),
                              width: 20,
                              height: 20,
                            ),
                            SizedBox(width: 12),
                            Text(
                              'ជ្រើសរើស',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: 'Noto Sans Khmer',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Wrap(
                    spacing: 8,
                    children:
                        _selectedServices
                            .map(
                              (e) => Chip(
                                backgroundColor: Colors.green[900],
                                label: Text(
                                  e,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Noto Sans Khmer',
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                  ),
                ),

                const SizedBox(height: 20),

                _buildLabel('ទីតាំង'),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'ខេត្តក្រុងដែលអាចធ្វើសេវាកម្មបាន',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.green[900],
                        fontFamily: 'Noto Sans Khmer',
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Row(
                    children: [
                      Checkbox(
                        value: checkBoxAllCities,
                        onChanged: (bool? value) {
                          setState(() {
                            checkBoxAllCities = value ?? false;
                            if (checkBoxAllCities) {
                              _selectedCity.clear();
                            }
                          });
                        },
                      ),
                      Text(
                        'គ្រប់ខេត្តក្រុង​ ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.green[900],
                          fontFamily: 'Noto Sans Khmer',
                        ),
                      ),
                    ],
                  ),
                ),
                if (!checkBoxAllCities)
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green[900],
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 10,
                          ),
                        ),
                        onPressed: _showCitySelectDialog,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Image(
                              image: AssetImage('assets/search.png'),
                              width: 20,
                              height: 20,
                            ),
                            SizedBox(width: 12),
                            Text(
                              'ជ្រើសរើស',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: 'Noto Sans Khmer',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                const SizedBox(height: 30),

                _buildLabel('លេខទូរស័ព្ទ'),
                _buildTextField(),

                const SizedBox(height: 30),

                _buildConsentCheckbox(
                  value: contactPermission,
                  onChanged: (v) => setState(() => contactPermission = v),
                  texts: [
                    'ផ្តល់សិទ្វិឲពួកយើងក្នុងការទាក់ទងទៅ​ ',
                    'ដើម្បីបញ្ជាក់ពីសេវាកម្មរបស់អ្នក',
                  ],
                ),
                const SizedBox(height: 30),
                _buildConsentCheckbox(
                  value: accountActivationConsent,
                  onChanged:
                      (v) => setState(() => accountActivationConsent = v),
                  texts: [
                    'គណនីរបស់អ្នកនឹងអាចដំណើរការបាននៅពេលដែលយើង​ ',
                    'បានទាក់ទងនិងបញ្ជាក់ពីសុក្រឹត្យភាពរបស់សេវាកម្មមួយនេះ',
                  ],
                ),

                const SizedBox(height: 30),

                Padding(
                  padding: const EdgeInsets.only(left: 110),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[900],
                      padding: const EdgeInsets.symmetric(
                        horizontal: 60,
                        vertical: 10,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => const AccountScreen(
                                isOwner: true,
                                userType: UserType.business,
                              ),
                        ),
                      );
                    },
                    child: const Text(
                      'បង្កើតគណនី',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: 'Noto Sans Khmer',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(left: 50),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          label,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.green[900],
            fontFamily: 'Noto Sans Khmer',
          ),
        ),
      ),
    );
  }

  Widget _buildTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: const TextField(
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color.fromRGBO(27, 94, 32, 1)),
          ),
        ),
      ),
    );
  }

  Widget _buildConsentCheckbox({
    required bool value,
    required void Function(bool) onChanged,
    required List<String> texts,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 40),
      child: Row(
        children: [
          Checkbox(
            value: value,
            onChanged: (bool? newValue) => onChanged(newValue ?? false),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
                texts
                    .map(
                      (t) => Text(
                        t,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.green[900],
                          fontFamily: 'Noto Sans Khmer',
                        ),
                      ),
                    )
                    .toList(),
          ),
        ],
      ),
    );
  }
}

class _MultiSelectDialog extends StatefulWidget {
  final List<String> items;
  const _MultiSelectDialog({required this.items});

  @override
  State<_MultiSelectDialog> createState() => _MultiSelectDialogState();
}

class _MultiSelectDialogState extends State<_MultiSelectDialog> {
  final List<String> _selectedItems = [];

  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      isSelected
          ? _selectedItems.add(itemValue)
          : _selectedItems.remove(itemValue);
    });
  }

  void _submit() {
    Navigator.pop(context, _selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'សូមជ្រើសរើស',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.green,
          fontFamily: 'Noto Sans Khmer',
        ),
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children:
              widget.items.map((item) {
                return CheckboxListTile(
                  value: _selectedItems.contains(item),
                  title: Text(
                    item,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 27, 94, 32),
                      fontFamily: 'Noto Sans Khmer',
                    ),
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged:
                      (isChecked) => _itemChange(item, isChecked ?? false),
                );
              }).toList(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            'បោះបង់',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.green,
              fontFamily: 'Noto Sans Khmer',
            ),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green[900],
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          ),
          onPressed: _submit,
          child: const Text(
            'យល់ព្រម',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'Noto Sans Khmer',
            ),
          ),
        ),
      ],
    );
  }
}
