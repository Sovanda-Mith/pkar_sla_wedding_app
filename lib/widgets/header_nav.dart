import 'package:flutter/material.dart';

class HeaderNav extends StatelessWidget {
  final int unreadMessages;
  final int unreadNotifications;

  const HeaderNav({
    super.key,
    this.unreadMessages = 0,
    this.unreadNotifications = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      color: const Color(0xFF3A693A),
      child: SafeArea(
        bottom: false,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Logo / Title
              InkWell(
                onTap: () => Navigator.pushNamed(context, '/home'),
                borderRadius: BorderRadius.circular(8),
                splashColor: Colors.white24,
                child: Text(
                  'ផ្កាស្លា',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.2,
                  ),
                ),
              ),

              // Action Icons
              Row(
                children: [
                  _iconWithBadge(
                    context,
                    icon: Icons.chat_bubble_outline_rounded,
                    label: 'ប្រអប់សារ',
                    count: unreadMessages,
                    onTap: () {
                      Navigator.pushNamed(context, '/chat');
                    },
                  ),
                  const SizedBox(width: 20),
                  _iconWithBadge(
                    context,
                    icon: Icons.notifications_none_rounded,
                    label: 'ការជូនដំណឹង',
                    count: unreadNotifications,
                    onTap: () {
                      Navigator.pushNamed(context, '/notifications');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _iconWithBadge(
    BuildContext context, {
    required IconData icon,
    required String label,
    required int count,
    required VoidCallback onTap,
  }) {
    return Tooltip(
      message: label,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(icon, size: 28, color: Colors.white),
            ),
            if (count > 0)
              Positioned(
                right: 0,
                top: -4,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  constraints: const BoxConstraints(minWidth: 20),
                  child: Text(
                    '$count',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
