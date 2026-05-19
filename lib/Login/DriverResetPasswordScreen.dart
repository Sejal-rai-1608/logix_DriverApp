/// ===============================================
/// FILE:
/// screens/driver_reset_password_screen.dart
/// ===============================================

import 'package:drivaer_logixapp/widget/background_pattern.dart';
import 'package:drivaer_logixapp/theme/app_colors.dart';
import 'package:drivaer_logixapp/widget/AuthButton.dart';
import 'package:drivaer_logixapp/widget/AuthTextField.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DriverResetPasswordScreen extends StatefulWidget {
  const DriverResetPasswordScreen({super.key});

  @override
  State<DriverResetPasswordScreen> createState() => _DriverResetPasswordScreenState();
}

class _DriverResetPasswordScreenState extends State<DriverResetPasswordScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _slideAnimation = Tween<Offset>(begin: const Offset(0, 0.05), end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: BackgroundPattern(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: SlideTransition(
                  position: _slideAnimation,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: AppColors.border, width: 1.5),
                          ),
                          child: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
                        ),
                      ),
                      const SizedBox(height: 40),
                      Text(
                        "Reset Password",
                        style: GoogleFonts.poppins(
                          fontSize: 32,
                          fontWeight: FontWeight.w800,
                          color: AppColors.accent,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        "Please create a strong new password to secure your account.",
                        style: GoogleFonts.poppins(
                          color: AppColors.textGrey,
                          fontSize: 15,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 48),
                      const AuthTextField(
                        hint: "New Password",
                        icon: Icons.lock_outline_rounded,
                        isPassword: true,
                      ),
                      const AuthTextField(
                        hint: "Confirm Password",
                        icon: Icons.lock_reset_rounded,
                        isPassword: true,
                      ),
                      const Spacer(),
                      AuthButton(
                        title: "Update Password",
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }
}