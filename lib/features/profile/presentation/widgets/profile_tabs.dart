import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

enum ProfileTab { general, preferences }

class ProfileTabs extends StatelessWidget {
  final ProfileTab activeTab;
  final ValueChanged<ProfileTab> onTabChange;

  const ProfileTabs({
    super.key,
    required this.activeTab,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    final tabs = [
      (ProfileTab.general, 'General', Icons.person_outline),
      (ProfileTab.preferences, 'Preferences', Icons.settings_outlined),
    ];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: tabs.map((tab) {
          final isActive = activeTab == tab.$1;
          return Expanded(
            child: GestureDetector(
              onTap: () => onTabChange(tab.$1),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: isActive ? AppColors.primary : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      tab.$3,
                      size: 20,
                      color: isActive ? Colors.white : AppColors.textSecondary,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      tab.$2,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: isActive ? Colors.white : AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
