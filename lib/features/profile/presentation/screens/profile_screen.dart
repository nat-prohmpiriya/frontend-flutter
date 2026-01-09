import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/providers/user_provider.dart';
import '../../../../core/theme/app_colors.dart';
import '../widgets/general_section.dart';
import '../widgets/preferences_section.dart';
import '../widgets/profile_tabs.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  ProfileTab _activeTab = ProfileTab.general;

  @override
  Widget build(BuildContext context) {
    final userAsync = ref.watch(appUserProvider);

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Text(
                'Profile',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            // Tabs
            ProfileTabs(
              activeTab: _activeTab,
              onTabChange: (tab) => setState(() => _activeTab = tab),
            ),
            // Content
            Expanded(
              child: userAsync.when(
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                error: (error, _) => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        size: 48,
                        color: AppColors.error,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Failed to load profile',
                        style: TextStyle(color: AppColors.textSecondary),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () => ref.invalidate(appUserProvider),
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                ),
                data: (user) {
                  if (user == null) {
                    return const Center(
                      child: Text('Please log in to view your profile'),
                    );
                  }

                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: _activeTab == ProfileTab.general
                        ? GeneralSection(key: const ValueKey('general'), user: user)
                        : const PreferencesSection(key: ValueKey('preferences')),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
