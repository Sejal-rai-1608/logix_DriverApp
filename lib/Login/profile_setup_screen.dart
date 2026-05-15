import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_colors.dart';
import '../widget/AuthButton.dart';
import '../widget/profile_input_card.dart';
import 'package:drivaer_logixapp/Login/Document_upload_screen.dart';

class DriverProfileSetupScreen extends StatefulWidget {
  const DriverProfileSetupScreen({super.key});

  @override
  State<DriverProfileSetupScreen> createState() =>
      _DriverProfileSetupScreenState();
}

class _DriverProfileSetupScreenState
    extends State<DriverProfileSetupScreen> {

  final vehicleController =
      TextEditingController();

  final licenseController =
      TextEditingController();

  final addressController =
      TextEditingController();

  final emergencyController =
      TextEditingController();

  String? selectedVehicle;

  final vehicleTypes = [
    "Bike",
    "Auto",
    "Mini Truck",
    "Truck",
    "Tempo",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 22,
            vertical: 16,
          ),

          child: Column(
            children: [

              /// Back Button
              Align(
                alignment:
                    Alignment.centerLeft,

                child: GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },

                  child: Container(
                    width: 54,
                    height: 54,

                    decoration:
                        BoxDecoration(
                      color:
                          Colors.white,

                      borderRadius:
                          BorderRadius.circular(
                              18),

                      boxShadow: [

                        BoxShadow(
                          blurRadius:
                              15,

                          color: Colors
                              .black
                              .withOpacity(
                                  .03),
                        )
                      ],
                    ),

                    child: const Icon(
                      Icons
                          .arrow_back_ios_new,
                      size: 22,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 22),

              Text(
                "Complete Your Profile",

                textAlign:
                    TextAlign.center,

                style:
                    GoogleFonts.poppins(
                  fontSize: 28,

                  fontWeight:
                      FontWeight.w700,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                "Please provide your details to continue",

                textAlign:
                    TextAlign.center,

                style:
                    GoogleFonts.poppins(
                  color:
                      Colors.grey.shade500,

                  fontSize: 15,
                ),
              ),

              const SizedBox(height: 25),

              profileSection(),

              const SizedBox(height: 28),

              Container(
                padding:
                    const EdgeInsets.all(
                        18),

                decoration:
                    BoxDecoration(
                  color:
                      Colors.white,

                  borderRadius:
                      BorderRadius.circular(
                          28),

                  boxShadow: [

                    BoxShadow(
                      blurRadius:
                          20,

                      color: Colors
                          .black
                          .withOpacity(
                              .03),
                    )
                  ],
                ),

                child: Column(
                  children: [

                    ProfileInputCard(
                      icon:
                          Icons.car_rental,

                      title:
                          "Vehicle Number",

                      hint:
                          "KA 01 AB 1234",

                      controller:
                          vehicleController,
                    ),

                    vehicleDropdown(),

                    ProfileInputCard(
                      icon:
                          Icons.badge,

                      title:
                          "Driving License Number",

                      hint:
                          "Enter license number",

                      controller:
                          licenseController,
                    ),

                    ProfileInputCard(
                      icon:
                          Icons.location_on_outlined,

                      title:
                          "Address",

                      hint:
                          "Enter full address",

                      controller:
                          addressController,
                    ),

                    ProfileInputCard(
                      icon:
                          Icons.phone,

                      title:
                          "Emergency Contact",

                      hint:
                          "Enter emergency number",

                      keyboardType:
                          TextInputType.phone,

                      controller:
                          emergencyController,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              AuthButton(
                title: "Continue",

                onTap: () {

                 Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_)=>const DriverDocumentsScreen(),
                    )
                  );
                },
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }


  Widget vehicleDropdown() {
    return Container(
      margin:
          const EdgeInsets.only(
              bottom: 14),

      padding:
          const EdgeInsets.symmetric(
              horizontal: 14),

      decoration:
          BoxDecoration(

        borderRadius:
            BorderRadius.circular(
                22),

        border: Border.all(
          color:
              Colors.grey.shade200,
        ),
      ),

      child: Row(
        children: [

          Container(
            width: 52,
            height: 52,

            decoration:
                BoxDecoration(
              color:
                  const Color(
                      0xffFFF8EA),

              borderRadius:
                  BorderRadius.circular(
                      16),
            ),

            child: const Icon(
              Icons.local_shipping,
              size: 24,
            ),
          ),

          const SizedBox(width:14),

          Expanded(
            child:
                DropdownButtonHideUnderline(

              child:
                  DropdownButton<String>(

                value:
                    selectedVehicle,

                hint: Text(
                  "Select Vehicle Type",

                  style:
                      GoogleFonts.poppins(
                    fontSize: 16,
                  ),
                ),

                isExpanded: true,

                items: vehicleTypes
                    .map((e) {

                  return DropdownMenuItem(
                    value: e,

                    child: Text(
                      e,
                    ),
                  );
                }).toList(),

                onChanged:(value){

                  setState(() {

                    selectedVehicle =
                        value;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget profileSection() {

    return Stack(
      alignment:
          Alignment.bottomRight,

      children: [

        Container(
          width: 150,
          height: 150,

          decoration:
              BoxDecoration(

            color:
                Colors.grey.shade300,

            shape:
                BoxShape.circle,

            border: Border.all(
              width: 8,

              color:
                  Colors.white,
            ),
          ),

          child: Icon(
            Icons.person,

            size: 80,

            color:
                Colors.grey[500],
          ),
        ),

        GestureDetector(
          onTap: () {

            /// image picker later
          },

          child: Container(
            width: 52,
            height: 52,

            decoration:
                BoxDecoration(

              gradient:
                  const LinearGradient(
                colors: [

                  AppColors.yellow1,

                  AppColors.yellow2
                ],
              ),

              shape:
                  BoxShape.circle,

              border: Border.all(
                width: 4,
                color: Colors.white,
              ),
            ),

            child: const Icon(
              Icons.camera_alt,
              size: 24,
            ),
          ),
        ),
      ],
    );
  }
}