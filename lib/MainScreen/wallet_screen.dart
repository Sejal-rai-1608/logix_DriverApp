import 'package:drivaer_logixapp/Trip/trips_history_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_colors.dart';
import '../widget/AuthButton.dart';
import '../widget/driver_bottom_nav.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() =>
      _WalletScreenState();
}

class _WalletScreenState
    extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,

      bottomNavigationBar: DriverBottomNav(
        currentIndex: 2,
        gestureDetector: (index) {
          onTap: (index) {
            print(index);
          };
        },
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 14,
          ),

          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [

              /// header
              Row(
                children: [

                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },

                    child: Container(
                      width: 56,
                      height: 56,

                      decoration:
                          BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius
                                .circular(
                                    18),

                        boxShadow: [
                          BoxShadow(
                            blurRadius: 20,
                            color: Colors
                                .black
                                .withOpacity(
                                    .04),
                          )
                        ],
                      ),

                      child: const Icon(
                        Icons
                            .arrow_back_ios_new,
                      ),
                    ),
                  ),

                  const Spacer(),

                  Text(
                    "Wallet",
                    style:
                        GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight:
                          FontWeight.w700,
                    ),
                  ),

                  const Spacer(),

                  const SizedBox(width: 56),
                ],
              ),

              const SizedBox(height: 30),

              /// balance card

              Container(
                width: double.infinity,

                padding:
                    const EdgeInsets.all(
                        25),

                decoration:
                    BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(
                          30),

                  gradient:
                      const LinearGradient(
                    colors: [
                      Color(
                          0xffFFF4A5),
                      Color(
                          0xffFFC800)
                    ],
                    begin:
                        Alignment.topLeft,
                    end: Alignment
                        .bottomRight,
                  ),

                  boxShadow: [
                    BoxShadow(
                      blurRadius: 30,
                      color: Colors
                          .yellow
                          .withOpacity(
                              .35),
                    )
                  ],
                ),

                child: Row(
                  children: [

                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment
                                .start,

                        children: [

                          Text(
                            "Current Balance",

                            style:
                                GoogleFonts
                                    .poppins(
                              fontSize:
                                  18,
                              color: Colors
                                  .black54,
                            ),
                          ),

                          const SizedBox(
                              height:
                                  16),

                          Text(
                            "₹2,450",

                            style:
                                GoogleFonts
                                    .poppins(
                              fontSize:
                                  48,
                              fontWeight:
                                  FontWeight
                                      .w700,
                            ),
                          )
                        ],
                      ),
                    ),

                    Container(
                      width: 90,
                      height: 90,

                      decoration:
                          BoxDecoration(
                        color: Colors
                            .white
                            .withOpacity(
                                .2),

                        shape:
                            BoxShape
                                .circle,
                      ),

                      child:
                          const Icon(
                        Icons.wallet,
                        size: 55,
                      ),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 25),

              Row(
                children: [

                  Expanded(
                    child: featureCard(
                      title:
                          "Payout History",

                      icon: Icons
                          .description_outlined,

                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                const TripsHistoryScreen(),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(
                      width: 20),

                  Expanded(
                    child: featureCard(
                      title:
                          "Payment Methods",

                      icon: Icons
                          .credit_card,

                      onTap: () {
                        ScaffoldMessenger.of(
                                context)
                            .showSnackBar(
                          const SnackBar(
                            content: Text(
                                "Payment Methods"),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 35),

              Text(
                "Recent Payout",

                style:
                    GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight:
                      FontWeight.w700,
                ),
              ),

              const SizedBox(height: 18),

              Container(
                padding:
                    const EdgeInsets.all(
                        22),

                decoration:
                    BoxDecoration(
                  color: Colors.white,

                  borderRadius:
                      BorderRadius.circular(
                          28),

                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20,
                      color: Colors
                          .black
                          .withOpacity(
                              .04),
                    )
                  ],
                ),

                child: Row(
                  children: [

                    Container(
                      width: 60,
                      height: 60,

                      decoration:
                          BoxDecoration(
                        color:
                            const Color(
                                0xffFFF7E0),

                        shape:
                            BoxShape
                                .circle,
                      ),

                      child:
                          const Icon(
                        Icons
                            .calendar_month,
                        color: Color(
                            0xffF5B400),
                      ),
                    ),

                    const SizedBox(
                        width: 18),

                    Expanded(
                      child: Text(
                        "18 May 2024",

                        style:
                            GoogleFonts
                                .poppins(
                          fontSize:
                              18,
                          fontWeight:
                              FontWeight
                                  .w500,
                        ),
                      ),
                    ),

                    Text(
                      "- ₹2,000",

                      style:
                          GoogleFonts
                              .poppins(
                        fontSize: 22,
                        fontWeight:
                            FontWeight
                                .w700,
                      ),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 45),

              AuthButton(
                title: "Withdraw",

                onTap: () {
                  showDialog(
                    context: context,

                    builder: (_) =>
                        AlertDialog(
                      shape:
                          RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius
                                .circular(
                                    25),
                      ),

                      title:
                          const Text(
                        "Withdraw",
                      ),

                      content:
                          const Text(
                        "₹2,000 transferred successfully",
                      ),

                      actions: [

                        TextButton(
                          onPressed:
                              () {
                            Navigator.pop(
                                context);
                          },
                          child:
                              const Text(
                            "OK",
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),

              const SizedBox(height: 30)
            ],
          ),
        ),
      ),
    );
  }

  Widget featureCard({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,

      child: Container(
        height: 150,

        padding:
            const EdgeInsets.all(
                18),

        decoration:
            BoxDecoration(
          color: Colors.white,

          borderRadius:
              BorderRadius.circular(
                  28),

          boxShadow: [
            BoxShadow(
              blurRadius: 18,
              color: Colors.black
                  .withOpacity(.04),
            )
          ],
        ),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            Container(
              width: 55,
              height: 55,

              decoration:
                  const BoxDecoration(
                color:
                    Color(0xffFFF8E6),
                shape:
                    BoxShape.circle,
              ),

              child: Icon(
                icon,
                color:
                    const Color(
                        0xffF5B400),
              ),
            ),

            const Spacer(),

            Text(
              title,
              style:
                  GoogleFonts.poppins(
                fontWeight:
                    FontWeight.w700,
                fontSize: 18,
              ),
            ),

            Align(
              alignment:
                  Alignment.centerRight,
              child: Icon(
                Icons.chevron_right,
                color:
                    Colors.grey
                        .shade400,
              ),
            )
          ],
        ),
      ),
    );
  }
}