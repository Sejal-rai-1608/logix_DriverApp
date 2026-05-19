import 'package:flutter/material.dart';
import 'package:drivaer_logixapp/theme/app_colors.dart';

class BackgroundPattern extends StatelessWidget {
  final Widget child;
  const BackgroundPattern({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// TOP RIGHT CIRCLE
        Positioned(
          top: -80,
          right: -80,
          child: Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.yellow2.withOpacity(0.04),
            ),
          ),
        ),
        
        /// BOTTOM LEFT CIRCLE
        Positioned(
          bottom: -100,
          left: -100,
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.yellow2.withOpacity(0.04),
            ),
          ),
        ),

        /// SUBTLE ICONS IN BACKGROUND
        Positioned(
          top: 150,
          left: 40,
          child: Opacity(
            opacity: 0.03,
            child: Icon(Icons.local_shipping_rounded, size: 100, color: AppColors.accent),
          ),
        ),

        Positioned(
          bottom: 200,
          right: 30,
          child: Opacity(
            opacity: 0.03,
            child: Icon(Icons.location_on_rounded, size: 80, color: AppColors.accent),
          ),
        ),

        Positioned(
          top: 400,
          right: -20,
          child: Opacity(
            opacity: 0.03,
            child: Icon(Icons.badge_rounded, size: 120, color: AppColors.accent),
          ),
        ),

        child,
      ],
    );
  }
}
