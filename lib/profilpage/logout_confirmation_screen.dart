import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Login/DriverLoginScreen.dart';
import '../theme/app_colors.dart';

class LogoutConfirmationScreen extends StatelessWidget {
  const LogoutConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,

      body: SafeArea(
        child: Stack(
          children: [

            /// LEFT TRUCK BG
            Positioned(
              left: -15,
              top: 160,
              child: Opacity(
                opacity: .08,
                child: Image.asset(
                  "assets/screen/truck.png",
                  width: 200,
                ),
              ),
            ),

            /// RIGHT BG
            Positioned(
              right: -10,
              top: 150,
              child: Opacity(
                opacity: .08,
                child: Column(
                  children: [

                    Icon(
                      Icons.location_on,
                      size: 38,
                      color: Colors.orange.shade300,
                    ),

                    const SizedBox(height: 4),

                    Text(
                      "⌁⌁⌁",
                      style: TextStyle(
                        color: Colors.orange.shade200,
                        fontSize: 18,
                      ),
                    ),

                    Icon(
                      Icons.inventory_2,
                      size: 70,
                      color: Colors.orange.shade300,
                    ),
                  ],
                ),
              ),
            ),

            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 18,
              ),

              child: Column(
                children: [

                  const SizedBox(height: 50),

                  /// MAIN ICON
                  Container(
                    width: 150,
                    height: 150,

                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,

                      boxShadow: [
                        BoxShadow(
                          blurRadius: 18,
                          color: Colors.amber.withOpacity(.15),
                        )
                      ],
                    ),

                    child: Stack(
                      alignment: Alignment.center,
                      children: [

                        Icon(
                          Icons.person_outline,
                          size: 70,
                          color: Colors.amber.shade700,
                        ),

                        Positioned(
                          right: 18,
                          bottom: 18,

                          child: Container(
                            width: 46,
                            height: 46,

                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,

                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 12,
                                  color: Colors.black.withOpacity(.08),
                                )
                              ],
                            ),

                            child: Icon(
                              Icons.logout,
                              size: 22,
                              color: Colors.amber.shade700,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  Text(
                    "Logout",
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "Are you sure you want to logout\nfrom your account?",

                    textAlign: TextAlign.center,

                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      height: 1.4,
                      color: Colors.grey.shade600,
                    ),
                  ),

                  const SizedBox(height: 35),

                  /// LOGOUT BUTTON
                  InkWell(
                    onTap: () {

                      Navigator.pushAndRemoveUntil(
                        context,

                        MaterialPageRoute(
                          builder: (_) =>
                              const DriverLoginScreen(),
                        ),

                        (route) => false,
                      );
                    },

                    child: Container(
                      height: 56,

                      decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(24),

                        gradient:
                        const LinearGradient(
                          colors: [
                            Color(0xffFFD94D),
                            Color(0xffFFC400),
                          ],
                        ),

                        boxShadow: [
                          BoxShadow(
                            blurRadius: 15,
                            color: Colors.amber
                                .withOpacity(.30),
                          )
                        ],
                      ),

                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.center,

                        children: [

                          const Icon(
                            Icons.logout,
                            size: 22,
                            color: Colors.white,
                          ),

                          const SizedBox(width:10),

                          Text(
                            "Yes, Logout",

                            style:
                            GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight:
                              FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 18),

                  /// CANCEL
                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },

                    child: Container(
                      height:56,

                      decoration:
                      BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(
                            24),

                        border: Border.all(
                          color:
                          Colors.grey.shade300,
                        ),
                      ),

                      child: Center(
                        child: Text(
                          "Cancel",

                          style:
                          GoogleFonts.poppins(
                            fontSize:20,
                            fontWeight:
                            FontWeight.w600,
                            color:
                            Colors.grey.shade700,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}