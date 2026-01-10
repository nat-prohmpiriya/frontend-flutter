import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../core/models/statistics.dart';
import '../../../../core/theme/app_colors.dart';

/// Line/Bar chart showing reading activity over time
class ReadingProgressChart extends StatefulWidget {
  final List<DailyActivity> weeklyData;
  final List<DailyActivity> monthlyData;

  const ReadingProgressChart({
    super.key,
    required this.weeklyData,
    required this.monthlyData,
  });

  @override
  State<ReadingProgressChart> createState() => _ReadingProgressChartState();
}

class _ReadingProgressChartState extends State<ReadingProgressChart> {
  bool _showWeekly = true;

  List<DailyActivity> get _data =>
      _showWeekly ? widget.weeklyData : widget.monthlyData;

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
                    Icons.auto_graph,
                    color: AppColors.primary,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Reading Activity',
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
                      label: 'Week',
                      isSelected: _showWeekly,
                      onTap: () => setState(() => _showWeekly = true),
                    ),
                    _ToggleButton(
                      label: 'Month',
                      isSelected: !_showWeekly,
                      onTap: () => setState(() => _showWeekly = false),
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
            child: _data.isEmpty
                ? const Center(
                    child: Text(
                      'No activity data yet',
                      style: TextStyle(color: AppColors.textSecondary),
                    ),
                  )
                : _buildChart(),
          ),
          const SizedBox(height: 16),
          // Legend
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _LegendItem(
                color: AppColors.primary,
                label: 'Pages Read',
              ),
              const SizedBox(width: 24),
              _LegendItem(
                color: AppColors.secondary,
                label: 'Minutes',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChart() {
    final maxPagesRead = _data
        .map((e) => e.pagesRead.toDouble())
        .reduce((a, b) => a > b ? a : b);
    final maxMinutes = _data
        .map((e) => e.minutesSpent.toDouble())
        .reduce((a, b) => a > b ? a : b);
    final maxY = (maxPagesRead > maxMinutes ? maxPagesRead : maxMinutes) * 1.2;

    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: maxY < 10 ? 10 : maxY,
        barTouchData: BarTouchData(
          enabled: true,
          touchTooltipData: BarTouchTooltipData(
            getTooltipColor: (_) => AppColors.textPrimary,
            tooltipRoundedRadius: 8,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              final activity = _data[group.x.toInt()];
              final label = rodIndex == 0 ? 'Pages' : 'Minutes';
              final value =
                  rodIndex == 0 ? activity.pagesRead : activity.minutesSpent;
              return BarTooltipItem(
                '$label: $value',
                const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              );
            },
          ),
        ),
        titlesData: FlTitlesData(
          show: true,
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                final index = value.toInt();
                if (index < 0 || index >= _data.length) {
                  return const SizedBox.shrink();
                }

                String label;
                if (_showWeekly) {
                  final weekDays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
                  final dayIndex = _data[index].date.weekday - 1;
                  label = weekDays[dayIndex];
                } else {
                  // Show every 5th day for monthly view
                  if (index % 5 != 0 && index != _data.length - 1) {
                    return const SizedBox.shrink();
                  }
                  label = '${_data[index].date.day}';
                }

                return Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    label,
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              },
              reservedSize: 28,
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 32,
              interval: maxY / 4,
              getTitlesWidget: (value, meta) {
                return Text(
                  value.toInt().toString(),
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 10,
                  ),
                );
              },
            ),
          ),
        ),
        borderData: FlBorderData(show: false),
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          horizontalInterval: maxY / 4,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: AppColors.border,
              strokeWidth: 1,
              dashArray: [5, 5],
            );
          },
        ),
        barGroups: _data.asMap().entries.map((entry) {
          final index = entry.key;
          final activity = entry.value;
          return BarChartGroupData(
            x: index,
            barRods: [
              BarChartRodData(
                toY: activity.pagesRead.toDouble(),
                color: AppColors.primary,
                width: _showWeekly ? 12 : 6,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(4),
                ),
              ),
              BarChartRodData(
                toY: activity.minutesSpent.toDouble(),
                color: AppColors.secondary,
                width: _showWeekly ? 12 : 6,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(4),
                ),
              ),
            ],
          );
        }).toList(),
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
          color: isSelected ? AppColors.primary : Colors.transparent,
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

  const _LegendItem({
    required this.color,
    required this.label,
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
        const SizedBox(width: 6),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
