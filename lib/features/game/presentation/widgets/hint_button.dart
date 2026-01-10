import 'package:flutter/material.dart';

/// Hint button widget that eliminates 2 wrong answers
/// Can only be used once per game
class HintButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isUsed;
  final bool isDisabled;

  const HintButton({
    super.key,
    required this.onPressed,
    this.isUsed = false,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    final bool canUse = !isUsed && !isDisabled;

    return Opacity(
      opacity: canUse ? 1.0 : 0.5,
      child: Material(
        color: const Color(0xFFFEF3C7), // Yellow-100
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: canUse ? onPressed : null,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xFFFCD34D), // Yellow-300
                width: 2,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  isUsed ? Icons.check_circle : Icons.lightbulb_outline,
                  size: 20,
                  color: const Color(0xFFCA8A04), // Yellow-600
                ),
                const SizedBox(width: 8),
                Text(
                  isUsed ? 'Hint Used' : 'Use Hint',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF92400E), // Yellow-800
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
