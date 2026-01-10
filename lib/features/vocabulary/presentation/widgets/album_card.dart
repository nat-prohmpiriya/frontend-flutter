import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/models/vocabulary.dart';

/// Album card with name, word count, preview, and action buttons
class AlbumCard extends StatelessWidget {
  final VocabularyAlbum album;
  final bool isDark;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final VoidCallback? onPlay;

  const AlbumCard({
    super.key,
    required this.album,
    required this.isDark,
    this.onEdit,
    this.onDelete,
    this.onPlay,
  });

  /// Get icon for album based on name or default
  IconData _getAlbumIcon() {
    final name = album.name.toLowerCase();
    if (name.contains('travel')) return Icons.flight;
    if (name.contains('business')) return Icons.business;
    if (name.contains('food')) return Icons.restaurant;
    if (name.contains('sport')) return Icons.sports;
    if (name.contains('music')) return Icons.music_note;
    if (name.contains('movie') || name.contains('film')) return Icons.movie;
    if (name.contains('book') || name.contains('read')) return Icons.book;
    if (name.contains('school') || name.contains('study')) return Icons.school;
    if (name.contains('work')) return Icons.work;
    if (name.contains('home')) return Icons.home;
    return Icons.folder;
  }

  /// Get color for album
  Color _getAlbumColor() {
    // Use a hash of the album name to generate consistent colors
    final colors = [
      AppColors.primary,
      AppColors.secondary,
      AppColors.orange,
      AppColors.purple,
      const Color(0xFFEC4899), // Pink
      const Color(0xFF14B8A6), // Teal
    ];
    return colors[album.name.hashCode.abs() % colors.length];
  }

  void _showOptionsMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkSurface : AppColors.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Handle bar
              Container(
                margin: const EdgeInsets.only(top: 12),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: isDark ? AppColors.darkBorder : AppColors.border,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 16),
              // Album title
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  album.name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: isDark
                        ? AppColors.darkTextPrimary
                        : AppColors.textPrimary,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Options
              if (album.wordIds.isNotEmpty)
                _buildOptionItem(
                  context: context,
                  icon: Icons.headphones,
                  label: 'Practice Words',
                  onTap: () {
                    Navigator.pop(context);
                    onPlay?.call();
                  },
                ),
              _buildOptionItem(
                context: context,
                icon: Icons.edit_outlined,
                label: 'Edit Album',
                onTap: () {
                  Navigator.pop(context);
                  onEdit?.call();
                },
              ),
              _buildOptionItem(
                context: context,
                icon: Icons.delete_outline,
                label: 'Delete Album',
                onTap: () {
                  Navigator.pop(context);
                  _showDeleteConfirmation(context);
                },
                isDestructive: true,
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionItem({
    required BuildContext context,
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    bool isDestructive = false,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Icon(
              icon,
              size: 24,
              color: isDestructive
                  ? AppColors.error
                  : (isDark
                      ? AppColors.darkTextSecondary
                      : AppColors.textSecondary),
            ),
            const SizedBox(width: 12),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                color: isDestructive
                    ? AppColors.error
                    : (isDark
                        ? AppColors.darkTextPrimary
                        : AppColors.textPrimary),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: isDark ? AppColors.darkSurface : AppColors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Text(
          'Delete Album?',
          style: TextStyle(
            color: isDark ? AppColors.darkTextPrimary : AppColors.textPrimary,
          ),
        ),
        content: Text(
          'Are you sure you want to delete "${album.name}"? The words in this album will not be deleted from your saved words.',
          style: TextStyle(
            color:
                isDark ? AppColors.darkTextSecondary : AppColors.textSecondary,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancel',
              style: TextStyle(
                color: isDark
                    ? AppColors.darkTextSecondary
                    : AppColors.textSecondary,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              onDelete?.call();
            },
            child: const Text(
              'Delete',
              style: TextStyle(color: AppColors.error),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final albumColor = _getAlbumColor();
    final albumIcon = _getAlbumIcon();
    final wordCount = album.wordIds.length;

    return GestureDetector(
      onTap: () => context.push('/vocabulary/album/${album.id}'),
      onLongPress: () => _showOptionsMenu(context),
      child: Container(
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkSurface : AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon with background
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: albumColor.withValues(alpha: 0.1),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: albumColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(
                      albumIcon,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Menu button
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () => _showOptionsMenu(context),
                      icon: Icon(
                        Icons.more_vert,
                        color: isDark
                            ? AppColors.darkTextSecondary
                            : AppColors.textSecondary,
                        size: 20,
                      ),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ),
                ],
              ),
            ),
            // Album info
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Album name
                  Text(
                    album.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: isDark
                          ? AppColors.darkTextPrimary
                          : AppColors.textPrimary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  // Description
                  if (album.description != null && album.description!.isNotEmpty)
                    Text(
                      album.description!,
                      style: TextStyle(
                        fontSize: 12,
                        color: isDark
                            ? AppColors.darkTextSecondary
                            : AppColors.textSecondary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  const SizedBox(height: 8),
                  // Word count
                  Row(
                    children: [
                      Icon(
                        Icons.library_books_outlined,
                        size: 14,
                        color: isDark
                            ? AppColors.darkTextSecondary
                            : AppColors.textSecondary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '$wordCount ${wordCount == 1 ? 'word' : 'words'}',
                        style: TextStyle(
                          fontSize: 12,
                          color: isDark
                              ? AppColors.darkTextSecondary
                              : AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                  // Practice button
                  if (wordCount > 0) ...[
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          if (onPlay != null) {
                            onPlay!();
                          } else {
                            context.push('/vocabulary/album/${album.id}/practice');
                          }
                        },
                        icon: const Icon(Icons.headphones, size: 16),
                        label: const Text('Practice'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: albumColor,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          textStyle: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
