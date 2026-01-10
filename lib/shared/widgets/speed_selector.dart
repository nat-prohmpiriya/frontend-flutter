import 'package:flutter/material.dart';

import '../../core/providers/audio_settings_provider.dart';
import '../../core/theme/app_colors.dart';

/// Dropdown/popup for selecting playback speed
class SpeedSelector extends StatelessWidget {
  const SpeedSelector({
    super.key,
    required this.currentSpeed,
    required this.onSpeedChanged,
    this.compact = true,
  });

  final double currentSpeed;
  final ValueChanged<double> onSpeedChanged;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<double>(
      initialValue: currentSpeed,
      onSelected: onSpeedChanged,
      tooltip: 'Playback speed',
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      position: PopupMenuPosition.over,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: compact ? 8 : 12,
          vertical: compact ? 4 : 8,
        ),
        decoration: BoxDecoration(
          color: AppColors.primary.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          speedLabel(currentSpeed),
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.w600,
            fontSize: compact ? 12 : 14,
          ),
        ),
      ),
      itemBuilder: (context) => availablePlaybackSpeeds.map((speed) {
        final isSelected = speed == currentSpeed;
        return PopupMenuItem<double>(
          value: speed,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (isSelected)
                const Icon(
                  Icons.check,
                  size: 18,
                  color: AppColors.primary,
                )
              else
                const SizedBox(width: 18),
              const SizedBox(width: 8),
              Text(
                speedLabel(speed),
                style: TextStyle(
                  color: isSelected ? AppColors.primary : null,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

/// Full-screen speed selector dialog
class SpeedSelectorDialog extends StatelessWidget {
  const SpeedSelectorDialog({
    super.key,
    required this.currentSpeed,
    required this.onSpeedChanged,
  });

  final double currentSpeed;
  final ValueChanged<double> onSpeedChanged;

  static Future<double?> show(
    BuildContext context, {
    required double currentSpeed,
  }) {
    return showModalBottomSheet<double>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => SpeedSelectorDialog(
        currentSpeed: currentSpeed,
        onSpeedChanged: (speed) => Navigator.of(context).pop(speed),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Handle bar
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Playback Speed',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            const SizedBox(height: 16),
            // Speed options
            ...availablePlaybackSpeeds.map((speed) {
              final isSelected = speed == currentSpeed;
              return ListTile(
                leading: isSelected
                    ? const Icon(Icons.check, color: AppColors.primary)
                    : const SizedBox(width: 24),
                title: Text(
                  speedLabel(speed),
                  style: TextStyle(
                    color: isSelected ? AppColors.primary : null,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
                trailing: speed == 1.0
                    ? Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          'Normal',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      )
                    : null,
                onTap: () => onSpeedChanged(speed),
              );
            }),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
