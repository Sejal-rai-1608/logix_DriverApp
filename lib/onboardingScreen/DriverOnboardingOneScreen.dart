import 'package:drivaer_logixapp/onboardingScreen/DriverOnboardingTwoScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:drivaer_logixapp/theme/app_colors.dart';
class DriverOnboardingOneScreen extends StatelessWidget {
  const DriverOnboardingOneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),

          child: Column(
            children: [
              /// TOP SPACE
              const SizedBox(height: 12),

              /// =========================
              /// IMAGE SECTION
              /// =========================
              Expanded(
                child: Stack(
                  alignment: Alignment.center,

                  children: [
                    /// PHONE IMAGE
                    Positioned(
                      width: 560,
                      bottom: 40,

                      child: Image.asset(
                        "assets/screen/van.png",

                        width: 320,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),

              /// =========================
              /// TITLE
              /// =========================
              Text(
                "Welcome to DriverX",

                textAlign: TextAlign.center,

                style: GoogleFonts.poppins(
                  fontSize: 34,

                  fontWeight: FontWeight.w700,

                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 18),

              /// SUBTITLE
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),

                child: Text(
                  "Join thousands of drivers earning\non their own terms.",

                  textAlign: TextAlign.center,

                  style: GoogleFonts.poppins(
                    fontSize: 17,

                    height: 1.8,

                    color: Colors.grey.shade600,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              /// =========================
              /// INDICATOR
              /// =========================
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  activeDot(),

                  const SizedBox(width: 10),

                  inactiveDot(),

                  const SizedBox(width: 10),

                  inactiveDot(),
                ],
              ),

              const SizedBox(height: 42),

              /// =========================
              /// BUTTON
              /// =========================
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DriverOnboardingTwoScreen(),
                    ),
                  );

                  /// NAVIGATION
                },

                child: Container(
                  width: double.infinity,
                  height: 62,

                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xffFFD84D), Color(0xffF7B500)],
                    ),

                    borderRadius: BorderRadius.circular(22),

                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xffF7B500).withOpacity(0.35),

                        blurRadius: 18,

                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),

                  child: Center(
                    child: Text(
                      "Next",

                      style: GoogleFonts.poppins(
                        fontSize: 20,

                        fontWeight: FontWeight.w700,

                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 18),
            ],
          ),
        ),
      ),
    );
  }

  /// =========================
  /// ACTIVE DOT
  /// =========================
  Widget activeDot() {
    return Container(
      width: 28,
      height: 10,

      decoration: BoxDecoration(
        color: const Color(0xffF7B500),

        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  /// =========================
  /// INACTIVE DOT
  /// =========================
  Widget inactiveDot() {
    return Container(
      width: 10,
      height: 10,

      decoration: BoxDecoration(
        color: const Color(0xffE8DFC7),

        shape: BoxShape.circle,
      ),
    );
  }

  /// =========================
  /// CLOUD
  /// =========================
  Widget cloudWidget() {
    return Row(
      children: [
        Container(
          width: 42,
          height: 42,

          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
        ),

        Transform.translate(
          offset: const Offset(-10, 8),

          child: Container(
            width: 58,
            height: 32,

            decoration: BoxDecoration(
              color: Colors.white,

              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ],
    );
  }
}
