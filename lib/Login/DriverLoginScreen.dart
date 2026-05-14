/// ===============================================
/// FILE:
/// screens/driver_login_screen.dart
/// ===============================================

import 'package:drivaer_logixapp/Login/DriverSignupScreen.dart';
import 'package:drivaer_logixapp/Login/DriverVerifyScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DriverLoginScreen extends StatelessWidget {
  const DriverLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFDF6),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const SizedBox(height: 40),

              Text(
                "Welcome Back!",

                style: GoogleFonts.poppins(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                "Login to your account",

                style: GoogleFonts.poppins(color: Colors.grey.shade600),
              ),

              const SizedBox(height: 36),

              customField("Phone Number", "+91 98765 43210"),

              const SizedBox(height: 20),

              passwordField(),

              Align(
                alignment: Alignment.centerRight,

                child: TextButton(
                  onPressed: () {},

                  child: Text(
                    "Forgot Password?",

                    style: GoogleFonts.poppins(color: Colors.blue),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              button(
                title: "Login",

                onTap: () {
                  Navigator.push(
                    context,

                    MaterialPageRoute(
                      builder: (_) => const DriverVerifyScreen(),
                    ),
                  );
                },
              ),

              const Spacer(),

              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,

                      MaterialPageRoute(
                        builder: (_) => const DriverSignupScreen(),
                      ),
                    );
                  },

                  child: RichText(
                    text: TextSpan(
                      text: "Don't have an account? ",

                      style: GoogleFonts.poppins(color: Colors.grey),

                      children: [
                        TextSpan(
                          text: "Sign up",

                          style: GoogleFonts.poppins(
                            color: const Color(0xffF7B500),

                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget customField(String title, String hint) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,

        labelText: title,

        filled: true,

        fillColor: Colors.white,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),

          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget passwordField() {
    return TextField(
      obscureText: true,

      decoration: InputDecoration(
        hintText: "••••••••",

        labelText: "Password",

        filled: true,

        fillColor: Colors.white,

        suffixIcon: const Icon(Icons.visibility_off),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),

          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget button({required String title, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        height: 58,
        width: double.infinity,

        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xffFFD84D), Color(0xffF7B500)],
          ),

          borderRadius: BorderRadius.circular(18),
        ),

        child: Center(
          child: Text(
            title,

            style: GoogleFonts.poppins(
              fontSize: 18,

              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
