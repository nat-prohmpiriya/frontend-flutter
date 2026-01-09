import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/user.dart';
import '../../../../core/providers/user_provider.dart';
import '../../../../core/theme/app_colors.dart';

class GeneralSection extends ConsumerStatefulWidget {
  final User user;

  const GeneralSection({super.key, required this.user});

  @override
  ConsumerState<GeneralSection> createState() => _GeneralSectionState();
}

class _GeneralSectionState extends ConsumerState<GeneralSection> {
  bool _isLoggingOut = false;

  Future<void> _handleLogout() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Logout', style: TextStyle(color: AppColors.error)),
          ),
        ],
      ),
    );

    if (confirmed == true && mounted) {
      setState(() => _isLoggingOut = true);
      try {
        await ref.read(appUserProvider.notifier).logout();
      } catch (e) {
        if (mounted) {
          setState(() => _isLoggingOut = false);
        }
      }
    }
  }

  Color _getLevelColor(UserLevel level) {
    switch (level) {
      case UserLevel.A1:
        return AppColors.levelA1;
      case UserLevel.A2:
        return AppColors.levelA2;
      case UserLevel.B1:
        return AppColors.levelB1;
      case UserLevel.B2:
        return AppColors.levelB2;
    }
  }

  String _getProviderName(AuthProvider provider) {
    switch (provider) {
      case AuthProvider.google:
        return 'Google';
      case AuthProvider.facebook:
        return 'Facebook';
      case AuthProvider.email:
        return 'Email';
      case AuthProvider.phone:
        return 'Phone';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Profile Card
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                // Avatar with Level Badge
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(
                      radius: 48,
                      backgroundColor: AppColors.primary.withValues(alpha: 0.1),
                      backgroundImage: widget.user.photoURL != null
                          ? NetworkImage(widget.user.photoURL!)
                          : null,
                      child: widget.user.photoURL == null
                          ? const Icon(
                              Icons.person,
                              size: 48,
                              color: AppColors.primary,
                            )
                          : null,
                    ),
                    Positioned(
                      bottom: -8,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: _getLevelColor(widget.user.level),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.1),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Text(
                            widget.user.level.name,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Name
                Text(
                  widget.user.displayName,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8),
                // Info rows
                _InfoRow(
                  icon: Icons.email_outlined,
                  label: widget.user.email,
                ),
                const SizedBox(height: 4),
                _InfoRow(
                  icon: Icons.language,
                  label: 'Native: ${widget.user.nativeLanguage}',
                ),
                const SizedBox(height: 4),
                _InfoRow(
                  icon: Icons.login,
                  label: 'Sign in with ${_getProviderName(widget.user.provider)}',
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Quick Stats
          Row(
            children: [
              Expanded(
                child: _StatCard(
                  icon: Icons.local_fire_department,
                  value: widget.user.streakDays.toString(),
                  label: 'Day Streak',
                  color: AppColors.orange,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _StatCard(
                  icon: Icons.monetization_on,
                  value: widget.user.coins.toString(),
                  label: 'Coins',
                  color: AppColors.secondary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Subscription Badge
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: widget.user.subscription.type == SubscriptionType.premium
                        ? AppColors.orange.withValues(alpha: 0.1)
                        : AppColors.purple.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    widget.user.subscription.type == SubscriptionType.premium
                        ? Icons.workspace_premium
                        : Icons.star_outline,
                    color: widget.user.subscription.type == SubscriptionType.premium
                        ? AppColors.orange
                        : AppColors.purple,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.user.subscription.type == SubscriptionType.premium
                            ? 'Premium'
                            : 'Free Plan',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.user.subscription.type == SubscriptionType.premium
                            ? 'Unlimited access to all features'
                            : '3 stories per week',
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          // Logout Button
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: _isLoggingOut ? null : _handleLogout,
              icon: _isLoggingOut
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.logout, color: AppColors.error),
              label: Text(
                _isLoggingOut ? 'Logging out...' : 'Sign Out',
                style: const TextStyle(color: AppColors.error),
              ),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                side: BorderSide(
                  color: AppColors.error.withValues(alpha: 0.5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;

  const _InfoRow({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 16, color: AppColors.textSecondary),
        const SizedBox(width: 6),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color color;

  const _StatCard({
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
