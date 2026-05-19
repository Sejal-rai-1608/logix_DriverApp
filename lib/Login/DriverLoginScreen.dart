import 'package:drivaer_logixapp/Login/DriverSignupScreen.dart';
import 'package:drivaer_logixapp/Login/DriverVerifyScreen.dart';
import 'package:drivaer_logixapp/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DriverLoginScreen extends StatelessWidget {
  const DriverLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F4F5),

      body: SafeArea(
        child: Stack(
          children: [
            /// BACKGROUND CIRCLES
            Positioned(
              top: -40,
              right: -30,
              child: Container(
                height: 160,
                width: 160,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.yellow2,
                ),
              ),
            ),

            Positioned(
              top: 220,
              left: -50,
              child: Container(
                height: 140,
                width: 140,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.yellow2.withOpacity(0.08),
                ),
              ),
            ),

            /// MAIN CONTENT
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),

              child: Column(
                children: [
                  /// TOP IMAGE SECTION
                  Stack(
                    children: [
                      SizedBox(
                        height: 340,
                        width: double.infinity,

                        child: Hero(
                          tag: "login_hero",

                          child: Image.asset(
                            "assets/screen/login_hero.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      /// GRADIENT OVERLAY
                      Container(
                        height: 340,

                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,

                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.25),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  /// WHITE SHEET
                  Transform.translate(
                    offset: const Offset(0, -30),

                    child: Container(
                      width: double.infinity,

                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.96),

                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(42),
                          topRight: Radius.circular(42),
                        ),

                        border: Border.all(
                          color: Colors.white.withOpacity(0.4),
                        ),

                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 30,
                            offset: const Offset(0, -8),
                          ),
                        ],
                      ),

                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(28, 18, 28, 34),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// TOP INDICATOR
                            Center(
                              child: Container(
                                height: 5,
                                width: 50,

                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),

                            const SizedBox(height: 24),

                            /// DRIVER BADGE
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 10,
                              ),

                              decoration: BoxDecoration(
                                color: const Color(0xffFFF3E0),
                                borderRadius: BorderRadius.circular(30),
                              ),

                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.local_taxi_rounded,
                                    color: AppColors.yellow2,
                                    size: 20,
                                  ),

                                  const SizedBox(width: 8),

                                  Text(
                                    "Driver Partner",

                                    style: GoogleFonts.poppins(
                                      color: AppColors.yellow2,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 24),

                            /// TITLE
                            Text(
                              "Drive Smarter,\nEarn Better",

                              style: GoogleFonts.poppins(
                                fontSize: 32,
                                fontWeight: FontWeight.w800,
                                height: 1.2,
                                color: const Color(0xff111111),
                              ),
                            ),

                            const SizedBox(height: 12),

                            /// SUBTITLE
                            Text(
                              "Login to continue your journey with DriverX.",

                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                color: const Color(0xff8F8F8F),
                                fontWeight: FontWeight.w400,
                                height: 1.5,
                              ),
                            ),

                            const SizedBox(height: 32),

                            /// PHONE LABEL
                            _buildLabel("Mobile Number"),

                            const SizedBox(height: 8),

                            /// PHONE FIELD
                            _buildField(
                              hint: "Enter your mobile number",
                              icon: Icons.phone_android_rounded,
                              keyboardType: TextInputType.phone,
                            ),

                            const SizedBox(height: 20),

                            /// PASSWORD LABEL
                            _buildLabel("Password"),

                            const SizedBox(height: 8),

                            /// PASSWORD FIELD
                            _buildField(
                              hint: "Enter your password",
                              icon: Icons.lock_outline_rounded,
                              obscureText: true,
                            ),

                            const SizedBox(height: 8),

                            /// FORGOT PASSWORD
                            Align(
                              alignment: Alignment.centerRight,

                              child: TextButton(
                                onPressed: () {},

                                child: Text(
                                  "Forgot Password?",

                                  style: GoogleFonts.poppins(
                                    color: AppColors.yellow2,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 18),

                            /// LOGIN BUTTON
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const DriverVerifyScreen(),
                                  ),
                                );
                              },

                              child: Container(
                                height: 62,
                                width: double.infinity,

                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      AppColors.yellow1,
                                      AppColors.yellow2,
                                    ],
                                  ),

                                  borderRadius: BorderRadius.circular(22),

                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.yellow2.withOpacity(
                                        0.45,
                                      ),

                                      blurRadius: 18,
                                      offset: const Offset(0, 8),
                                    ),
                                  ],
                                ),

                                alignment: Alignment.center,

                                child: Text(
                                  "Login",

                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 30),

                            /// DIVIDER
                            Row(
                              children: [
                                // Expanded(
                                // child: Divider(
                                //   color: Colors.grey.shade300,
                                //   thickness: 1.2,
                                // ),
                                //),

                                //     Padding(
                                //       padding: const EdgeInsets.symmetric(
                                //         horizontal: 14,
                                //       ),

                                //       child: Text(
                                //         "Or continue with",

                                //         style: GoogleFonts.poppins(
                                //           color: Colors.grey,
                                //           fontSize: 13,
                                //           fontWeight: FontWeight.w500,
                                //         ),
                                //       ),
                                //     ),

                                //     Expanded(
                                //       child: Divider(
                                //         color: Colors.grey.shade300,
                                //         thickness: 1.2,
                                //       ),
                                //     ),
                                //   ],
                                // ),

                                // const SizedBox(height: 24),

                                // /// SOCIAL BUTTONS
                                // Row(
                                //   children: [
                                //     _socialButton(
                                //       Icons.g_mobiledata_rounded,
                                //       "Google",
                                //     ),

                                //     const SizedBox(width: 16),

                                //     _socialButton(Icons.apple_rounded, "Apple"),
                                //   ],
                                // ),

                                // const SizedBox(height: 34),

                                /// SIGN UP
                                Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) =>
                                              const DriverSignupScreen(),
                                        ),
                                      );

                                      // Handle sign up action
                                    },
                                    child: RichText(
                                      text: TextSpan(
                                        text: "-------Don't have an account? ",

                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          color: const Color(0xff8F8F8F),
                                          fontWeight: FontWeight.w500,
                                        ),

                                        children: [
                                          TextSpan(
                                            text: "Sign Up-------",

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
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// LABEL
  static Widget _buildLabel(String text) {
    return Text(
      text,

      style: GoogleFonts.poppins(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: const Color(0xff1C1C1C),
      ),
    );
  }

  /// TEXTFIELD
  static Widget _buildField({
    required String hint,
    required IconData icon,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Container(
      height: 64,

      decoration: BoxDecoration(
        color: const Color(0xffF5F5F5),
        borderRadius: BorderRadius.circular(18),
      ),

      child: TextField(
        obscureText: obscureText,
        keyboardType: keyboardType,

        style: GoogleFonts.poppins(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),

        decoration: InputDecoration(
          border: InputBorder.none,

          prefixIcon: Icon(icon, color: AppColors.yellow2),

          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),

          hintText: hint,

          hintStyle: GoogleFonts.poppins(
            fontSize: 14,
            color: const Color(0xffA0A0A0),
          ),
        ),
      ),
    );
  }

  /// SOCIAL BUTTON
  static Widget _socialButton(IconData icon, String text) {
    return Expanded(
      child: Container(
        height: 58,

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),

          border: Border.all(color: Colors.grey.shade200),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: const Color(0xff111111), size: 28),

            const SizedBox(width: 8),

            Text(
              text,

              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: const Color(0xff111111),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
