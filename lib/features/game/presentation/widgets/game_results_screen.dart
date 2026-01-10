import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/models/game.dart';
import '../../../../core/theme/app_colors.dart';

/// Game results display widget
/// Shows score, tier badge, coins earned, and action buttons
class GameResultsScreen extends StatefulWidget {
  final GameResult result;
  final VoidCallback onContinue;
  final VoidCallback onRetry;
  final VoidCallback onBackToLibrary;

  const GameResultsScreen({
    super.key,
    required this.result,
    required this.onContinue,
    required this.onRetry,
    required this.onBackToLibrary,
  });

  @override
  State<GameResultsScreen> createState() => _GameResultsScreenState();
}

class _GameResultsScreenState extends State<GameResultsScreen>
    with SingleTickerProviderStateMixin {
  /// Tier color constants
  static const Color perfectColor = Color(0xFF8B5CF6); // Purple
  static const Color goodColor = Color(0xFF22C55E); // Green
  static const Color passColor = Color(0xFFF59E0B); // Orange
  static const Color failColor = Color(0xFFEF4444); // Red

  bool _showConfetti = false;

  @override
  void initState() {
    super.initState();
    // Show confetti for non-fail results
    if (widget.result.tier != 'fail') {
      Future.delayed(const Duration(milliseconds: 300), () {
        if (mounted) {
          setState(() => _showConfetti = true);
        }
      });
    }
  }

  TierConfig get _tierConfig {
    switch (widget.result.tier.toLowerCase()) {
      case 'perfect':
        return TierConfig(
          icon: '🏆',
          title: 'Perfect!',
          color: perfectColor,
          message: "Outstanding! You're a vocabulary master!",
        );
      case 'good':
        return TierConfig(
          icon: '⭐',
          title: 'Great Job!',
          color: goodColor,
          message: "Excellent work! You're doing amazing.",
        );
      case 'pass':
        return TierConfig(
          icon: '✓',
          title: 'You Passed!',
          color: passColor,
          message: 'Good job! Keep learning to improve your score.',
        );
      default:
        return TierConfig(
          icon: '😢',
          title: 'Try Again',
          color: failColor,
          message: "Don't give up! Practice makes perfect.",
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final tier = _tierConfig;
    final isPassed = widget.result.tier != 'fail';

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              tier.color.withValues(alpha: 0.1),
              Colors.white,
            ],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              // Confetti animation
              if (_showConfetti) _buildConfetti(),

              // Main content
              SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    const SizedBox(height: 40),

                    // Trophy icon
                    Text(
                      tier.icon,
                      style: const TextStyle(fontSize: 80),
                    )
                        .animate()
                        .scale(
                          begin: const Offset(0, 0),
                          end: const Offset(1, 1),
                          duration: 600.ms,
                          curve: Curves.elasticOut,
                        )
                        .then()
                        .shake(duration: 500.ms),

                    const SizedBox(height: 24),

                    // Title
                    Text(
                      tier.title,
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: tier.color,
                      ),
                    ).animate().fadeIn(duration: 400.ms).slideY(
                          begin: 0.3,
                          end: 0,
                          duration: 400.ms,
                        ),

                    const SizedBox(height: 8),

                    // Score percentage
                    Text(
                      '${widget.result.score}% Correct',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textSecondary,
                      ),
                    ).animate().fadeIn(delay: 200.ms),

                    const SizedBox(height: 32),

                    // Stats card
                    _buildStatsCard().animate().fadeIn(delay: 300.ms).slideY(
                          begin: 0.2,
                          end: 0,
                          delay: 300.ms,
                          duration: 400.ms,
                        ),

                    const SizedBox(height: 16),

                    // Coins earned
                    if (widget.result.coinsEarned > 0)
                      _buildCoinsCard()
                          .animate()
                          .fadeIn(delay: 500.ms)
                          .slideY(
                            begin: 0.2,
                            end: 0,
                            delay: 500.ms,
                            duration: 400.ms,
                          )
                          .then()
                          .shimmer(duration: 1500.ms),

                    const SizedBox(height: 16),

                    // Message
                    Text(
                      tier.message,
                      style: const TextStyle(
                        fontSize: 16,
                        color: AppColors.textSecondary,
                      ),
                      textAlign: TextAlign.center,
                    ).animate().fadeIn(delay: 600.ms),

                    const SizedBox(height: 32),

                    // Action buttons
                    _buildActionButtons(isPassed)
                        .animate()
                        .fadeIn(delay: 700.ms)
                        .slideY(
                          begin: 0.2,
                          end: 0,
                          delay: 700.ms,
                          duration: 400.ms,
                        ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildConfetti() {
    final confettiEmojis = ['🎉', '🎊', '⭐', '✨', '🌟'];
    return Positioned.fill(
      child: IgnorePointer(
        child: Stack(
          children: List.generate(20, (index) {
            final emoji = confettiEmojis[index % confettiEmojis.length];
            final left = (index * 17 + 7) % 100;
            return Positioned(
              left: MediaQuery.of(context).size.width * left / 100,
              top: -50,
              child: Text(
                emoji,
                style: const TextStyle(fontSize: 24),
              )
                  .animate(
                    onComplete: (controller) => controller.repeat(),
                  )
                  .moveY(
                    begin: 0,
                    end: MediaQuery.of(context).size.height + 100,
                    duration: Duration(milliseconds: 2000 + (index % 3) * 500),
                    delay: Duration(milliseconds: (index % 10) * 50),
                  )
                  .rotate(
                    begin: 0,
                    end: 2,
                    duration: Duration(milliseconds: 2000 + (index % 3) * 500),
                  )
                  .fadeOut(
                    delay: Duration(milliseconds: 1500 + (index % 3) * 500),
                  ),
            );
          }),
        ),
      ),
    );
  }

  Widget _buildStatsCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildStatRow(
            'Questions',
            '${widget.result.correctCount}/${widget.result.totalQuestions}',
          ),
          const Divider(height: 24),
          _buildStatRow(
            'Time',
            '${widget.result.timeTaken}s',
          ),
          const Divider(height: 24),
          _buildStatRow(
            'Accuracy',
            '${widget.result.score}%',
          ),
        ],
      ),
    );
  }

  Widget _buildStatRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            color: AppColors.textSecondary,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }

  Widget _buildCoinsCard() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFFEF3C7), // Yellow-50
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFFCD34D), // Yellow-300
          width: 2,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            '🪙',
            style: TextStyle(fontSize: 28),
          ),
          const SizedBox(width: 12),
          Text(
            '+${widget.result.coinsEarned} Coins!',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF92400E), // Yellow-800
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(bool isPassed) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (isPassed)
          ElevatedButton(
            onPressed: widget.onContinue,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 2,
            ),
            child: const Text(
              'Continue',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        else
          ElevatedButton(
            onPressed: widget.onRetry,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 2,
            ),
            child: const Text(
              'Try Again',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        const SizedBox(height: 12),
        OutlinedButton(
          onPressed: widget.onBackToLibrary,
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.textSecondary,
            padding: const EdgeInsets.symmetric(vertical: 16),
            side: const BorderSide(color: AppColors.border),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text(
            'Back to Library',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

/// Tier configuration
class TierConfig {
  final String icon;
  final String title;
  final Color color;
  final String message;

  const TierConfig({
    required this.icon,
    required this.title,
    required this.color,
    required this.message,
  });
}
