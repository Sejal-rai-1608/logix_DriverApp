import 'package:drivaer_logixapp/widget/custom_bottombar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DriverDashboardScreen extends StatefulWidget {
  const DriverDashboardScreen({super.key});

  @override
  State<DriverDashboardScreen> createState() => _DriverDashboardScreenState();
}

class _DriverDashboardScreenState extends State<DriverDashboardScreen> {
  bool isOnline = true;

  final List<Map<String, dynamic>> trips = [
    {
      "from": "Andheri",
      "to": "Bandra",
      "amount": "₹450",
      "distance": "12 KM",
      "time": "28 min",
      "status": "Completed",
    },
    {
      "from": "Virar",
      "to": "Borivali",
      "amount": "₹820",
      "distance": "34 KM",
      "time": "52 min",
      "status": "Completed",
    },
    {
      "from": "Dadar",
      "to": "Powai",
      "amount": "₹620",
      "distance": "20 KM",
      "time": "36 min",
      "status": "Completed",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFBF0),

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xffF7B500),

        elevation: 3,

        onPressed: () {},

        child: const Icon(Icons.navigation_rounded, color: Colors.black),
      ),

      bottomNavigationBar: CustomBottomBar(
        currentIndex: 0,
        onItemTapped: (index) {},
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),

          padding: const EdgeInsets.fromLTRB(18, 18, 18, 120),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              /// TOP HEADER
              Container(
                padding: const EdgeInsets.all(18),

                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xffFFD84D), Color(0xffF7B500)],

                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),

                  borderRadius: BorderRadius.circular(26),
                ),

                child: Column(
                  children: [
                    Row(
                      children: [
                        /// PROFILE IMAGE
                        Container(
                          width: 56,
                          height: 56,

                          decoration: BoxDecoration(
                            color: Colors.white,

                            borderRadius: BorderRadius.circular(18),
                          ),

                          child: const Icon(
                            Icons.person_rounded,
                            size: 30,
                            color: Color(0xff1A1A1A),
                          ),
                        ),

                        const SizedBox(width: 14),

                        /// USER INFO
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text(
                                "Good Morning 👋",

                                style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  color: Colors.black54,
                                ),
                              ),

                              const SizedBox(height: 2),

                              Text(
                                "John Driver",

                                style: GoogleFonts.poppins(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xff1A1A1A),
                                ),
                              ),
                            ],
                          ),
                        ),

                        /// NOTIFICATION
                        Container(
                          width: 48,
                          height: 48,

                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.22),

                            borderRadius: BorderRadius.circular(16),
                          ),

                          child: const Icon(
                            Icons.notifications_none_rounded,
                            color: Color(0xff1A1A1A),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    /// ONLINE STATUS
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),

                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.18),

                        borderRadius: BorderRadius.circular(20),
                      ),

                      child: Row(
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 300),

                            width: 12,
                            height: 12,

                            decoration: BoxDecoration(
                              color: isOnline ? Colors.green : Colors.red,

                              shape: BoxShape.circle,
                            ),
                          ),

                          const SizedBox(width: 10),

                          Text(
                            isOnline ? "You're Online" : "You're Offline",

                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff1A1A1A),
                            ),
                          ),

                          const Spacer(),

                          Switch(
                            value: isOnline,

                            activeColor: const Color(0xff1A1A1A),

                            onChanged: (value) {
                              setState(() {
                                isOnline = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              /// EARNINGS CARD
              Container(
                padding: const EdgeInsets.all(20),

                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.circular(24),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),

                      blurRadius: 10,

                      offset: const Offset(0, 4),
                    ),
                  ],
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Row(
                      children: [
                        Container(
                          width: 48,
                          height: 48,

                          decoration: BoxDecoration(
                            color: const Color(0xffFFF4CC),

                            borderRadius: BorderRadius.circular(16),
                          ),

                          child: const Icon(
                            Icons.wallet_rounded,
                            color: Color(0xffF7B500),
                          ),
                        ),

                        const SizedBox(width: 14),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text(
                              "Today's Earnings",

                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                color: Colors.grey,
                              ),
                            ),

                            const SizedBox(height: 4),

                            Text(
                              "₹ 2,450",

                              style: GoogleFonts.poppins(
                                fontSize: 30,
                                fontWeight: FontWeight.w800,

                                color: const Color(0xff1A1A1A),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    Row(
                      children: [
                        _statsCard("4", "Trips", Icons.route_rounded),

                        const SizedBox(width: 12),

                        _statsCard("320", "KM", Icons.map_rounded),

                        const SizedBox(width: 12),

                        _statsCard("4.8", "Rating", Icons.star_rounded),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              /// QUICK ACTIONS TITLE
              Text(
                "Quick Actions",

                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xff1A1A1A),
                ),
              ),

              const SizedBox(height: 4),

              Text(
                "Manage your rides and account",

                style: GoogleFonts.poppins(fontSize: 13, color: Colors.grey),
              ),

              const SizedBox(height: 18),

              /// ACTIONS
              Row(
                children: [
                  Expanded(
                    child: _actionCard(Icons.history_rounded, "Ride History"),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: _actionCard(Icons.payments_rounded, "Earnings"),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              Row(
                children: [
                  Expanded(
                    child: _actionCard(Icons.support_agent_rounded, "Support"),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: _actionCard(Icons.settings_rounded, "Settings"),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              /// TODAY'S TRIPS
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Text(
                    "Today's Trips",

                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  Text(
                    "See All",

                    style: GoogleFonts.poppins(
                      color: const Color(0xffF7B500),

                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              /// TRIPS
              ListView.builder(
                shrinkWrap: true,

                physics: const NeverScrollableScrollPhysics(),

                itemCount: trips.length,

                itemBuilder: (context, index) {
                  final trip = trips[index];

                  return _tripCard(
                    from: trip["from"],
                    to: trip["to"],
                    amount: trip["amount"],
                    distance: trip["distance"],
                    time: trip["time"],
                    status: trip["status"],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// STATS CARD
  Widget _statsCard(String value, String title, IconData icon) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),

        decoration: BoxDecoration(
          color: const Color(0xffFFF8E1),

          borderRadius: BorderRadius.circular(18),
        ),

        child: Column(
          children: [
            Icon(icon, color: const Color(0xffF7B500)),

            const SizedBox(height: 8),

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
      ),
    );
  }

  /// ACTION CARD
  Widget _actionCard(IconData icon, String title) {
    return Container(
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(22),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),

            blurRadius: 10,

            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: Column(
        children: [
          Container(
            width: 54,
            height: 54,

            decoration: BoxDecoration(
              color: const Color(0xffFFF4CC),

              borderRadius: BorderRadius.circular(16),
            ),

            child: Icon(icon, color: const Color(0xffF7B500)),
          ),

          const SizedBox(height: 12),

          Text(
            title,

            textAlign: TextAlign.center,

            style: GoogleFonts.poppins(
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  /// TRIP CARD
  Widget _tripCard({
    required String from,
    required String to,
    required String amount,
    required String distance,
    required String time,
    required String status,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),

      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(22),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),

            blurRadius: 10,

            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,

            decoration: BoxDecoration(
              color: const Color(0xffFFF4CC),

              borderRadius: BorderRadius.circular(16),
            ),

            child: const Icon(
              Icons.location_on_rounded,
              color: Color(0xffF7B500),
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  "$from → $to",

                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  "$distance • $time",

                  style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,

            children: [
              Text(
                amount,

                style: GoogleFonts.poppins(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,

                  color: Colors.green,
                ),
              ),

              const SizedBox(height: 6),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),

                decoration: BoxDecoration(
                  color: const Color(0xffE8F5E9),

                  borderRadius: BorderRadius.circular(30),
                ),

                child: Text(
                  status,

                  style: GoogleFonts.poppins(
                    color: Colors.green,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
