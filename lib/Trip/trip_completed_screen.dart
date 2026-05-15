import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../MainScreen/driver_dashboard_screen.dart';
import '../theme/app_colors.dart';
import '../widget/AuthButton.dart';
import '../widget/driver_bottom_nav.dart';

class TripCompletedScreen extends StatelessWidget {
  final Map<String, dynamic> trip;

  const TripCompletedScreen({
    super.key,
    required this.trip,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,

      bottomNavigationBar: const DriverBottomNav(
        currentIndex: 0,
      ),

      body: Stack(
        children: [

          /// BACKGROUND TRUCK IMAGE
          Positioned.fill(
            child: Image.asset(
              "assets/screen/trip_completed_bg.png",
              fit: BoxFit.cover,
            ),
          ),

          /// BIG GREEN TICK IMAGE
          Positioned(
            top: 120,
            left: 0,
            right: 0,
            child: Center(
              child: Image.asset(
                "assets/screen/completed_tick.png",
                width: 240,
                height: 240,
              ),
            ),
          ),

          /// MAIN CONTENT
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 14,
              ),

              child: Column(
                children: [

                  /// TOP BAR
                  Row(
                    children: [

                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },

                        child: Container(
                          width:58,
                          height:58,

                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(12),

                            boxShadow:[
                              BoxShadow(
                                blurRadius:18,
                                color: Colors.black
                                    .withOpacity(.04),
                              )
                            ],
                          ),

                          child: const Icon(
                            Icons.arrow_back_ios_new,
                          ),
                        ),
                      ),

                      const Spacer(),

                      Text(
                        "Trip Completed",
                        style:
                            GoogleFonts.poppins(
                          fontSize:20,
                          fontWeight:
                              FontWeight.w700,
                        ),
                      ),

                      const Spacer(),

                      const SizedBox(width:58)
                    ],
                  ),

                  /// IMPORTANT:
                  /// space for tick image
                  const SizedBox(height:320),

                  Text(
                    "Great Job!",
                    style:
                        GoogleFonts.poppins(
                      fontWeight:
                          FontWeight.w700,
                      fontSize:34,
                    ),
                  ),

                  const SizedBox(height:6),

                  Text(
                    "You've completed the trip.",
                    style:
                        GoogleFonts.poppins(
                      color:
                          Colors.grey.shade600,
                      fontSize:16,
                    ),
                  ),

                  const SizedBox(height:35),

                  Container(
                    padding:
                        const EdgeInsets.all(25),

                    decoration:
                        BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(30),

                      boxShadow:[
                        BoxShadow(
                          blurRadius:30,
                          color: Colors.black
                              .withOpacity(.05),
                        )
                      ],
                    ),

                    child: Column(
                      children:[

                        Row(
                          children:[

                            Container(
                              width:50,
                              height:50,

                              decoration:
                                  const BoxDecoration(
                                color:
                                    Color(0xffFFE98A),
                                shape:
                                    BoxShape.circle,
                              ),

                              child:
                                  const Icon(
                                Icons.local_shipping,
                              ),
                            ),

                            const SizedBox(width:14),

                            Text(
                              (trip["id"] ??
                              "Trip #TRP0000")
                                  .toString(),

                              style:
                                  GoogleFonts.poppins(
                                fontSize:20,
                                fontWeight:
                                    FontWeight.w700,
                              ),
                            )
                          ],
                        ),

                        const SizedBox(height:25),

                        Divider(
                          color:
                              Colors.grey.shade300,
                        ),

                        const SizedBox(height:25),

                        Text(
                          "Total Earnings",

                          style:
                              GoogleFonts.poppins(
                            color:
                                Colors.grey,
                            fontSize:18,
                          ),
                        ),

                        const SizedBox(height:14),

                        Text(
                          (trip["price"] ??
                                  "₹0")
                              .toString(),

                          style:
                              GoogleFonts.poppins(
                            fontWeight:
                                FontWeight.w700,

                            fontSize:58,

                            color:
                                Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height:35),

                  AuthButton(
                    title:"Back to Home",

                    onTap:(){

                      Navigator.pushAndRemoveUntil(
                        context,

                        MaterialPageRoute(
                          builder:(_)=>
                          const DriverDashboardScreen(),
                        ),

                        (route)=>false,
                      );
                    },
                  ),

                  const SizedBox(height:40)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}