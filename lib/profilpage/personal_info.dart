import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class PersonalInformationScreen extends StatefulWidget {
  const PersonalInformationScreen({super.key});

  @override
  State<PersonalInformationScreen> createState() =>
      _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
  final fullNameController = TextEditingController(text: "John Driver");

  final emailController = TextEditingController(text: "john.driver@gmail.com");

  final phoneController = TextEditingController(text: "+91 9876543210");

  final cityController = TextEditingController(text: "Mumbai");

  final addressController = TextEditingController(
    text: "Bandra West, Mumbai, Maharashtra",
  );

  final licenseController = TextEditingController(text: "DL-09-2025-XYZ");

  File? profileImage;

  bool isSaving = false;

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

  Future<void> saveChanges() async {
    setState(() {
      isSaving = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    setState(() {
      isSaving = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Profile Updated Successfully")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFBF0),

      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),

          padding: const EdgeInsets.fromLTRB(18, 18, 18, 30),

          child: Column(
            children: [
              /// TOP BAR
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },

                    child: Container(
                      width: 50,
                      height: 50,

                      decoration: BoxDecoration(
                        color: Colors.white,

                        borderRadius: BorderRadius.circular(18),

                        boxShadow: [
                          BoxShadow(
                            blurRadius: 16,

                            color: Colors.black.withOpacity(.04),
                          ),
                        ],
                      ),

                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,

                        size: 20,
                      ),
                    ),
                  ),

                  const SizedBox(width: 16),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text(
                        "Personal Information",

                        style: GoogleFonts.poppins(
                          fontSize: 22,

                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      const SizedBox(height: 2),

                      Text(
                        "Manage your profile details",

                        style: GoogleFonts.poppins(
                          fontSize: 13,

                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 30),

              /// PROFILE SECTION
              Container(
                padding: const EdgeInsets.all(24),

                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.circular(32),

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
                    Stack(
                      children: [
                        Container(
                          width: 120,
                          height: 120,

                          decoration: BoxDecoration(
                            shape: BoxShape.circle,

                            border: Border.all(color: Colors.white, width: 4),

                            boxShadow: [
                              BoxShadow(
                                blurRadius: 18,

                                color: Colors.black.withOpacity(.08),
                              ),
                            ],

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
                              width: 40,
                              height: 40,

                              decoration: BoxDecoration(
                                color: const Color(0xff1A1A1A),

                                shape: BoxShape.circle,
                              ),

                              child: const Icon(
                                Icons.edit,

                                size: 18,

                                color: Colors.white,
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

                    const SizedBox(height: 6),

                    Text(
                      "Premium Verified Driver",

                      style: GoogleFonts.poppins(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),

                    const SizedBox(height: 22),

                    Row(
                      children: [
                        Expanded(child: miniCard("248", "Trips")),

                        const SizedBox(width: 12),

                        Expanded(child: miniCard("4.8", "Rating")),

                        const SizedBox(width: 12),

                        Expanded(child: miniCard("2Y", "Experience")),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              /// FORM SECTION
              Container(
                padding: const EdgeInsets.all(22),

                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.circular(32),

                  boxShadow: [
                    BoxShadow(
                      blurRadius: 18,

                      color: Colors.black.withOpacity(.04),
                    ),
                  ],
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    sectionTitle("Basic Information"),

                    const SizedBox(height: 18),

                    profileField(
                      "Full Name",
                      Icons.person_outline,
                      fullNameController,
                    ),

                    const SizedBox(height: 18),

                    profileField(
                      "Email Address",
                      Icons.email_outlined,
                      emailController,
                    ),

                    const SizedBox(height: 18),

                    profileField(
                      "Phone Number",
                      Icons.phone_outlined,
                      phoneController,
                    ),

                    const SizedBox(height: 28),

                    sectionTitle("Location Details"),

                    const SizedBox(height: 18),

                    profileField(
                      "City",
                      Icons.location_city_outlined,
                      cityController,
                    ),

                    const SizedBox(height: 18),

                    profileField(
                      "Address",
                      Icons.location_on_outlined,
                      addressController,
                    ),

                    const SizedBox(height: 28),

                    sectionTitle("Driver Information"),

                    const SizedBox(height: 18),

                    profileField(
                      "License Number",
                      Icons.badge_outlined,
                      licenseController,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              /// ACCOUNT STATUS
              Container(
                padding: const EdgeInsets.all(22),

                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.circular(32),

                  boxShadow: [
                    BoxShadow(
                      blurRadius: 18,

                      color: Colors.black.withOpacity(.04),
                    ),
                  ],
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    sectionTitle("Verification Status"),

                    const SizedBox(height: 22),

                    statusTile(
                      Icons.verified_user,
                      "Account Verified",
                      "Active",
                      Colors.green,
                    ),

                    const SizedBox(height: 18),

                    statusTile(
                      Icons.badge_outlined,
                      "Driving License",
                      "Approved",
                      Colors.green,
                    ),

                    const SizedBox(height: 18),

                    statusTile(
                      Icons.local_shipping_outlined,
                      "Vehicle Verification",
                      "Pending",
                      Colors.orange,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 34),

              /// SAVE BUTTON
              GestureDetector(
                onTap: isSaving ? null : saveChanges,

                child: Container(
                  height: 64,
                  width: double.infinity,

                  decoration: BoxDecoration(
                    color: const Color(0xff1A1A1A),

                    borderRadius: BorderRadius.circular(22),

                    boxShadow: [
                      BoxShadow(
                        blurRadius: 18,

                        offset: const Offset(0, 8),

                        color: Colors.black.withOpacity(.15),
                      ),
                    ],
                  ),

                  alignment: Alignment.center,

                  child: isSaving
                      ? const SizedBox(
                          width: 24,
                          height: 24,

                          child: CircularProgressIndicator(
                            strokeWidth: 2.5,

                            color: Colors.white,
                          ),
                        )
                      : Text(
                          "Save Changes",

                          style: GoogleFonts.poppins(
                            fontSize: 16,

                            fontWeight: FontWeight.w700,

                            color: Colors.white,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Text(
      title,

      style: GoogleFonts.poppins(
        fontSize: 18,

        fontWeight: FontWeight.w700,

        color: const Color(0xff1A1A1A),
      ),
    );
  }

  Widget miniCard(String value, String title) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),

      decoration: BoxDecoration(
        color: const Color(0xffF8F8F8),

        borderRadius: BorderRadius.circular(18),
      ),

      child: Column(
        children: [
          Text(
            value,

            style: GoogleFonts.poppins(
              fontSize: 20,

              fontWeight: FontWeight.w700,
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

  Widget profileField(
    String hint,
    IconData icon,
    TextEditingController controller,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffF8F8F8),

        borderRadius: BorderRadius.circular(20),
      ),

      child: TextFormField(
        controller: controller,

        style: GoogleFonts.poppins(fontWeight: FontWeight.w500),

        decoration: InputDecoration(
          border: InputBorder.none,

          contentPadding: const EdgeInsets.symmetric(vertical: 20),

          prefixIcon: Icon(icon, color: Colors.grey),

          hintText: hint,

          hintStyle: GoogleFonts.poppins(color: Colors.grey),
        ),
      ),
    );
  }

  Widget statusTile(IconData icon, String title, String status, Color color) {
    return Row(
      children: [
        Container(
          width: 54,
          height: 54,

          decoration: BoxDecoration(
            color: color.withOpacity(.10),

            borderRadius: BorderRadius.circular(18),
          ),

          child: Icon(icon, color: color),
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
                ),
              ),

              const SizedBox(height: 4),

              Text(
                status,

                style: GoogleFonts.poppins(
                  color: color,

                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),

        Icon(Icons.chevron_right, color: Colors.grey.shade400),
      ],
    );
  }
}
