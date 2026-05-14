/// ===============================================
/// FILE:
/// screens/driver_reset_password_screen.dart
/// ===============================================

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DriverResetPasswordScreen
    extends StatelessWidget {

  const DriverResetPasswordScreen({
    super.key,
  });

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
                CrossAxisAlignment.start,

            children: [

              const SizedBox(height: 50),

              Text(
                "Set New Password",

                style:
                    GoogleFonts.poppins(
                  fontSize: 30,

                  fontWeight:
                      FontWeight.w700,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                "Create a new password for\nyour account",

                style:
                    GoogleFonts.poppins(
                  color:
                      Colors.grey.shade600,
                ),
              ),

              const SizedBox(height: 40),

              passwordField(
                "New Password",
              ),

              const SizedBox(height: 22),

              passwordField(
                "Confirm Password",
              ),

              const Spacer(),

              button(
                title: "Save Password",

                onTap: () {},
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget passwordField(
    String title,
  ) {

    return TextField(
      obscureText: true,

      decoration: InputDecoration(
        hintText: "••••••••",

        labelText: title,

        filled: true,

        fillColor: Colors.white,

        suffixIcon:
            const Icon(Icons.visibility_off),

        border: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(16),

          borderSide: BorderSide.none,
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