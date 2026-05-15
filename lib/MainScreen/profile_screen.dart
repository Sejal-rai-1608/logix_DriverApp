import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_colors.dart';
import '../widget/driver_bottom_nav.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,

      bottomNavigationBar: DriverBottomNav(
        currentIndex: 3,
          gestureDetector: (index) {
            onTap: (index) {
              print(index);
            };
          },
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(
            top: 20,
            left: 18,
            right: 18,
            bottom: 20,
          ),

          child: Column(
            children: [

              /// top profile section
              Stack(
                children: [

                  /// background decorative
                  Positioned(
                    left: -20,
                    top: 160,
                    child: Opacity(
                      opacity: .18,
                      child: Image.asset(
                        "assets/screen/back.png",
                        width: 280,
                      ),
                    ),
                  ),

                  Positioned(
                    right: -10,
                    top: 140,
                    child: Opacity(
                      opacity: .15,
                      child: Icon(
                        Icons.inventory_2,
                        size: 150,
                        color: Colors.orange.shade100,
                      ),
                    ),
                  ),

                  Column(
                    children: [

                      Container(
                        width: 170,
                        height: 170,

                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 6,
                          ),

                          boxShadow: [
                            BoxShadow(
                              blurRadius: 25,
                              color: Colors.yellow
                                  .withOpacity(.25),
                            )
                          ],

                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              "assets/screen/driver_verification.png",
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      Text(
                        "John Driver",
                        style:
                            GoogleFonts.poppins(
                          fontWeight:
                              FontWeight.w700,
                          fontSize: 32,
                        ),
                      ),

                      const SizedBox(height: 14),

                      Container(
                        padding:
                            const EdgeInsets.symmetric(
                          horizontal: 26,
                          vertical: 10,
                        ),

                        decoration:
                            BoxDecoration(
                          color:
                              const Color(
                                  0xffFFF5D7),
                          borderRadius:
                              BorderRadius
                                  .circular(
                                      20),
                        ),

                        child: Row(
                          mainAxisSize:
                              MainAxisSize.min,
                          children: [

                            Text(
                              "4.8",
                              style:
                                  GoogleFonts
                                      .poppins(
                                fontWeight:
                                    FontWeight
                                        .w700,
                                fontSize:
                                    24,
                              ),
                            ),

                            const SizedBox(
                                width: 10),

                            const Icon(
                              Icons.star,
                              color:
                                  Colors.amber,
                              size: 32,
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),

              const SizedBox(height: 30),

              Container(
                decoration:
                    BoxDecoration(
                  color: Colors.white,

                  borderRadius:
                      BorderRadius.circular(
                          35),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black
                          .withOpacity(.05),
                      blurRadius: 25,
                    )
                  ],
                ),

                child: Column(
                  children: [

                    menuTile(
                      context,
                      icon:
                          Icons.person_outline,
                      title:
                          "Personal Information",
                    ),

                    divider(),

                    menuTile(
                      context,
                      icon:
                          Icons.local_shipping_outlined,
                      title:
                          "Vehicle Information",
                    ),

                    divider(),

                    menuTile(
                      context,
                      icon:
                          Icons.description_outlined,
                      title:
                          "Documents",
                    ),

                    divider(),

                    menuTile(
                      context,
                      icon:
                          Icons.account_balance_outlined,
                      title:
                          "Bank Details",
                    ),

                    divider(),

                    menuTile(
                      context,
                      icon:
                          Icons.settings_outlined,
                      title:
                          "Settings",
                    ),

                    divider(),

                    menuTile(
                      context,
                      icon:
                          Icons.support_agent,
                      title:
                          "Support",
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget divider() {
    return Padding(
      padding:
          const EdgeInsets.symmetric(
              horizontal: 20),
      child: Divider(
        color: Colors.grey.shade200,
      ),
    );
  }

  Widget menuTile(
    BuildContext context, {
    required IconData icon,
    required String title,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),

      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("$title clicked"),
          ),
        );
      },

      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 14, // reduced from 22
        ),

        child: Row(
          children: [

            Container(
              width: 54, // reduced from 70
              height: 54,

              decoration: BoxDecoration(
                color: const Color(0xffFFF8E8),
                borderRadius:
                    BorderRadius.circular(16),
              ),

              child: Icon(
                icon,
                color: const Color(0xffF5B400),
                size: 28, // reduced from 34
              ),
            ),

            const SizedBox(width: 16),

            Expanded(
              child: Text(
                title,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 15, // reduced from 18
                ),
              ),
            ),

            Icon(
              Icons.chevron_right,
              color: Colors.grey.shade400,
              size: 28, // reduced from 40
            )
          ],
        ),
      ),
    );
  }
}