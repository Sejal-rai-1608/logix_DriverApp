import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_colors.dart';
import '../widget/authbutton.dart';
import '../widget/driver_bottom_nav.dart';

import 'on_the_way_screen.dart';

class TripDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> trip;

  const TripDetailsScreen({
    super.key,
    required this.trip,
  });

  @override
  Widget build(BuildContext context) {
    final from = (trip["from"] ?? "Unknown").toString();
    final to = (trip["to"] ?? "Unknown").toString();
    final amount = (trip["amount"] ?? "₹0").toString();
    final distance = (trip["distance"] ?? "0 KM").toString();
    final time = (trip["time"] ?? "--:--").toString();
    final id = (trip["id"] ?? "TRP0000").toString();

    return Scaffold(
      backgroundColor: AppColors.bg,

      bottomNavigationBar:
          const DriverBottomNav(currentIndex: 1),

      body: SafeArea(
        child: SingleChildScrollView(
          padding:
              const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 14,
          ),

          child: Column(
            children: [

              /// Header
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,

                children: [
                  topButton(
                    Icons.arrow_back_ios_new,
                    () {
                      Navigator.pop(context);
                    },
                  ),

                  Text(
                    "Trip Details",
                    style:
                        GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight:
                          FontWeight.w700,
                    ),
                  ),

                  const SizedBox(width: 55)
                ],
              ),

              const SizedBox(height: 18),

              SizedBox(
                height: 130,
                width: double.infinity,

                child: Stack(
                  children: [

                    /// Background image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(24),

                      child: Image.asset(
                        "assets/screen/Trip_details_bg.png",

                        width: double.infinity,
                        height: 130,

                        fit: BoxFit.cover,
                      ),
                    ),

                    /// optional subtle overlay
                    Container(
                      height: 130,

                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(24),

                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,

                          colors: [
                            Colors.white.withOpacity(.03),
                            Colors.white.withOpacity(.10),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
             

              const SizedBox(height: 20),

              /// Main card

              Container(
                padding:
                    const EdgeInsets.all(18),

                decoration:
                    BoxDecoration(
                  color: Colors.white,

                  borderRadius:
                      BorderRadius.circular(
                          28),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black
                          .withOpacity(
                              .03),
                      blurRadius: 20,
                    )
                  ],
                ),

                child: Column(
                  children: [

                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment
                              .spaceBetween,

                      children: [
                        Text(
                          "Trip #$id",
                          style:
                              GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight:
                                FontWeight
                                    .w700,
                          ),
                        ),

                        Container(
                          padding:
                              const EdgeInsets.symmetric(
                            horizontal:
                                14,
                            vertical:
                                8,
                          ),

                          decoration:
                              BoxDecoration(
                            color: Colors
                                .green
                                .withOpacity(
                                    .1),

                            borderRadius:
                                BorderRadius.circular(
                                    14),
                          ),

                          child: Text(
                            "Accepted",
                            style:
                                GoogleFonts.poppins(
                              color: Colors
                                  .green,
                              fontWeight:
                                  FontWeight
                                      .w600,
                            ),
                          ),
                        )
                      ],
                    ),

                    const SizedBox(
                        height: 25),

                    tripLocation(
                      from,
                      "Pickup",
                      time,
                    ),

                    Container(
                      margin:
                          const EdgeInsets.only(
                              left: 14),

                      height: 55,
                      width: 2,
                      color: Colors
                          .grey[300],
                    ),

                    tripLocation(
                      to,
                      "Drop Off",
                      "01:30 PM",
                    ),

                    const SizedBox(
                        height: 20),

                    Divider(),

                    const SizedBox(
                        height: 20),

                    detailRow(
                      Icons.route,
                      "Distance",
                      distance,
                    ),

                    detailRow(
                      Icons.wallet,
                      "Payment",
                      amount,
                    ),

                    detailRow(
                      Icons.inventory_2,
                      "Load Type",
                      "Electronics",
                    ),

                    detailRow(
                      Icons.notes,
                      "Notes",
                      "Handle with care",
                    ),

                    const SizedBox(
                        height: 25),

                    AuthButton(
                      title:
                          "Start Trip",

                      onTap: () {
                        Navigator.push(
                          context,

                          MaterialPageRoute(
                            builder: (_) =>
                                OnTheWayScreen(
                              trip: trip,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget detailRow(
      IconData icon,
      String title,
      String value) {
    return Padding(
      padding:
          const EdgeInsets.only(
              bottom: 20),

      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,

            decoration:
                BoxDecoration(
              color:
                  Colors.amber.shade50,

              borderRadius:
                  BorderRadius.circular(
                      14),
            ),

            child: Icon(
              icon,
              color:
                  Colors.amber[700],
              size: 20,
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Text(
              title,
              style:
                  GoogleFonts.poppins(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
          ),

          Text(
            value,
            style:
                GoogleFonts.poppins(
              fontWeight:
                  FontWeight.w600,
              fontSize: 15,
            ),
          )
        ],
      ),
    );
  }

  Widget tripLocation(
      String city,
      String subtitle,
      String time) {
    return Row(
      children: [

        Container(
          width: 18,
          height: 18,

          decoration:
              BoxDecoration(
            shape:
                BoxShape.circle,
            border: Border.all(
              color: Colors.green,
              width: 5,
            ),
          ),
        ),

        const SizedBox(width: 14),

        Expanded(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment
                    .start,

            children: [
              Text(
                city,
                style:
                    GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight:
                      FontWeight
                          .w700,
                ),
              ),

              Text(
                subtitle,
                style:
                    GoogleFonts.poppins(
                  color:
                      Colors.grey,
                ),
              )
            ],
          ),
        ),

        Text(
          time,
          style:
              GoogleFonts.poppins(
            fontSize: 15,
          ),
        )
      ],
    );
  }

  Widget topButton(
      IconData icon,
      VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        width: 52,
        height: 52,

        decoration:
            BoxDecoration(
          color: Colors.white,

          borderRadius:
              BorderRadius.circular(
                  18),

          boxShadow: [
            BoxShadow(
              blurRadius: 15,
              color: Colors.black
                  .withOpacity(
                      .03),
            )
          ],
        ),

        child: Icon(icon),
      ),
    );
  }
}