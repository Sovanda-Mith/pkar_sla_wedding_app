import 'package:flutter/material.dart';

class TitleHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onBackPressed;
  final VoidCallback? onChatPressed;
  final VoidCallback? onNotificationPressed;
  final int unreadMessages;
  final int unreadNotifications;

  const TitleHeader({
    super.key,
    required this.title,
    this.onBackPressed,
    this.onChatPressed,
    this.onNotificationPressed,
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
            children: [
              // Back Button (left)
              InkWell(
                onTap: onBackPressed ?? () => Navigator.of(context).pop(),
                borderRadius: BorderRadius.circular(24),
                splashColor: Colors.white24,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 28,
                    color: Colors.white,
                  ),
                ),
              ),

              // Title (center)
              Expanded(
                child: Center(
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.2,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),

              // Chat and Notification (right)
              Row(
                children: [
                  _iconWithBadge(
                    context,
                    icon: Icons.chat_bubble_outline_rounded,
                    label: 'ប្រអប់សារ',
                    count: unreadMessages,
                    onTap: onChatPressed,
                  ),
                  const SizedBox(width: 20),
                  _iconWithBadge(
                    context,
                    icon: Icons.notifications_none_rounded,
                    label: 'ការជូនដំណឹង',
                    count: unreadNotifications,
                    onTap: onNotificationPressed,
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
    required VoidCallback? onTap,
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
