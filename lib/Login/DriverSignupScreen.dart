import 'package:drivaer_logixapp/Login/DriverLoginScreen.dart';
import 'package:drivaer_logixapp/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DriverSignupScreen extends StatelessWidget {
  const DriverSignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F4F5),

      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),

          child: Column(
            children: [
              /// TOP IMAGE
              SizedBox(
                height: 340,
                width: double.infinity,

                child: Image.asset(
                  "assets/screen/signup.png",
                  fit: BoxFit.cover,
                ),
              ),

              /// WHITE CONTAINER
              Container(
                width: double.infinity,

                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(38),
                    topRight: Radius.circular(38),
                  ),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 20,
                      offset: const Offset(0, -4),
                    ),
                  ],
                ),

                child: Padding(
                  padding: const EdgeInsets.fromLTRB(28, 34, 28, 34),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// TITLE
                      Text(
                        "Create Your\nDriver Account",

                        style: GoogleFonts.poppins(
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          height: 1.2,
                          color: const Color(0xff111111),
                        ),
                      ),

                      const SizedBox(height: 10),

                      /// SUBTITLE
                      Text(
                        "Join DriverX and start your journey with smart driving opportunities.",

                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: const Color(0xff8F8F8F),
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                        ),
                      ),

                      const SizedBox(height: 28),

                      /// FULL NAME
                      _buildLabel("Full Name"),

                      const SizedBox(height: 8),

                      _buildField(hint: "Enter your full name"),

                      const SizedBox(height: 18),

                      /// MOBILE NUMBER
                      _buildLabel("Mobile Number"),

                      const SizedBox(height: 8),

                      _buildField(
                        hint: "Enter 10-digit number",
                        keyboardType: TextInputType.phone,
                      ),

                      const SizedBox(height: 18),

                      /// PASSWORD
                      _buildLabel("Password"),

                      const SizedBox(height: 8),

                      _buildField(hint: "Enter password", obscureText: true),

                      const SizedBox(height: 18),

                      /// TERMS
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.check_circle_rounded,
                            color: AppColors.yellow2,
                            size: 20,
                          ),

                          const SizedBox(width: 10),

                          Expanded(
                            child: Center(
                              child: GestureDetector(
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
                                    text: "By continuing you agree to our ",

                                    style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      color: const Color(0xff8F8F8F),
                                      height: 1.5,
                                    ),

                                    children: [
                                      TextSpan(
                                        text: "Terms & Conditions",

                                        style: GoogleFonts.poppins(
                                          color: AppColors.yellow2,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 28),

                      /// BUTTON
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const DriverLoginScreen(),
                            ),
                          );
                        },

                        child: Container(
                          height: 62,
                          width: double.infinity,

                          decoration: BoxDecoration(
                            color: AppColors.yellow2,

                            borderRadius: BorderRadius.circular(20),

                            boxShadow: [
                              BoxShadow(
                                color: AppColors.yellow2.withOpacity(0.35),
                                blurRadius: 14,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),

                          alignment: Alignment.center,

                          child: Text(
                            "Create Account",

                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 22),

                      /// SIGN IN
                      Center(
                        child: RichText(
                          text: TextSpan(
                            text: "Already have an account? ",

                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: const Color(0xff8F8F8F),
                              fontWeight: FontWeight.w500,
                            ),

                            children: [
                              TextSpan(
                                text: "Sign In",

                                style: GoogleFonts.poppins(
                                  color: AppColors.yellow2,
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// LABEL
  static Widget _buildLabel(String text) {
    return Text(
      text,

      style: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: const Color(0xff1C1C1C),
      ),
    );
  }

  /// TEXTFIELD
  static Widget _buildField({
    required String hint,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Container(
      height: 66,

      decoration: BoxDecoration(
        color: const Color(0xffF4F4F4),
        borderRadius: BorderRadius.circular(18),
      ),

      child: TextField(
        obscureText: obscureText,
        keyboardType: keyboardType,

        style: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),

        decoration: InputDecoration(
          border: InputBorder.none,

          contentPadding: const EdgeInsets.symmetric(
            horizontal: 22,
            vertical: 20,
          ),

          hintText: hint,

          hintStyle: GoogleFonts.poppins(
            fontSize: 15,
            color: const Color(0xffA0A0A0),
          ),
        ),
      ),
    );
  }
}
