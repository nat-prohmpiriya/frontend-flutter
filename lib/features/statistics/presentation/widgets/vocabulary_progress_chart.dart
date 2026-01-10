import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../core/models/statistics.dart';
import '../../../../core/theme/app_colors.dart';

/// Pie/Bar chart for vocabulary progress
class VocabularyProgressChart extends StatefulWidget {
  final VocabularyStats stats;

  const VocabularyProgressChart({
    super.key,
    required this.stats,
  });

  @override
  State<VocabularyProgressChart> createState() =>
      _VocabularyProgressChartState();
}

class _VocabularyProgressChartState extends State<VocabularyProgressChart> {
  bool _showByStatus = true;
  int _touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with toggle
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.pie_chart,
                    color: AppColors.purple,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Vocabulary Progress',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
              // Toggle buttons
              Container(
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    _ToggleButton(
                      label: 'Status',
                      isSelected: _showByStatus,
                      onTap: () => setState(() => _showByStatus = true),
                    ),
                    _ToggleButton(
                      label: 'Level',
                      isSelected: !_showByStatus,
                      onTap: () => setState(() => _showByStatus = false),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          // Chart
          SizedBox(
            height: 200,
            child: Row(
              children: [
                // Pie chart
                Expanded(
                  flex: 3,
                  child: _buildPieChart(),
                ),
                const SizedBox(width: 16),
                // Legend
                Expanded(
                  flex: 2,
                  child: _buildLegend(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPieChart() {
    final sections = _showByStatus
        ? _buildStatusSections()
        : _buildLevelSections();

    if (sections.isEmpty ||
        sections.every((s) => s.value == 0)) {
      return const Center(
        child: Text(
          'No vocabulary data yet',
          style: TextStyle(color: AppColors.textSecondary),
        ),
      );
    }

    return PieChart(
      PieChartData(
        pieTouchData: PieTouchData(
          touchCallback: (FlTouchEvent event, pieTouchResponse) {
            setState(() {
              if (!event.isInterestedForInteractions ||
                  pieTouchResponse == null ||
                  pieTouchResponse.touchedSection == null) {
                _touchedIndex = -1;
                return;
              }
              _touchedIndex =
                  pieTouchResponse.touchedSection!.touchedSectionIndex;
            });
          },
        ),
        borderData: FlBorderData(show: false),
        sectionsSpace: 2,
        centerSpaceRadius: 40,
        sections: sections,
      ),
    );
  }

  List<PieChartSectionData> _buildStatusSections() {
    final data = [
      (
        value: widget.stats.learning.toDouble(),
        color: AppColors.orange,
        title: 'Learning',
      ),
      (
        value: widget.stats.learned.toDouble(),
        color: AppColors.secondary,
        title: 'Learned',
      ),
      (
        value: widget.stats.difficult.toDouble(),
        color: AppColors.error,
        title: 'Difficult',
      ),
    ];

    return data.asMap().entries.map((entry) {
      final isTouched = entry.key == _touchedIndex;
      final radius = isTouched ? 60.0 : 50.0;
      final fontSize = isTouched ? 14.0 : 12.0;

      return PieChartSectionData(
        color: entry.value.color,
        value: entry.value.value,
        title: entry.value.value > 0 ? '${entry.value.value.toInt()}' : '',
        radius: radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        badgeWidget: isTouched
            ? _Badge(
                entry.value.title,
                color: entry.value.color,
              )
            : null,
        badgePositionPercentageOffset: 1.5,
      );
    }).toList();
  }

  List<PieChartSectionData> _buildLevelSections() {
    final data = [
      (
        value: widget.stats.a1Words.toDouble(),
        color: AppColors.levelA1,
        title: 'A1',
      ),
      (
        value: widget.stats.a2Words.toDouble(),
        color: AppColors.levelA2,
        title: 'A2',
      ),
      (
        value: widget.stats.b1Words.toDouble(),
        color: AppColors.levelB1,
        title: 'B1',
      ),
      (
        value: widget.stats.b2Words.toDouble(),
        color: AppColors.levelB2,
        title: 'B2',
      ),
    ];

    return data.asMap().entries.map((entry) {
      final isTouched = entry.key == _touchedIndex;
      final radius = isTouched ? 60.0 : 50.0;
      final fontSize = isTouched ? 14.0 : 12.0;

      return PieChartSectionData(
        color: entry.value.color,
        value: entry.value.value,
        title: entry.value.value > 0 ? '${entry.value.value.toInt()}' : '',
        radius: radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        badgeWidget: isTouched
            ? _Badge(
                entry.value.title,
                color: entry.value.color,
              )
            : null,
        badgePositionPercentageOffset: 1.5,
      );
    }).toList();
  }

  Widget _buildLegend() {
    if (_showByStatus) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _LegendItem(
            color: AppColors.orange,
            label: 'Learning',
            value: widget.stats.learning,
          ),
          const SizedBox(height: 12),
          _LegendItem(
            color: AppColors.secondary,
            label: 'Learned',
            value: widget.stats.learned,
          ),
          const SizedBox(height: 12),
          _LegendItem(
            color: AppColors.error,
            label: 'Difficult',
            value: widget.stats.difficult,
          ),
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _LegendItem(
            color: AppColors.levelA1,
            label: 'A1 (Beginner)',
            value: widget.stats.a1Words,
          ),
          const SizedBox(height: 10),
          _LegendItem(
            color: AppColors.levelA2,
            label: 'A2 (Elementary)',
            value: widget.stats.a2Words,
          ),
          const SizedBox(height: 10),
          _LegendItem(
            color: AppColors.levelB1,
            label: 'B1 (Intermediate)',
            value: widget.stats.b1Words,
          ),
          const SizedBox(height: 10),
          _LegendItem(
            color: AppColors.levelB2,
            label: 'B2 (Upper Int.)',
            value: widget.stats.b2Words,
          ),
        ],
      );
    }
  }
}

class _Badge extends StatelessWidget {
  final String text;
  final Color color;

  const _Badge(this.text, {required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.4),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 10,
        ),
      ),
    );
  }
}

class _ToggleButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _ToggleButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.purple : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.white : AppColors.textSecondary,
          ),
        ),
      ),
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;
  final int value;

  const _LegendItem({
    required this.color,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              color: AppColors.textSecondary,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          '$value',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }
}
