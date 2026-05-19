import 'dart:io';

import 'package:drivaer_logixapp/Login/Document_upload_screen.dart';
import 'package:drivaer_logixapp/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class DriverProfileSetupScreen extends StatefulWidget {
  const DriverProfileSetupScreen({super.key});

  @override
  State<DriverProfileSetupScreen> createState() =>
      _DriverProfileSetupScreenState();
}

class _DriverProfileSetupScreenState extends State<DriverProfileSetupScreen> {
  final vehicleController = TextEditingController();
  final licenseController = TextEditingController();
  final addressController = TextEditingController();
  final emergencyController = TextEditingController();

  File? profileImage;

  String selectedVehicle = "Bike";

  final List<String> vehicleTypes = [
    "Bike",
    "Auto",
    "Truck",
    "Tempo",
    "Mini Truck",
  ];

  /// PICK IMAGE
  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 75,
    );

    if (image != null) {
      setState(() {
        profileImage = File(image.path);
      });
    }
  }

  @override
  void dispose() {
    vehicleController.dispose();
    licenseController.dispose();
    addressController.dispose();
    emergencyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),

      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),

          child: Column(
            children: [
              /// HEADER
              Container(
                width: double.infinity,

                padding: const EdgeInsets.fromLTRB(24, 20, 24, 40),

                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.yellow1, AppColors.yellow2],
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
                    /// BACK BUTTON
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },

                      child: Container(
                        width: 48,
                        height: 48,

                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.18),
                          borderRadius: BorderRadius.circular(16),
                        ),

                        child: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    const SizedBox(height: 28),

                    /// TITLE
                    Text(
                      "Complete Your\nDriver Profile",

                      style: GoogleFonts.poppins(
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        height: 1.2,
                      ),
                    ),

                    const SizedBox(height: 12),

                    Text(
                      "Step 2 of 4 • Setup your account details",

                      style: GoogleFonts.poppins(
                        color: Colors.white.withOpacity(0.92),
                        fontSize: 15,
                      ),
                    ),

                    const SizedBox(height: 24),

                    /// PROGRESS BAR
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),

                      child: LinearProgressIndicator(
                        value: 0.5,
                        minHeight: 8,

                        backgroundColor: Colors.white.withOpacity(0.25),

                        valueColor: const AlwaysStoppedAnimation(Colors.white),
                      ),
                    ),
                  ],
                ),
              ),

              /// BODY
              Transform.translate(
                offset: const Offset(0, -28),

                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),

                  child: Column(
                    children: [
                      /// PROFILE CARD
                      Container(
                        padding: const EdgeInsets.all(24),

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),

                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 20,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),

                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: pickImage,

                              child: Stack(
                                children: [
                                  Container(
                                    width: 110,
                                    height: 110,

                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,

                                      gradient: profileImage == null
                                          ? const LinearGradient(
                                              colors: [
                                                Color(0xffFFE0B2),
                                                Color(0xffFFCC80),
                                              ],
                                            )
                                          : null,

                                      image: profileImage != null
                                          ? DecorationImage(
                                              image: FileImage(profileImage!),
                                              fit: BoxFit.cover,
                                            )
                                          : null,
                                    ),

                                    child: profileImage == null
                                        ? const Icon(
                                            Icons.person_rounded,
                                            size: 58,
                                            color: AppColors.yellow2,
                                          )
                                        : null,
                                  ),

                                  Positioned(
                                    bottom: 0,
                                    right: 0,

                                    child: Container(
                                      width: 38,
                                      height: 38,

                                      decoration: BoxDecoration(
                                        color: AppColors.yellow2,

                                        shape: BoxShape.circle,

                                        border: Border.all(
                                          color: Colors.white,
                                          width: 3,
                                        ),
                                      ),

                                      child: const Icon(
                                        Icons.camera_alt_rounded,
                                        size: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 18),

                            Text(
                              "Upload Profile Picture",

                              style: GoogleFonts.poppins(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                              ),
                            ),

                            const SizedBox(height: 6),

                            Text(
                              "Your profile helps customers trust you",

                              textAlign: TextAlign.center,

                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                color: Colors.grey,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 22),

                      /// FORM CARD
                      Container(
                        padding: const EdgeInsets.all(22),

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),

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
                            _buildField(
                              controller: vehicleController,
                              hint: "Vehicle Number",
                              icon: Icons.directions_car_rounded,
                            ),

                            const SizedBox(height: 18),

                            _buildField(
                              controller: licenseController,
                              hint: "Driving License Number",
                              icon: Icons.badge_rounded,
                            ),

                            const SizedBox(height: 18),

                            _buildField(
                              controller: addressController,
                              hint: "Full Address",
                              icon: Icons.location_on_rounded,
                            ),

                            const SizedBox(height: 18),

                            _buildField(
                              controller: emergencyController,
                              hint: "Emergency Contact",
                              icon: Icons.phone_android_rounded,
                              keyboardType: TextInputType.phone,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 22),

                      /// VEHICLE CARD
                      Container(
                        width: double.infinity,

                        padding: const EdgeInsets.all(22),

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),

                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.04),
                              blurRadius: 20,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text(
                              "Select Vehicle Type",

                              style: GoogleFonts.poppins(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                              ),
                            ),

                            const SizedBox(height: 18),

                            Wrap(
                              spacing: 12,
                              runSpacing: 12,

                              children: vehicleTypes.map((type) {
                                final bool isSelected = selectedVehicle == type;

                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedVehicle = type;
                                    });
                                  },

                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 250),

                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 18,
                                      vertical: 14,
                                    ),

                                    decoration: BoxDecoration(
                                      gradient: isSelected
                                          ? const LinearGradient(
                                              colors: [
                                                AppColors.yellow1,
                                                AppColors.yellow2,
                                              ],
                                            )
                                          : null,

                                      color: isSelected
                                          ? null
                                          : const Color(0xffF5F5F5),

                                      borderRadius: BorderRadius.circular(18),
                                    ),

                                    child: Text(
                                      type,

                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,

                                        color: isSelected
                                            ? Colors.white
                                            : Colors.black87,
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 30),

                      /// BUTTON
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const DriverDocumentsScreen(),
                            ),
                          );
                        },

                        child: Container(
                          height: 64,
                          width: double.infinity,

                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [AppColors.yellow1, AppColors.yellow2],
                            ),

                            borderRadius: BorderRadius.circular(24),

                            boxShadow: [
                              BoxShadow(
                                color: AppColors.yellow2.withOpacity(0.35),
                                blurRadius: 20,
                                offset: const Offset(0, 8),
                              ),
                            ],
                          ),

                          alignment: Alignment.center,

                          child: Text(
                            "Continue",

                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
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

  Widget _buildField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Container(
      height: 68,

      decoration: BoxDecoration(
        color: const Color(0xffF7F7F7),
        borderRadius: BorderRadius.circular(22),
      ),

      child: TextField(
        controller: controller,
        keyboardType: keyboardType,

        style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w500),

        decoration: InputDecoration(
          border: InputBorder.none,

          prefixIcon: Icon(icon, color: AppColors.yellow2),

          hintText: hint,

          hintStyle: GoogleFonts.poppins(
            color: Colors.grey.shade500,
            fontSize: 14,
          ),

          contentPadding: const EdgeInsets.symmetric(
            vertical: 22,
            horizontal: 18,
          ),
        ),
      ),
    );
  }
}
