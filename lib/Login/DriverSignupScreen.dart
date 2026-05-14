/// ===============================================
/// FILE:
/// screens/driver_signup_screen.dart
/// ===============================================

import 'package:drivaer_logixapp/widget/AuthButton.dart';
import 'package:drivaer_logixapp/widget/AuthTextField.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Login/DriverLoginScreen.dart';

class DriverSignupScreen extends StatefulWidget {
  const DriverSignupScreen({super.key});

  @override
  State<DriverSignupScreen> createState() => _DriverSignupScreenState();
}

class _DriverSignupScreenState extends State<DriverSignupScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  late Animation<double> fadeAnimation;

  late Animation<Offset> slideAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    /// FADE
    fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));

    /// SLIDE
    slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.15),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOutCubic));

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFDF6),

      body: SafeArea(
        child: FadeTransition(
          opacity: fadeAnimation,

          child: SlideTransition(
            position: slideAnimation,

            child: SingleChildScrollView(
              child: Column(
                children: [
                  /// =================================
                  /// TOP SECTION
                  /// =================================
                  Container(
                    width: double.infinity,

                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,

                        end: Alignment.bottomRight,

                        colors: [
                          Color(0xffFFF4C7),

                          Color(0xffFFE082),

                          Color(0xffFFF8DD),
                        ],
                      ),

                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),

                        bottomRight: Radius.circular(40),
                      ),
                    ),

                    child: Stack(
                      children: [
                        /// BG CIRCLE
                        Positioned(
                          top: -50,
                          right: -50,

                          child: Container(
                            width: 180,
                            height: 180,

                            decoration: BoxDecoration(
                              shape: BoxShape.circle,

                              color: Colors.white.withOpacity(0.15),
                            ),
                          ),
                        ),

                        Positioned(
                          top: 90,
                          left: -30,

                          child: Container(
                            width: 120,
                            height: 120,

                            decoration: BoxDecoration(
                              shape: BoxShape.circle,

                              color: Colors.white.withOpacity(0.12),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(
                            left: 24,
                            right: 24,
                            top: 20,
                            bottom: 30,
                          ),

                          child: Column(
                            children: [
                              /// APPBAR
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,

                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },

                                    child: Container(
                                      width: 48,
                                      height: 48,

                                      decoration: BoxDecoration(
                                        color: Colors.white,

                                        borderRadius: BorderRadius.circular(16),
                                      ),

                                      child: const Icon(
                                        Icons.arrow_back_ios_new_rounded,
                                      ),
                                    ),
                                  ),

                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 14,
                                      vertical: 10,
                                    ),

                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.85),

                                      borderRadius: BorderRadius.circular(18),
                                    ),

                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.verified_user_rounded,

                                          color: Color(0xffF7B500),

                                          size: 18,
                                        ),

                                        const SizedBox(width: 6),

                                        Text(
                                          "DriverX",

                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w700,

                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 20),

                              /// IMAGE
                              Hero(
                                tag: "signup_image",

                                child: Image.asset(
                                  "assets/screen/signup.png",

                                  height: 310,

                                  fit: BoxFit.contain,
                                ),
                              ),

                              const SizedBox(height: 10),

                              /// TITLE
                              Text(
                                "Create Driver Account",

                                textAlign: TextAlign.center,

                                style: GoogleFonts.poppins(
                                  fontSize: 30,

                                  fontWeight: FontWeight.w700,
                                ),
                              ),

                              const SizedBox(height: 10),

                              /// SUBTITLE
                              Text(
                                "Join DriverX and start earning\nwith smart deliveries.",

                                textAlign: TextAlign.center,

                                style: GoogleFonts.poppins(
                                  fontSize: 15,

                                  height: 1.7,

                                  color: Colors.grey.shade700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// =================================
                  /// FORM SECTION
                  /// =================================
                  Padding(
                    padding: const EdgeInsets.all(24),

                    child: Column(
                      children: [
                        const AuthTextField(
                          hint: "Full Name",

                          icon: Icons.person_outline_rounded,
                        ),

                        const AuthTextField(
                          hint: "Phone Number",

                          icon: Icons.call_outlined,
                        ),

                        const AuthTextField(
                          hint: "Email Address",

                          icon: Icons.email_outlined,
                        ),

                        const AuthTextField(
                          hint: "Password",

                          icon: Icons.lock_outline_rounded,

                          isPassword: true,
                        ),

                        const SizedBox(height: 8),

                        /// TERMS
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            const Icon(
                              Icons.check_circle_rounded,

                              color: Color(0xffF7B500),

                              size: 22,
                            ),

                            const SizedBox(width: 10),

                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  text: "By continuing you agree to our ",

                                  style: GoogleFonts.poppins(
                                    fontSize: 13,

                                    height: 1.6,

                                    color: Colors.grey.shade600,
                                  ),

                                  children: [
                                    TextSpan(
                                      text: "Terms & Conditions",

                                      style: GoogleFonts.poppins(
                                        color: const Color(0xffF7B500),

                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 28),

                        /// BUTTON
                        AuthButton(
                          title: "Create Account",

                          onTap: () {
                            Navigator.push(
                              context,

                              MaterialPageRoute(
                                builder: (_) => const DriverLoginScreen(),
                              ),
                            );
                          },
                        ),

                        const SizedBox(height: 28),

                        /// DIVIDER
                        Row(
                          children: [
                            Expanded(
                              child: Divider(color: Colors.grey.shade300),
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                              ),

                              child: Text(
                                "Or continue with",

                                style: GoogleFonts.poppins(
                                  fontSize: 13,

                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ),

                            Expanded(
                              child: Divider(color: Colors.grey.shade300),
                            ),
                          ],
                        ),

                        const SizedBox(height: 24),

                        /// SOCIAL
                        Row(
                          children: [
                            socialButton(
                              icon: Icons.g_mobiledata_rounded,

                              title: "Google",
                            ),

                            const SizedBox(width: 16),

                            socialButton(
                              icon: Icons.apple_rounded,

                              title: "Apple",
                            ),
                          ],
                        ),

                        const SizedBox(height: 30),

                        /// LOGIN
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,

                              MaterialPageRoute(
                                builder: (_) => const DriverLoginScreen(),
                              ),
                            );
                          },

                          child: RichText(
                            text: TextSpan(
                              text: "Already have an account? ",

                              style: GoogleFonts.poppins(color: Colors.grey),

                              children: [
                                TextSpan(
                                  text: "Login",

                                  style: GoogleFonts.poppins(
                                    color: const Color(0xffF7B500),

                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// =================================
  /// SOCIAL BUTTON
  /// =================================
  Widget socialButton({required IconData icon, required String title}) {
    return Expanded(
      child: Container(
        height: 58,

        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius: BorderRadius.circular(18),

          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10),
          ],
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Icon(icon, size: 30),

            const SizedBox(width: 8),

            Text(
              title,

              style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
