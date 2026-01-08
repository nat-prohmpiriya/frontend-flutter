import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/auth/auth_provider.dart';
import '../../../../core/theme/app_colors.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('TaleLingo'),
        actions: [
          IconButton(
            icon: CircleAvatar(
              radius: 16,
              backgroundImage: user?.photoURL != null
                  ? NetworkImage(user!.photoURL!)
                  : null,
              child: user?.photoURL == null
                  ? const Icon(Icons.person, size: 20)
                  : null,
            ),
            onPressed: () {
              // TODO: Navigate to profile
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome message
              Text(
                'Welcome back,',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.textSecondary,
                    ),
              ),
              Text(
                user?.displayName ?? 'Learner',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 24),
              // Mode selection cards
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: [
                    _ModeCard(
                      icon: Icons.auto_stories,
                      title: 'Stories',
                      subtitle: 'Read & Learn',
                      color: AppColors.primary,
                      onTap: () {
                        // TODO: Navigate to library
                      },
                    ),
                    _ModeCard(
                      icon: Icons.flash_on,
                      title: 'Quick Read',
                      subtitle: 'Short stories',
                      color: AppColors.orange,
                      onTap: () {
                        // TODO: Navigate to for-you
                      },
                    ),
                    _ModeCard(
                      icon: Icons.spellcheck,
                      title: 'Vocabulary',
                      subtitle: 'Review words',
                      color: AppColors.secondary,
                      onTap: () {
                        // TODO: Navigate to vocabulary
                      },
                    ),
                    _ModeCard(
                      icon: Icons.bar_chart,
                      title: 'Statistics',
                      subtitle: 'Track progress',
                      color: AppColors.purple,
                      onTap: () {
                        // TODO: Navigate to statistics
                      },
                    ),
                  ],
                ),
              ),
              // Logout button (temporary for testing)
              Center(
                child: TextButton.icon(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                  },
                  icon: const Icon(Icons.logout),
                  label: const Text('Sign Out'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ModeCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  const _ModeCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color, size: 28),
              ),
              const Spacer(),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.textSecondary,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
