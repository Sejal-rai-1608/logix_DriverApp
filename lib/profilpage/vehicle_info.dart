import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VehicleInformationScreen extends StatefulWidget {
  const VehicleInformationScreen({super.key});

  @override
  State<VehicleInformationScreen> createState() =>
      _VehicleInformationScreenState();
}

class _VehicleInformationScreenState extends State<VehicleInformationScreen> {
  final vehicleNameController = TextEditingController(
    text: "Mahindra Bolero Pickup",
  );

  final vehicleNumberController = TextEditingController(text: "MH 48 DK 2025");

  final vehicleTypeController = TextEditingController(
    text: "Commercial Pickup",
  );

  final insuranceController = TextEditingController(
    text: "Valid till Dec 2026",
  );

  final rcController = TextEditingController(text: "Verified");

  final permitController = TextEditingController(text: "National Permit");

  bool isSaving = false;

  Future<void> saveVehicleInfo() async {
    setState(() {
      isSaving = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    setState(() {
      isSaving = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Vehicle Information Updated")),
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
            crossAxisAlignment: CrossAxisAlignment.start,

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
                            blurRadius: 14,

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
                        "Vehicle Information",

                        style: GoogleFonts.poppins(
                          fontSize: 22,

                          fontWeight: FontWeight.w700,

                          color: const Color(0xff1A1A1A),
                        ),
                      ),

                      const SizedBox(height: 3),

                      Text(
                        "Manage your vehicle details",

                        style: GoogleFonts.poppins(
                          fontSize: 13,

                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 28),

              /// VEHICLE CARD
              Container(
                width: double.infinity,

                padding: const EdgeInsets.all(22),

                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xffFFD84D), Color(0xffF7B500)],

                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),

                  borderRadius: BorderRadius.circular(30),

                  boxShadow: [
                    BoxShadow(
                      blurRadius: 18,

                      offset: const Offset(0, 8),

                      color: const Color(0xffF7B500).withOpacity(.25),
                    ),
                  ],
                ),

                child: Row(
                  children: [
                    Container(
                      width: 90,
                      height: 90,

                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.25),

                        borderRadius: BorderRadius.circular(24),
                      ),

                      child: const Icon(
                        Icons.local_shipping_rounded,

                        size: 46,

                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(width: 18),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text(
                            "Mahindra Bolero",

                            style: GoogleFonts.poppins(
                              fontSize: 22,

                              fontWeight: FontWeight.w700,

                              color: Colors.white,
                            ),
                          ),

                          const SizedBox(height: 6),

                          Text(
                            "Commercial Pickup",

                            style: GoogleFonts.poppins(
                              color: Colors.white70,

                              fontSize: 13,
                            ),
                          ),

                          const SizedBox(height: 14),

                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),

                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(.20),

                              borderRadius: BorderRadius.circular(30),
                            ),

                            child: Text(
                              "Verified Vehicle",

                              style: GoogleFonts.poppins(
                                color: Colors.white,

                                fontWeight: FontWeight.w600,

                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 26),

              /// QUICK STATS
              Row(
                children: [
                  Expanded(child: statCard("248", "Trips")),

                  const SizedBox(width: 12),

                  Expanded(child: statCard("4.8", "Rating")),

                  const SizedBox(width: 12),

                  Expanded(child: statCard("2024", "Model")),
                ],
              ),

              const SizedBox(height: 28),

              /// VEHICLE DETAILS
              sectionTitle("Vehicle Details"),

              const SizedBox(height: 18),

              infoTile(
                "Vehicle Name",
                vehicleNameController.text,
                Icons.local_shipping_outlined,
              ),

              infoTile(
                "Vehicle Number",
                vehicleNumberController.text,
                Icons.pin_outlined,
              ),

              infoTile(
                "Vehicle Type",
                vehicleTypeController.text,
                Icons.category_outlined,
              ),

              const SizedBox(height: 28),

              /// VERIFICATION
              sectionTitle("Verification Details"),

              const SizedBox(height: 18),

              statusTile("Insurance", insuranceController.text, Colors.green),

              const SizedBox(height: 14),

              statusTile("RC Verification", rcController.text, Colors.blue),

              const SizedBox(height: 14),

              statusTile("Permit Type", permitController.text, Colors.orange),

              const SizedBox(height: 34),

              /// SAVE BUTTON
              GestureDetector(
                onTap: isSaving ? null : saveVehicleInfo,

                child: Container(
                  height: 62,
                  width: double.infinity,

                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xffFFD84D), Color(0xffF7B500)],
                    ),

                    borderRadius: BorderRadius.circular(22),
                  ),

                  alignment: Alignment.center,

                  child: isSaving
                      ? const SizedBox(
                          width: 24,
                          height: 24,

                          child: CircularProgressIndicator(
                            strokeWidth: 2.5,

                            color: Colors.black,
                          ),
                        )
                      : Text(
                          "Save Changes",

                          style: GoogleFonts.poppins(
                            fontSize: 16,

                            fontWeight: FontWeight.w700,

                            color: Colors.black,
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

  Widget statCard(String value, String title) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(22),

        boxShadow: [
          BoxShadow(blurRadius: 14, color: Colors.black.withOpacity(.03)),
        ],
      ),

      child: Column(
        children: [
          Text(
            value,

            style: GoogleFonts.poppins(
              fontSize: 18,

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

  Widget infoTile(String title, String value, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),

      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(24),

        boxShadow: [
          BoxShadow(blurRadius: 14, color: Colors.black.withOpacity(.03)),
        ],
      ),

      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,

            decoration: BoxDecoration(
              color: const Color(0xffFFF7DB),

              borderRadius: BorderRadius.circular(16),
            ),

            child: Icon(icon, color: const Color(0xffF7B500)),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  title,

                  style: GoogleFonts.poppins(fontSize: 13, color: Colors.grey),
                ),

                const SizedBox(height: 5),

                Text(
                  value,

                  style: GoogleFonts.poppins(
                    fontSize: 15,

                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          Icon(Icons.chevron_right, color: Colors.grey.shade400),
        ],
      ),
    );
  }

  Widget statusTile(String title, String status, Color color) {
    return Container(
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(24),

        boxShadow: [
          BoxShadow(blurRadius: 14, color: Colors.black.withOpacity(.03)),
        ],
      ),

      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,

            decoration: BoxDecoration(
              color: color.withOpacity(.12),

              borderRadius: BorderRadius.circular(16),
            ),

            child: Icon(Icons.verified, color: color),
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
        ],
      ),
    );
  }
}
