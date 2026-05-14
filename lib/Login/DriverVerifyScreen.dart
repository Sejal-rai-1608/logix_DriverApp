/// ===============================================
/// FILE:
/// screens/driver_verify_screen.dart
/// ===============================================

import 'package:drivaer_logixapp/Login/DriverResetPasswordScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class DriverVerifyScreen extends StatelessWidget {
  const DriverVerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor:
          const Color(0xffFFFDF6),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),

          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.center,

            children: [

              const SizedBox(height: 80),

              Text(
                "Verify Your Number",

                style:
                    GoogleFonts.poppins(
                  fontSize: 28,

                  fontWeight:
                      FontWeight.w700,
                ),
              ),

              const SizedBox(height: 12),

              Text(
                "Enter the 6-digit code sent to\n+91 98765 43210",

                textAlign:
                    TextAlign.center,

                style:
                    GoogleFonts.poppins(
                  color:
                      Colors.grey.shade600,
                ),
              ),

              const SizedBox(height: 50),

              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly,

                children: List.generate(
                  6,

                  (index) => otpBox(),
                ),
              ),

              const SizedBox(height: 26),

              Text(
                "Resend OTP in 00:25",

                style:
                    GoogleFonts.poppins(
                  color:
                      Colors.grey.shade600,
                ),
              ),

              const Spacer(),

              button(
                title: "Verify",

                onTap: () {

                  Navigator.push(
                    context,

                    MaterialPageRoute(
                      builder: (_) =>
                          const DriverResetPasswordScreen(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget otpBox() {

    return Container(
      width: 46,
      height: 56,

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius:
            BorderRadius.circular(14),
      ),

      child: Center(
        child: Text(
          "4",

          style:
              GoogleFonts.poppins(
            fontSize: 20,
            fontWeight:
                FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget button({
    required String title,
    required VoidCallback onTap,
  }) {

    return GestureDetector(
      onTap: onTap,

      child: Container(
        height: 58,
        width: double.infinity,

        decoration: BoxDecoration(

          gradient:
              const LinearGradient(
            colors: [

              Color(0xffFFD84D),

              Color(0xffF7B500),
            ],
          ),

          borderRadius:
              BorderRadius.circular(18),
        ),

        child: Center(
          child: Text(
            title,

            style:
                GoogleFonts.poppins(
              fontSize: 18,
              fontWeight:
                  FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}