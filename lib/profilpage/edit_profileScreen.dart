import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() =>
      _EditProfileScreenState();
}

class _EditProfileScreenState
    extends State<EditProfileScreen> {
  final nameController =
      TextEditingController(
    text: "John Driver",
  );

  final phoneController =
      TextEditingController(
    text: "+91 9876543210",
  );

  final emailController =
      TextEditingController(
    text: "john@gmail.com",
  );

  final cityController =
      TextEditingController(
    text: "Mumbai",
  );

  File? profileImage;

  bool isSaving = false;

  Future<void> pickImage() async {
    final picked =
        await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 70,
    );

    if (picked != null) {
      setState(() {
        profileImage = File(
          picked.path,
        );
      });
    }
  }

  Future<void> saveProfile() async {
    setState(() {
      isSaving = true;
    });

    await Future.delayed(
      const Duration(seconds: 2),
    );

    if (!mounted) return;

    setState(() {
      isSaving = false;
    });

    ScaffoldMessenger.of(context)
        .showSnackBar(
      const SnackBar(
        content: Text(
          "Profile Updated Successfully",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xffFFFBF0),

      body: SafeArea(
        child: SingleChildScrollView(
          physics:
              const BouncingScrollPhysics(),

          padding:
              const EdgeInsets.fromLTRB(
            18,
            18,
            18,
            30,
          ),

          child: Column(
            children: [
              /// TOP BAR
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(
                        context,
                      );
                    },

                    child: Container(
                      width: 52,
                      height: 52,

                      decoration:
                          BoxDecoration(
                        color: Colors.white,

                        borderRadius:
                            BorderRadius
                                .circular(
                          18,
                        ),

                        boxShadow: [
                          BoxShadow(
                            blurRadius: 14,

                            color: Colors
                                .black
                                .withOpacity(
                                    .04),
                          ),
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
                    "Edit Profile",

                    style:
                        GoogleFonts
                            .poppins(
                      fontSize: 24,
                      fontWeight:
                          FontWeight
                              .w700,
                    ),
                  ),

                  const Spacer(),

                  const SizedBox(
                    width: 52,
                  ),
                ],
              ),

              const SizedBox(height: 34),

              /// PROFILE IMAGE
              Stack(
                children: [
                  Container(
                    width: 150,
                    height: 150,

                    decoration:
                        BoxDecoration(
                      shape: BoxShape
                          .circle,

                      border: Border.all(
                        color:
                            Colors.white,
                        width: 5,
                      ),

                      boxShadow: [
                        BoxShadow(
                          blurRadius: 20,
                          color: Colors
                              .black
                              .withOpacity(
                                  .08),
                        ),
                      ],

                      image: DecorationImage(
                        fit: BoxFit.cover,

                        image:
                            profileImage !=
                                    null
                                ? FileImage(
                                    profileImage!,
                                  )
                                : const AssetImage(
                                        "assets/screen/driver_verification.png",
                                      )
                                    as ImageProvider,
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: 8,
                    right: 8,

                    child: GestureDetector(
                      onTap: pickImage,

                      child: Container(
                        width: 46,
                        height: 46,

                        decoration:
                            BoxDecoration(
                          gradient:
                              const LinearGradient(
                            colors: [
                              Color(
                                0xffFFD84D,
                              ),
                              Color(
                                0xffF7B500,
                              ),
                            ],
                          ),

                          shape:
                              BoxShape.circle,
                        ),

                        child: const Icon(
                          Icons.camera_alt,
                          color:
                              Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 34),

              /// FORM CARD
              Container(
                padding:
                    const EdgeInsets.all(
                  22,
                ),

                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius:
                      BorderRadius.circular(
                    32,
                  ),

                  boxShadow: [
                    BoxShadow(
                      blurRadius: 18,

                      color: Colors
                          .black
                          .withOpacity(
                              .04),
                    ),
                  ],
                ),

                child: Column(
                  children: [
                    profileField(
                      "Full Name",
                      Icons.person_outline,
                      nameController,
                    ),

                    const SizedBox(
                        height: 18),

                    profileField(
                      "Phone Number",
                      Icons.phone_outlined,
                      phoneController,
                    ),

                    const SizedBox(
                        height: 18),

                    profileField(
                      "Email Address",
                      Icons.email_outlined,
                      emailController,
                    ),

                    const SizedBox(
                        height: 18),

                    profileField(
                      "City",
                      Icons.location_on_outlined,
                      cityController,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              /// SAVE BUTTON
              GestureDetector(
                onTap:
                    isSaving
                        ? null
                        : saveProfile,

                child: AnimatedContainer(
                  duration:
                      const Duration(
                    milliseconds: 250,
                  ),

                  height: 64,
                  width: double.infinity,

                  decoration:
                      BoxDecoration(
                    gradient:
                        const LinearGradient(
                      colors: [
                        Color(
                          0xffFFD84D,
                        ),
                        Color(
                          0xffF7B500,
                        ),
                      ],
                    ),

                    borderRadius:
                        BorderRadius.circular(
                      22,
                    ),

                    boxShadow: [
                      BoxShadow(
                        blurRadius: 18,

                        offset:
                            const Offset(
                          0,
                          8,
                        ),

                        color: const Color(
                          0xffF7B500,
                        ).withOpacity(.3),
                      ),
                    ],
                  ),

                  alignment:
                      Alignment.center,

                  child:
                      isSaving
                          ? const SizedBox(
                            width: 24,
                            height: 24,

                            child:
                                CircularProgressIndicator(
                              strokeWidth:
                                  2.5,

                              color:
                                  Colors.black,
                            ),
                          )
                          : Text(
                            "Save Changes",

                            style:
                                GoogleFonts.poppins(
                              fontSize:
                                  17,

                              fontWeight:
                                  FontWeight
                                      .w700,

                              color:
                                  Colors.black,
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

  Widget profileField(
    String hint,
    IconData icon,
    TextEditingController controller,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(
          0xffFFF8E8,
        ),

        borderRadius:
            BorderRadius.circular(
          20,
        ),
      ),

      child: TextFormField(
        controller: controller,

        style: GoogleFonts.poppins(
          fontWeight:
              FontWeight.w500,
        ),

        decoration: InputDecoration(
          border: InputBorder.none,

          contentPadding:
              const EdgeInsets.symmetric(
            vertical: 20,
          ),

          prefixIcon: Icon(
            icon,
            color: const Color(
              0xffF5B400,
            ),
          ),

          hintText: hint,

          hintStyle:
              GoogleFonts.poppins(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}