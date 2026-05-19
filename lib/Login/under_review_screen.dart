import 'dart:async';

import 'package:drivaer_logixapp/MainScreen/driver_dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DriverUnderReviewScreen extends StatefulWidget {
  const DriverUnderReviewScreen({super.key});

  @override
  State<DriverUnderReviewScreen> createState() =>
      _DriverUnderReviewScreenState();
}

class _DriverUnderReviewScreenState extends State<DriverUnderReviewScreen>
    with TickerProviderStateMixin {
  bool verificationComplete = false;

  late AnimationController pulseController;

  @override
  void initState() {
    super.initState();

    pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    )..repeat(reverse: true);

    fakeReviewCheck();
  }

  void fakeReviewCheck() {
    Timer(const Duration(seconds: 5), () {
      if (mounted) {
        setState(() {
          verificationComplete = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFBF0),

      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),

          child: Column(
            children: [
              /// TOP HEADER
              Container(
                width: double.infinity,

                padding: const EdgeInsets.fromLTRB(24, 24, 24, 42),

                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xffFFD84D), Color(0xffF7B500)],

                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),

                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(42),
                    bottomRight: Radius.circular(42),
                  ),
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    /// APP BAR
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        Container(
                          width: 52,
                          height: 52,

                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.20),

                            borderRadius: BorderRadius.circular(18),
                          ),

                          child: const Icon(
                            Icons.local_shipping_rounded,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),

                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),

                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.20),

                            borderRadius: BorderRadius.circular(30),
                          ),

                          child: Text(
                            verificationComplete ? "Approved" : "In Review",

                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 38),

                    Text(
                      verificationComplete
                          ? "You're Ready\nto Drive 🚚"
                          : "Documents\nUnder Review",

                      style: GoogleFonts.poppins(
                        fontSize: 34,
                        fontWeight: FontWeight.w800,
                        height: 1.2,
                        color: const Color(0xff1A1A1A),
                      ),
                    ),

                    const SizedBox(height: 14),

                    Text(
                      verificationComplete
                          ? "Your profile has been successfully approved."
                          : "Our team is checking your submitted documents.",

                      style: GoogleFonts.poppins(
                        color: Colors.black.withOpacity(0.65),
                        fontSize: 15,
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
              ),

              Transform.translate(
                offset: const Offset(0, -26),

                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),

                  child: Column(
                    children: [
                      /// STATUS CARD
                      Container(
                        width: double.infinity,

                        padding: const EdgeInsets.all(24),

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(32),

                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),

                              blurRadius: 22,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),

                        child: Column(
                          children: [
                            /// ANIMATED STATUS
                            AnimatedBuilder(
                              animation: pulseController,

                              builder: (context, child) {
                                return Container(
                                  width: 140 + (pulseController.value * 10),

                                  height: 140 + (pulseController.value * 10),

                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,

                                    color: verificationComplete
                                        ? Colors.green.withOpacity(0.08)
                                        : const Color(
                                            0xffF7B500,
                                          ).withOpacity(0.10),
                                  ),

                                  child: Center(
                                    child: Container(
                                      width: 100,
                                      height: 100,

                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,

                                        gradient: LinearGradient(
                                          colors: verificationComplete
                                              ? [
                                                  Colors.green,
                                                  Colors.lightGreen,
                                                ]
                                              : [
                                                  const Color(0xffFFD84D),
                                                  const Color(0xffF7B500),
                                                ],
                                        ),
                                      ),

                                      child: Icon(
                                        verificationComplete
                                            ? Icons.check_rounded
                                            : Icons.hourglass_top_rounded,

                                        size: 48,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),

                            const SizedBox(height: 28),

                            Text(
                              verificationComplete
                                  ? "Verification Complete"
                                  : "Verification in Progress",

                              style: GoogleFonts.poppins(
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                                color: const Color(0xff1A1A1A),
                              ),
                            ),

                            const SizedBox(height: 12),

                            Text(
                              verificationComplete
                                  ? "Your account is fully activated."
                                  : "This process usually takes a few hours.",

                              textAlign: TextAlign.center,

                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: const Color(0xff8A8A8A),
                                height: 1.6,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 22),

                      /// TIMELINE CARD
                      Container(
                        width: double.infinity,

                        padding: const EdgeInsets.all(24),

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(32),

                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.04),

                              blurRadius: 20,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),

                        child: Column(
                          children: [
                            _timelineItem(
                              true,
                              "Profile Submitted",
                              Icons.person_rounded,
                            ),

                            _divider(),

                            _timelineItem(
                              true,
                              "Documents Uploaded",
                              Icons.description_rounded,
                            ),

                            _divider(),

                            _timelineItem(
                              verificationComplete,
                              verificationComplete
                                  ? "Approved Successfully"
                                  : "Pending Verification",

                              Icons.verified_user_rounded,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 24),

                      /// INFO CARD
                      Container(
                        padding: const EdgeInsets.all(20),

                        decoration: BoxDecoration(
                          color: const Color(0xffFFF8E1),

                          borderRadius: BorderRadius.circular(24),
                        ),

                        child: Row(
                          children: [
                            const Icon(
                              Icons.info_outline_rounded,
                              color: Color(0xffF7B500),
                            ),

                            const SizedBox(width: 14),

                            Expanded(
                              child: Text(
                                "You’ll receive a notification once verification is completed.",

                                style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  color: const Color(0xff2D2D2D),
                                  height: 1.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 34),

                      /// BUTTON
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const DriverDashboardScreen(),
                            ),
                          );
                        },

                        child: Container(
                          height: 64,
                          width: double.infinity,

                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xffFFD84D), Color(0xffF7B500)],
                            ),

                            borderRadius: BorderRadius.circular(24),

                            boxShadow: [
                              BoxShadow(
                                color: const Color(
                                  0xffF7B500,
                                ).withOpacity(0.30),

                                blurRadius: 18,
                                offset: const Offset(0, 8),
                              ),
                            ],
                          ),

                          alignment: Alignment.center,

                          child: Text(
                            verificationComplete
                                ? "Start Driving"
                                : "Return to Login",

                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xff1A1A1A),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),
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

  Widget _divider() {
    return Container(
      margin: const EdgeInsets.only(left: 18, top: 12, bottom: 12),

      height: 24,
      width: 2,

      color: const Color(0xffF0F0F0),
    );
  }

  Widget _timelineItem(bool done, String title, IconData icon) {
    return Row(
      children: [
        Container(
          width: 38,
          height: 38,

          decoration: BoxDecoration(
            shape: BoxShape.circle,

            color: done
                ? Colors.green
                : const Color(0xffF7B500).withOpacity(0.12),
          ),

          child: Icon(
            done ? Icons.check_rounded : Icons.access_time_rounded,

            color: done ? Colors.white : const Color(0xffF7B500),

            size: 18,
          ),
        ),

        const SizedBox(width: 16),

        Expanded(
          child: Text(
            title,

            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: done ? FontWeight.w700 : FontWeight.w500,

              color: done ? const Color(0xff1A1A1A) : const Color(0xff8A8A8A),
            ),
          ),
        ),

        Icon(
          icon,

          color: done ? Colors.green : const Color(0xff8A8A8A),

          size: 22,
        ),
      ],
    );
  }
}
