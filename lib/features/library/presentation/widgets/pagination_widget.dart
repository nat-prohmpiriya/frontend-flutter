import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

/// Pagination widget with page numbers and navigation buttons
class PaginationWidget extends StatelessWidget {
  const PaginationWidget({
    required this.currentPage,
    required this.totalPages,
    required this.onPageChange,
    this.showingFrom,
    this.showingTo,
    this.totalItems,
  });

  final int currentPage;
  final int totalPages;
  final void Function(int page) onPageChange;
  final int? showingFrom;
  final int? showingTo;
  final int? totalItems;

  List<Object> _getPageNumbers() {
    final pages = <Object>[];
    const maxVisible = 5;

    if (totalPages <= maxVisible + 2) {
      // Show all pages if total is small
      for (int i = 1; i <= totalPages; i++) {
        pages.add(i);
      }
    } else {
      // Always show first page
      pages.add(1);

      if (currentPage > 3) {
        pages.add('...');
      }

      // Show pages around current
      final start = 2 > currentPage - 1 ? 2 : currentPage - 1;
      final end = totalPages - 1 < currentPage + 1 ? totalPages - 1 : currentPage + 1;

      for (int i = start; i <= end; i++) {
        pages.add(i);
      }

      if (currentPage < totalPages - 2) {
        pages.add('...');
      }

      // Always show last page
      pages.add(totalPages);
    }

    return pages;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    if (totalPages <= 1) {
      return const SizedBox.shrink();
    }

    final pageNumbers = _getPageNumbers();

    return Column(
      children: [
        // Showing info
        if (showingFrom != null && showingTo != null && totalItems != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
              'Showing $showingFrom-$showingTo of $totalItems',
              style: TextStyle(
                color: isDark
                    ? AppColors.darkTextSecondary
                    : AppColors.textSecondary,
                fontSize: 14,
              ),
            ),
          ),

        // Pagination controls
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Previous button
            _PageButton(
              icon: Icons.chevron_left,
              label: 'Previous',
              onPressed: currentPage > 1 ? () => onPageChange(currentPage - 1) : null,
              isDark: isDark,
            ),

            const SizedBox(width: 8),

            // Page numbers
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: pageNumbers.map((page) {
                    if (page == '...') {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Text(
                          '...',
                          style: TextStyle(
                            color: isDark
                                ? AppColors.darkTextSecondary
                                : AppColors.textSecondary,
                            fontSize: 14,
                          ),
                        ),
                      );
                    }

                    final pageNum = page as int;
                    final isSelected = currentPage == pageNum;

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: _PageNumberButton(
                        page: pageNum,
                        isSelected: isSelected,
                        onPressed: () => onPageChange(pageNum),
                        isDark: isDark,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),

            const SizedBox(width: 8),

            // Next button
            _PageButton(
              icon: Icons.chevron_right,
              label: 'Next',
              isIconTrailing: true,
              onPressed: currentPage < totalPages ? () => onPageChange(currentPage + 1) : null,
              isDark: isDark,
            ),
          ],
        ),
      ],
    );
  }
}

class _PageButton extends StatelessWidget {
  const _PageButton({
    required this.icon,
    required this.label,
    required this.onPressed,
    this.isIconTrailing = false,
    required this.isDark,
  });

  final IconData icon;
  final String label;
  final VoidCallback? onPressed;
  final bool isIconTrailing;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    final isEnabled = onPressed != null;

    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isEnabled
              ? (isDark ? AppColors.darkSurface : AppColors.surface)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isEnabled
                ? (isDark ? AppColors.darkBorder : AppColors.border)
                : Colors.transparent,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!isIconTrailing) Icon(icon, size: 18, color: _getColor(isEnabled)),
            if (!isIconTrailing) const SizedBox(width: 4),
            Text(
              label,
              style: TextStyle(
                color: _getColor(isEnabled),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            if (isIconTrailing) const SizedBox(width: 4),
            if (isIconTrailing) Icon(icon, size: 18, color: _getColor(isEnabled)),
          ],
        ),
      ),
    );
  }

  Color _getColor(bool isEnabled) {
    if (!isEnabled) {
      return AppColors.textSecondary.withValues(alpha: 0.4);
    }
    return isDark ? AppColors.darkTextPrimary : AppColors.textPrimary;
  }
}

class _PageNumberButton extends StatelessWidget {
  const _PageNumberButton({
    required this.page,
    required this.isSelected,
    required this.onPressed,
    required this.isDark,
  });

  final int page;
  final bool isSelected;
  final VoidCallback onPressed;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        constraints: const BoxConstraints(minWidth: 40),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          '$page',
          style: TextStyle(
            color: isSelected ? Colors.white : (isDark ? AppColors.darkTextPrimary : AppColors.textPrimary),
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
