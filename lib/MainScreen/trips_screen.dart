import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/trip_data.dart';
import '../theme/app_colors.dart';
import '../widget/driver_bottom_nav.dart';
import '../Trip/trip_details_screen.dart';
import 'driver_dashboard_screen.dart';
import 'earnings_screen.dart';
import 'profile_screen.dart';

class AvailableTripsScreen extends StatefulWidget {
  const AvailableTripsScreen({super.key});

  @override
  State<AvailableTripsScreen> createState() => _AvailableTripsScreenState();
}

class _AvailableTripsScreenState extends State<AvailableTripsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFDF6),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),

          child: Column(
            children: [
              header(),

              const SizedBox(height: 25),

              heroSection(),

              const SizedBox(height: 25),

              ListView.builder(
                itemCount: trips.length,

                shrinkWrap: true,

                physics: const NeverScrollableScrollPhysics(),

                itemBuilder: (context, index) {
                  final trip = trips[index];

                  return tripCard(
                    id: trip["id"]?.toString() ?? "",
                    from: trip["from"]?.toString() ?? "",
                    to: trip["to"]?.toString() ?? "",
                    amount: trip["amount"]?.toString() ?? "",
                    distance: trip["distance"]?.toString() ?? "",
                    time: trip["time"]?.toString() ?? "",
                  );
                },
              ),

              const SizedBox(height: 25),
            ],
          ),
        ),
      ),

      bottomNavigationBar: DriverBottomNav(
        currentIndex: 1,

        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => const DriverDashboardScreen(),
                ),
              );

              break;

            case 1:
              break;

            case 2:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const EarningsScreen()),
              );

              break;

            case 3:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const ProfileScreen()),
              );

              break;
          }
        },
      ),
    );
  }

  Widget header() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },

          child: Container(
            height: 55,
            width: 55,

            decoration: BoxDecoration(
              color: Colors.white,

              borderRadius: BorderRadius.circular(18),

              boxShadow: [
                BoxShadow(blurRadius: 15, color: Colors.black.withOpacity(.03)),
              ],
            ),

            child: const Icon(Icons.arrow_back_ios_new),
          ),
        ),

        const Spacer(),

        Text(
          "Available Trips",

          style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w700),
        ),

        const Spacer(),

        Container(
          height: 55,
          width: 55,

          decoration: BoxDecoration(
            color: Colors.white,

            borderRadius: BorderRadius.circular(18),

            boxShadow: [
              BoxShadow(blurRadius: 15, color: Colors.black.withOpacity(.03)),
            ],
          ),

          child: const Icon(Icons.filter_alt_outlined),
        ),
      ],
    );
  }

  Widget heroSection() {
    return Container(
      height: 130,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),

        gradient: LinearGradient(
          colors: [AppColors.yellow1.withOpacity(.15), Colors.white],
        ),
      ),

      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Text(
                    "Trips Near You",

                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    "Accept available trips and start earning.",

                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(right: 20),

            child: Icon(
              Icons.local_shipping,
              size: 65,
              color: AppColors.yellow2,
            ),
          ),
        ],
      ),
    );
  }

  Widget tripCard({
    required String id,
    required String from,
    required String to,
    required String amount,
    required String distance,
    required String time,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(.03), blurRadius: 15),
        ],
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// route line
          Column(
            children: [
              const Icon(Icons.circle, size: 14, color: Colors.green),

              Container(width: 2, height: 60, color: Colors.grey.shade300),

              const Icon(Icons.location_on, size: 22, color: Colors.red),
            ],
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// route text
                Text(
                  "$from → $to",
                  style: GoogleFonts.poppins(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                const SizedBox(height: 16),

                Row(
                  children: [
                    Expanded(
                      child: infoItem(Icons.route, "Distance", distance),
                    ),

                    const SizedBox(width: 8),

                    Expanded(
                      child: infoItem(Icons.access_time, "Pickup", time),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(width: 10),

          /// amount + button
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,

            children: [
              Text(
                amount,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.green,
                ),
              ),

              const SizedBox(height: 18),

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => TripDetailsScreen(
                        trip: {
                          "id": id,
                          "from": from,
                          "to": to,
                          "amount": amount,
                          "distance": distance,
                          "time": time,
                        },
                      ),
                    ),
                  );
                },

                child: Container(
                  height: 42,
                  width: 100,

                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xffFFD84D), Color(0xffF7B500)],
                    ),

                    borderRadius: BorderRadius.circular(14),
                  ),

                  child: Center(
                    child: Text(
                      "Accept",
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget infoItem(IconData icon, String title, String value) {
    return Column(
      children: [
        Container(
          width: 42,
          height: 42,

          decoration: BoxDecoration(
            color: const Color(0xffFFF8EA),
            borderRadius: BorderRadius.circular(14),
          ),

          child: Icon(icon, size: 20, color: Colors.black87),
        ),

        const SizedBox(height: 8),

        Text(
          title,
          style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
        ),

        const SizedBox(height: 3),

        Text(
          value,
          style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
