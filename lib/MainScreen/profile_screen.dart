import 'dart:io';

import 'package:drivaer_logixapp/Login/DriverLoginScreen.dart';
import 'package:drivaer_logixapp/profilpage/Bank_detail.dart';
import 'package:drivaer_logixapp/profilpage/documents.dart';
import 'package:drivaer_logixapp/profilpage/edit_profileScreen.dart';
import 'package:drivaer_logixapp/profilpage/personal_info.dart';
import 'package:drivaer_logixapp/profilpage/settings_screen.dart';
import 'package:drivaer_logixapp/profilpage/support.dart';
import 'package:drivaer_logixapp/profilpage/vehicle_info.dart';
import 'package:drivaer_logixapp/theme/app_colors.dart';
import 'package:drivaer_logixapp/widget/custom_bottombar.dart';
//import 'package:drivaer_logixapp/widget/driver_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? profileImage;

  Future<void> pickImage() async {
    final picked = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 70,
    );

    if (picked != null) {
      setState(() {
        profileImage = File(picked.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,

      bottomNavigationBar: CustomBottomBar(
        currentIndex: 3,
        onItemTapped: (index) {},
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),

          padding: const EdgeInsets.fromLTRB(18, 18, 18, 120),

          child: Column(
            children: [
              /// TOP BAR
              Row(
                children: [
                  Text(
                    "Profile",

                    style: GoogleFonts.poppins(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,

                      color: AppColors.textDark,
                    ),
                  ),

                  const Spacer(),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,

                        MaterialPageRoute(
                          builder: (_) => const SettingsScreen(),
                        ),
                      );
                    },

                    child: Container(
                      width: 52,
                      height: 52,

                      decoration: BoxDecoration(
                        color: Colors.white,

                        borderRadius: BorderRadius.circular(18),

                        boxShadow: [
                          BoxShadow(
                            blurRadius: 18,

                            color: Colors.black.withOpacity(.04),
                          ),
                        ],
                      ),

                      child: const Icon(
                        Icons.settings,
                        color: Color(0xff1A1A1A),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 26),

              /// PROFILE CARD
              Container(
                width: double.infinity,

                padding: const EdgeInsets.all(22),

                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.circular(34),

                  border: Border.all(
                    color: const Color(0xffF7B500).withOpacity(.18),

                    width: 1.4,
                  ),

                  boxShadow: [
                    BoxShadow(
                      blurRadius: 18,

                      offset: const Offset(0, 8),

                      color: Colors.black.withOpacity(.04),
                    ),
                  ],
                ),

                child: Column(
                  children: [
                    /// PROFILE IMAGE
                    Stack(
                      children: [
                        Container(
                          width: 118,
                          height: 118,

                          decoration: BoxDecoration(
                            shape: BoxShape.circle,

                            border: Border.all(
                              color: const Color(0xffFFD84D),

                              width: 4,
                            ),

                            image: DecorationImage(
                              fit: BoxFit.cover,

                              image: profileImage != null
                                  ? FileImage(profileImage!)
                                  : const AssetImage(
                                          "assets/screen/driver_verification.png",
                                        )
                                        as ImageProvider,
                            ),
                          ),
                        ),

                        Positioned(
                          bottom: 0,
                          right: 0,

                          child: GestureDetector(
                            onTap: pickImage,

                            child: Container(
                              width: 38,
                              height: 38,

                              decoration: BoxDecoration(
                                color: const Color(0xffFFD84D),

                                shape: BoxShape.circle,

                                border: Border.all(
                                  color: Colors.white,

                                  width: 3,
                                ),
                              ),

                              child: const Icon(
                                Icons.edit_rounded,

                                size: 18,

                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 18),

                    Text(
                      "John Driver",

                      style: GoogleFonts.poppins(
                        fontSize: 26,

                        fontWeight: FontWeight.w700,

                        color: const Color(0xff1A1A1A),
                      ),
                    ),

                    const SizedBox(height: 5),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),

                      decoration: BoxDecoration(
                        color: const Color(0xffFFF7DB),

                        borderRadius: BorderRadius.circular(30),
                      ),

                      child: Text(
                        "Premium Driver",

                        style: GoogleFonts.poppins(
                          fontSize: 12,

                          fontWeight: FontWeight.w600,

                          color: const Color(0xffD99A00),
                        ),
                      ),
                    ),

                    const SizedBox(height: 22),

                    /// STATS
                    Row(
                      children: [
                        Expanded(child: modernStatCard("248", "Trips")),

                        const SizedBox(width: 12),

                        Expanded(child: modernStatCard("4.8", "Rating")),

                        const SizedBox(width: 12),

                        Expanded(child: modernStatCard("2Y", "Experience")),
                      ],
                    ),

                    const SizedBox(height: 22),

                    /// EDIT BUTTON
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,

                          MaterialPageRoute(
                            builder: (_) => const EditProfileScreen(),
                          ),
                        );
                      },

                      child: Container(
                        height: 56,
                        width: double.infinity,

                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xffFFD84D), Color(0xffF7B500)],
                          ),

                          borderRadius: BorderRadius.circular(18),
                        ),

                        alignment: Alignment.center,

                        child: Text(
                          "Edit Profile",

                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700,

                            fontSize: 15,

                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              /// QUICK INFO
              Row(
                children: [
                  Expanded(
                    child: infoCard(
                      Icons.account_balance_wallet,
                      "Wallet",
                      "₹ 2,450",
                    ),
                  ),

                  const SizedBox(width: 14),

                  Expanded(
                    child: infoCard(Icons.local_shipping, "Vehicle", "Active"),
                  ),
                ],
              ),

              const SizedBox(height: 28),

              /// MENU CONTAINER
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.circular(32),

                  boxShadow: [
                    BoxShadow(
                      blurRadius: 24,

                      color: Colors.black.withOpacity(.04),
                    ),
                  ],
                ),

                child: Column(
                  children: [
                    menuTile(
                      context,

                      icon: Icons.person_outline,

                      title: "Personal Information",

                      subtitle: "Manage profile details",

                      onTap: () {
                        Navigator.push(
                          context,

                          MaterialPageRoute(
                            builder: (_) => const PersonalInformationScreen(),
                          ),
                        );
                      },
                    ),

                    divider(),

                    menuTile(
                      context,

                      icon: Icons.local_shipping_outlined,

                      title: "Vehicle Information",

                      subtitle: "Truck & documents",

                      onTap: () {
                        Navigator.push(
                          context,

                          MaterialPageRoute(
                            builder: (_) => const VehicleInformationScreen(),
                          ),
                        );
                      },
                    ),

                    divider(),

                    menuTile(
                      context,

                      icon: Icons.description_outlined,

                      title: "Documents",

                      subtitle: "License & verification",

                      onTap: () {
                        Navigator.push(
                          context,

                          MaterialPageRoute(
                            builder: (_) => const DocumentsScreen(),
                          ),
                        );
                      },
                    ),

                    divider(),

                    menuTile(
                      context,

                      icon: Icons.account_balance_outlined,

                      title: "Bank Details",

                      subtitle: "Manage payouts",

                      onTap: () {
                        Navigator.push(
                          context,

                          MaterialPageRoute(
                            builder: (_) => const BankDetailsScreen(),
                          ),
                        );
                      },
                    ),

                    divider(),

                    menuTile(
                      context,

                      icon: Icons.settings_outlined,

                      title: "Settings",

                      subtitle: "Notifications & app",

                      onTap: () {
                        Navigator.push(
                          context,

                          MaterialPageRoute(
                            builder: (_) => const SettingsScreen(),
                          ),
                        );
                      },
                    ),

                    divider(),

                    menuTile(
                      context,

                      icon: Icons.support_agent,

                      title: "Support",

                      subtitle: "Help center & contact",

                      onTap: () {
                        Navigator.push(
                          context,

                          MaterialPageRoute(
                            builder: (_) => const HelpSupportScreen(),
                          ),
                        );
                      },
                    ),

                    divider(),

                    menuTile(
                      context,

                      icon: Icons.logout_rounded,

                      title: "Logout",

                      subtitle: "Sign out from account",

                      isLogout: true,

                      onTap: () {
                        Navigator.push(
                          context,

                          MaterialPageRoute(
                            builder: (_) => const DriverLoginScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget modernStatCard(String value, String title) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),

      decoration: BoxDecoration(
        color: const Color(0xffFAFAFA),

        borderRadius: BorderRadius.circular(18),
      ),

      child: Column(
        children: [
          Text(
            value,

            style: GoogleFonts.poppins(
              fontSize: 20,

              fontWeight: FontWeight.w700,

              color: const Color(0xff1A1A1A),
            ),
          ),

          const SizedBox(height: 4),

          Text(
            title,

            style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget infoCard(IconData icon, String title, String value) {
    return Container(
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(26),

        boxShadow: [
          BoxShadow(blurRadius: 18, color: Colors.black.withOpacity(.04)),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Container(
            width: 52,
            height: 52,

            decoration: BoxDecoration(
              color: const Color(0xffFFF8E8),

              borderRadius: BorderRadius.circular(18),
            ),

            child: Icon(icon, color: const Color(0xffF5B400)),
          ),

          const SizedBox(height: 16),

          Text(
            title,

            style: GoogleFonts.poppins(
              fontSize: 13,

              color: Colors.grey.shade600,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            value,

            style: GoogleFonts.poppins(
              fontSize: 20,

              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget divider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),

      child: Divider(color: Colors.grey.shade200, height: 1),
    );
  }

  Widget menuTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    VoidCallback? onTap,
    bool isLogout = false,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),

      onTap:
          onTap ??
          () {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text("$title clicked")));
          },

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),

        child: Row(
          children: [
            Container(
              width: 58,
              height: 58,

              decoration: BoxDecoration(
                color: isLogout
                    ? const Color(0xffFFEAEA)
                    : const Color(0xffFFF8E8),

                borderRadius: BorderRadius.circular(18),
              ),

              child: Icon(
                icon,

                color: isLogout ? Colors.red : const Color(0xffF5B400),

                size: 28,
              ),
            ),

            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    title,

                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,

                      fontSize: 15,

                      color: isLogout ? Colors.red : AppColors.textDark,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    subtitle,

                    style: GoogleFonts.poppins(
                      fontSize: 12,

                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),

            Icon(Icons.chevron_right, color: Colors.grey.shade400, size: 28),
          ],
        ),
      ),
    );
  }
}
