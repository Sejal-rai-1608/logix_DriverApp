import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/trip_data.dart';
import '../theme/app_colors.dart';
import '../widget/driver_bottom_nav.dart';

import 'earnings_screen.dart';
import 'profile_screen.dart';
import 'trips_screen.dart';

class DriverDashboardScreen extends StatelessWidget {
  const DriverDashboardScreen({super.key});
   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 16,
          ),

          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [

              const SizedBox(height: 30),

              topSection(),

              const SizedBox(height: 32),

              overviewCard(),

              const SizedBox(height: 30),

              Text(
                "Today's Trips",
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 18),

              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: trips.length,

                itemBuilder: (context, index) {

                  final trip = trips[index];

                  return tripCard(
                    from: trip["from"]?.toString() ?? "",
                    to: trip["to"]?.toString() ?? "",
                    amount: trip["amount"]?.toString() ?? "",
                    distance: trip["distance"]?.toString() ?? "",
                    time: trip["time"]?.toString() ?? "",
                  );
                },
              )

             
            ],
          ),
        ),
      ),
      bottomNavigationBar:
          const DriverBottomNav(
        currentIndex: 0,
      ),
    );
  }

  Widget topSection() {
    return Row(
      children: [

        Expanded(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [

              Text(
                "Good Morning 🌞",
                style: GoogleFonts.poppins(
                  color: Colors.grey,
                  fontSize: 18,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                "John Driver 👋",
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight:
                      FontWeight.w700,
                ),
              ),
            ],
          ),
        ),

        CircleAvatar(
          radius: 30,
          backgroundColor:
              Colors.grey.shade300,

          child: const Icon(
            Icons.person,
            color: Colors.deepPurple,
            size: 32,
          ),
        )
      ],
    );
  }

  Widget overviewCard() {
    return Container(
      padding:
          const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius:
            BorderRadius.circular(26),

        boxShadow: [
          BoxShadow(
            blurRadius: 15,
            color: Colors.black
                .withOpacity(.03),
          )
        ],
      ),

      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [

          Text(
            "Today's Overview",

            style:
                GoogleFonts.poppins(
              fontSize: 18,
              fontWeight:
                  FontWeight.w700,
            ),
          ),

          const SizedBox(height: 20),

          Row(
            children: [

              overviewItem(
                  "4",
                  "Trips"),

              divider(),

              overviewItem(
                  "320",
                  "KM"),

              divider(),

              overviewItem(
                  "₹2450",
                  "Earn"),
            ],
          )
        ],
      ),
    );
  }

  Widget divider() {
    return Container(
      width: 1,
      height: 60,
      color: Colors.grey.shade300,
    );
  }

  Widget overviewItem(
      String value,
      String title) {
    return Expanded(
      child: Column(
        children: [

          Text(
            value,

            style:
                GoogleFonts.poppins(
              fontSize: 22,
              fontWeight:
                  FontWeight.w700,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            title,

            textAlign:
                TextAlign.center,

            style:
                GoogleFonts.poppins(
              fontSize: 13,
              color:
                  Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget tripCard({
    required String from,
    required String to,
    required String amount,
    required String distance,
    required String time,
  }) {
    return GestureDetector(
      onTap: () {},

      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(16),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              blurRadius: 12,
              color: Colors.black.withOpacity(.03),
            )
          ],
        ),

        child: Column(
          children: [

            Row(
              children: [

                const Icon(
                  Icons.location_on,
                  color: AppColors.yellow2,
                  size: 18,
                ),

                const SizedBox(width: 8),

                Expanded(
                  child: Text(
                    "$from → $to",
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),

                Text(
                  amount,
                  style: GoogleFonts.poppins(
                    color: Colors.green,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 14),

            Row(
              children: [

                Icon(
                  Icons.route,
                  color: Colors.grey.shade600,
                  size: 16,
                ),

                const SizedBox(width: 6),

                Text(
                  distance,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                  ),
                ),

                const Spacer(),

                Icon(
                  Icons.access_time,
                  color: Colors.grey.shade600,
                  size: 16,
                ),

                const SizedBox(width: 6),

                Text(
                  time,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
