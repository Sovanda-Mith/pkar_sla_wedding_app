import 'package:flutter/material.dart';

class LongPressIconLabel extends StatefulWidget {
  final String imagePath;
  final String label;
  final VoidCallback? onTap;
  final double size;

  const LongPressIconLabel({
    super.key,
    required this.imagePath,
    required this.label,
    this.onTap,
    this.size = 30,
  });

  @override
  State<LongPressIconLabel> createState() => _LongPressIconLabelState();
}

class _LongPressIconLabelState extends State<LongPressIconLabel> {
  OverlayEntry? _overlayEntry;

  void _showLabelOverlay(BuildContext context) {
    final renderBox = context.findRenderObject() as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);

    _overlayEntry = OverlayEntry(
      builder:
          (context) => Positioned(
            top: offset.dy - 30,
            left: offset.dx,
            child: Material(
              color: Colors.transparent,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  widget.label,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ),
          ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _hideLabelOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onLongPressStart: (_) => _showLabelOverlay(context),
      onLongPressEnd: (_) => _hideLabelOverlay(),
      child: Image.asset(
        widget.imagePath,
        height: widget.size,
        width: widget.size,
      ),
    );
  }

  @override
  void dispose() {
    _hideLabelOverlay();
    super.dispose();
  }
}
