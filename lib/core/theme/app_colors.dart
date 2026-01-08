import 'package:flutter/material.dart';

/// App color palette - matches Next.js TaleLingo theme
class AppColors {
  AppColors._();

  // Primary
  static const primary = Color(0xFF3B82F6); // Brand Blue
  static const secondary = Color(0xFF10B981); // Accent Green

  // Secondary colors
  static const orange = Color(0xFFF59E0B); // Energy
  static const purple = Color(0xFF8B5CF6); // Creativity

  // Neutral - Light mode
  static const textPrimary = Color(0xFF1F2937);
  static const textSecondary = Color(0xFF6B7280);
  static const background = Color(0xFFF3F4F6);
  static const surface = Color(0xFFFFFFFF);
  static const border = Color(0xFFE5E7EB);

  // Neutral - Dark mode
  static const darkBackground = Color(0xFF111827);
  static const darkSurface = Color(0xFF1F2937);
  static const darkTextPrimary = Color(0xFFF9FAFB);
  static const darkTextSecondary = Color(0xFF9CA3AF);
  static const darkBorder = Color(0xFF374151);

  // Feedback
  static const success = Color(0xFF10B981);
  static const error = Color(0xFFEF4444);
  static const warning = Color(0xFFF59E0B);
  static const info = Color(0xFF3B82F6);

  // CEFR Level colors
  static const levelA1 = Color(0xFF10B981); // Beginner - Green
  static const levelA2 = Color(0xFF3B82F6); // Elementary - Blue
  static const levelB1 = Color(0xFFF59E0B); // Intermediate - Orange
  static const levelB2 = Color(0xFF8B5CF6); // Upper Intermediate - Purple
}
