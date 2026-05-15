/// ===============================================
/// FILE:
/// screens/driver_onboarding_two_screen.dart
/// ===============================================

import 'package:drivaer_logixapp/onboardingScreen/DriverOnboardingThreeScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:drivaer_logixapp/theme/app_colors.dart';

class DriverOnboardingTwoScreen extends StatelessWidget {
  const DriverOnboardingTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),

          child: Column(
            children: [
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
                        "assets/screen/ride.png",

                        width: 320,
                        fit: BoxFit.contain,
                      ),
                    ),

                    
                  ],
                ),
              ),

              /// TITLE
              Text(
                "Find Trips Near You",

                textAlign: TextAlign.center,

                style: GoogleFonts.poppins(
                  fontSize: 34,

                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 18),

              /// SUBTITLE
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),

                child: Text(
                  "Get trip requests that are\nconvenient and close to you.",

                  textAlign: TextAlign.center,

                  style: GoogleFonts.poppins(
                    fontSize: 17,

                    height: 1.8,

                    color: Colors.grey.shade600,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              /// INDICATOR
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  inactiveDot(),

                  const SizedBox(width: 10),

                  activeDot(),

                  const SizedBox(width: 10),

                  inactiveDot(),
                ],
              ),

              const SizedBox(height: 42),

              /// BUTTON
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DriverOnboardingThreeScreen(),
                    ),
                  );
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

  Widget inactiveDot() {
    return Container(
      width: 10,
      height: 10,

      decoration: const BoxDecoration(
        color: Color(0xffE8DFC7),
        shape: BoxShape.circle,
      ),
    );
  }

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
