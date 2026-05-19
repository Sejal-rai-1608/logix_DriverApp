import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_colors.dart';
import '../trip/trip_details_screen.dart';


class TripsHistoryScreen extends StatefulWidget {
  const TripsHistoryScreen({super.key});

  @override
  State<TripsHistoryScreen> createState() => _TripsHistoryScreenState();
}

class _TripsHistoryScreenState extends State<TripsHistoryScreen> {
  int selectedTab = 0;

  final List<Map<String, dynamic>> trips = [
    {
      "id": "Trip #TRP1234",
      "from": "Bangalore",
      "to": "Mysore",
      "date": "20 May, 10:30 AM",
      "price": "₹850",
      "status": "Completed",
      "image": "assets/logo/truck.png",
    },

    {
      "id": "Trip #TRP1235",
      "from": "Bangalore",
      "to": "Tumkur",
      "date": "20 May, 02:30 PM",
      "price": "₹600",
      "status": "Completed",
      "image": "assets/logo/truck.png",
    },

    {
      "id": "Trip #TRP1236",
      "from": "Bangalore",
      "to": "Hassan",
      "date": "19 May, 11:00 AM",
      "price": "₹950",
      "status": "Cancelled",
      "image": "assets/logo/truck.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    List filteredTrips = selectedTab == 0
        ? trips
        : trips
              .where(
                (e) =>
                    e["status"] ==
                    (selectedTab == 1 ? "Completed" : "Cancelled"),
              )
              .toList();

    return Scaffold(
      backgroundColor: AppColors.bg,

      // bottomNavigationBar: CustomBottomBar(
      //   currentIndex: 1,
      //   gestureDetector: (index) {
      //     onTap:
      //     (index) {
      //       print(index);
      //     };
      //   },
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),

          child: Column(
            children: [
              /// top row
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },

                    child: Container(
                      width: 56,
                      height: 56,

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

                      child: const Icon(Icons.arrow_back_ios_new),
                    ),
                  ),

                  const Spacer(),

                  Text(
                    "Trips History",
                    style: GoogleFonts.poppins(
                      fontSize: 21,

                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  const Spacer(),

                  const SizedBox(width: 56),
                ],
              ),

              const SizedBox(height: 25),

              /// tabs
              Container(
                padding: const EdgeInsets.all(8),

                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.circular(26),
                ),

                child: Row(
                  children: [
                    tabItem(0, Icons.grid_view_rounded, "All"),

                    divider(),

                    tabItem(1, Icons.check_circle_outline, "Completed"),

                    divider(),

                    tabItem(2, Icons.cancel_outlined, "Canceled"),
                  ],
                ),
              ),

              const SizedBox(height: 26),

              ListView.builder(
                shrinkWrap: true,

                physics: const NeverScrollableScrollPhysics(),

                itemCount: filteredTrips.length,

                itemBuilder: (_, index) {
                  final trip = filteredTrips[index];

                  return tripCard(trip);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget divider() {
    return Container(width: 1, height: 45, color: Colors.grey.shade300);
  }

  Widget tabItem(int index, IconData icon, String title) {
    bool selected = selectedTab == index;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedTab = index;
          });
        },

        child: Container(
          height: 62,

          decoration: BoxDecoration(
            color: selected ? const Color(0xffFFF8E2) : Colors.white,

            borderRadius: BorderRadius.circular(22),

            border: selected
                ? Border.all(color: const Color(0xffF4B400))
                : null,
          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Icon(
                icon,

                color: selected ? const Color(0xffF4B400) : Colors.grey,
              ),

              const SizedBox(width: 8),

              Text(
                title,

                style: GoogleFonts.poppins(
                  color: selected ? const Color(0xffF4B400) : Colors.grey,

                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget tripCard(Map<String, dynamic> trip) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => TripDetailsScreen(trip: trip)),
        );
      },

      child: Container(
        margin: const EdgeInsets.only(bottom: 18),
        padding: const EdgeInsets.all(14),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(28),

          boxShadow: [
            BoxShadow(blurRadius: 14, color: Colors.black.withOpacity(.04)),
          ],
        ),

        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              /// truck image
              Container(
                width: 75,
                height: 75,

                decoration: BoxDecoration(
                  color: const Color(0xffFFF6E4),
                  shape: BoxShape.circle,
                ),

                child: Padding(
                  padding: const EdgeInsets.all(12),

                  child: Image.asset(
                    trip["image"] ?? "assets/logo/truck.png",
                    fit: BoxFit.contain,

                    errorBuilder: (_, __, ___) {
                      return const Icon(
                        Icons.local_shipping,
                        size: 35,
                        color: Color(0xffF4B400),
                      );
                    },
                  ),
                ),
              ),

              const SizedBox(width: 14),

              /// middle content
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      trip["id"],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,

                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      "${trip["from"]} → ${trip["to"]}",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,

                      style: GoogleFonts.poppins(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                    ),

                    const SizedBox(height: 12),

                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          size: 14,
                          color: Colors.grey,
                        ),

                        const SizedBox(width: 8),

                        Expanded(
                          child: Text(
                            trip["date"],
                            overflow: TextOverflow.ellipsis,

                            style: GoogleFonts.poppins(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Container(
                width: 1,
                margin: const EdgeInsets.symmetric(horizontal: 10),

                color: Colors.grey.shade300,
              ),

              /// right section
              Expanded(
                flex: 2,

                child: Column(
                  children: [
                    Text(
                      trip["price"],

                      style: GoogleFonts.poppins(
                        color: Colors.green,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),

                      decoration: BoxDecoration(
                        color: trip["status"] == "Completed"
                            ? Colors.green.withOpacity(.12)
                            : Colors.red.withOpacity(.12),

                        borderRadius: BorderRadius.circular(12),
                      ),

                      child: Text(
                        trip["status"],

                        style: GoogleFonts.poppins(
                          fontSize: 12,

                          color: trip["status"] == "Completed"
                              ? Colors.green
                              : Colors.red,
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Icon(
                      Icons.chevron_right,
                      size: 28,
                      color: Colors.grey,
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
}
