import 'package:flutter/material.dart';
import 'package:pkar_sla_wedding_app/widgets/header_nav.dart';
import 'package:pkar_sla_wedding_app/widgets/footer_nav.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [const HeaderNav(), const FooterNav()]),
    );
  }
}
