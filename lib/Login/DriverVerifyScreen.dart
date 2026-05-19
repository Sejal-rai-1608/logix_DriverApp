/// ===============================================
/// FILE:
/// screens/driver_verify_screen.dart
/// ===============================================

import 'package:drivaer_logixapp/widget/background_pattern.dart';
import 'package:drivaer_logixapp/Login/profile_setup_screen.dart';
import 'package:drivaer_logixapp/theme/app_colors.dart';
import 'package:drivaer_logixapp/widget/AuthButton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DriverVerifyScreen extends StatefulWidget {
  const DriverVerifyScreen({super.key});

  @override
  State<DriverVerifyScreen> createState() => _DriverVerifyScreenState();
}

class _DriverVerifyScreenState extends State<DriverVerifyScreen>
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

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.05),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

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
                          border: Border.all(
                            color: AppColors.border,
                            width: 1.5,
                          ),
                        ),
                        child: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: 20,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Text(
                      "Verification",
                      style: GoogleFonts.poppins(
                        fontSize: 32,
                        fontWeight: FontWeight.w800,
                        color: AppColors.accent,
                      ),
                    ),
                    const SizedBox(height: 12),
                    RichText(
                      text: TextSpan(
                        text: "We've sent a 6-digit code to ",
                        style: GoogleFonts.poppins(
                          color: AppColors.textGrey,
                          fontSize: 15,
                          height: 1.5,
                        ),
                        children: [
                          TextSpan(
                            text: "+91 98765 43210",
                            style: GoogleFonts.poppins(
                              color: AppColors.accent,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 48),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        6,
                        (index) => _otpBox(index == 0),
                      ),
                    ),
                    const SizedBox(height: 32),
                    Center(
                      child: TextButton(
                        onPressed: () {},
                        child: RichText(
                          text: TextSpan(
                            text: "Didn't receive code? ",
                            style: GoogleFonts.poppins(
                              color: AppColors.textGrey,
                              fontSize: 14,
                            ),
                            children: [
                              TextSpan(
                                text: "Resend",
                                style: GoogleFonts.poppins(
                                  color: AppColors.yellow2,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    AuthButton(
                      title: "Verify Now",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const DriverProfileSetupScreen(),
                          ),
                        );
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

  Widget _otpBox(bool isFocused) {
    return Container(
      width: 50,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isFocused ? AppColors.yellow2 : AppColors.border,
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: TextField(
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          maxLength: 1,
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: AppColors.accent,
          ),
          decoration: const InputDecoration(
            counterText: "",
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
