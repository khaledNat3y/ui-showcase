import 'package:flutter/material.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_theme.dart';

class ToggleButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const ToggleButton({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
          boxShadow: isSelected
              ? const [BoxShadow(color: AppColors.primaryColor, blurRadius: 4)]
              : null,
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: AppTheme.font12WhiteExtraBold.copyWith(
            color: isSelected ? Colors.white : AppColors.textColor,
          ),
        ),
      ),
    );
  }
}
