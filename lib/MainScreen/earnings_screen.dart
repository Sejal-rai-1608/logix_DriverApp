import 'package:drivaer_logixapp/MainScreen/wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_colors.dart';
import '../widget/driver_bottom_nav.dart';

class EarningsScreen extends StatefulWidget {
  const EarningsScreen({super.key});

  @override
  State<EarningsScreen> createState() =>
      _EarningsScreenState();
}

class _EarningsScreenState
    extends State<EarningsScreen> {
  String selectedRange = "This Week";

  final transactions = [
    {
      "trip": "Trip #TRP1234",
      "time": "Today, 01:20 PM",
      "amount": "+ ₹850",
    },
    {
      "trip": "Trip #TRP1235",
      "time": "Today, 11:45 AM",
      "amount": "+ ₹600",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,

      bottomNavigationBar: DriverBottomNav(
        currentIndex: 2,
        gestureDetector: (index) {
        
          onTap: (index) {
            print(index);
          };
        },
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 14,
          ),

          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [

              /// top
              Row(
                children: [

                  GestureDetector(
                    onTap: () =>
                        Navigator.pop(context),

                    child: Container(
                      height: 56,
                      width: 56,

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(
                                18),

                        boxShadow: [
                          BoxShadow(
                            color: Colors.black
                                .withOpacity(.04),
                            blurRadius: 15,
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
                    "Earnings",
                    style:
                        GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight:
                          FontWeight.w700,
                    ),
                  ),

                  const Spacer(),

                  const SizedBox(width: 56)
                ],
              ),

              const SizedBox(height: 28),

              /// dropdown
              Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 3,
                  ),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(
                            20),

                    boxShadow: [
                      BoxShadow(
                        blurRadius: 15,
                        color: Colors.black
                            .withOpacity(.04),
                      )
                    ],
                  ),

                  child:
                      DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: selectedRange,

                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                      ),

                      items: [
                        "Today",
                        "This Week",
                        "This Month"
                      ]
                          .map(
                            (e) =>
                                DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ),
                          )
                          .toList(),

                      onChanged: (v) {
                        setState(() {
                          selectedRange =
                              v.toString();
                        });
                      },
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 35),

              /// earnings card

              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(
                  vertical: 30,
                ),

                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(32),

                  gradient:
                      const LinearGradient(
                    colors: [
                      Color(0xffFFF4CA),
                      Color(0xffFFD12F)
                    ],
                    begin:
                        Alignment.topCenter,
                    end:
                        Alignment.bottomCenter,
                  ),

                  boxShadow: [
                    BoxShadow(
                      blurRadius: 25,
                      color: Colors.yellow
                          .withOpacity(.3),
                    )
                  ],
                ),

                child: Column(
                  children: [

                    Container(
                      height: 70,
                      width: 70,

                      decoration:
                          BoxDecoration(
                        color: Colors.white,
                        shape:
                            BoxShape.circle,
                      ),

                       child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const WalletScreen(),
                            ),
                          );
                        },
                        child: Icon(
                          Icons.wallet,
                          size: 35,
                          color: const Color(0xffFFC107),
                        ),
                      ),
                    ),

                    const SizedBox(
                        height: 18),

                    Text(
                      "₹2,450",
                      style:
                          GoogleFonts.poppins(
                        fontSize: 52,
                        fontWeight:
                            FontWeight.w700,
                      ),
                    ),

                    const SizedBox(
                        height: 8),

                    Text(
                      "Total Earnings",
                      style:
                          GoogleFonts.poppins(
                        fontSize: 18,
                        color: Colors
                            .grey.shade700,
                      ),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 28),

              /// stats

              Container(
                padding:
                    const EdgeInsets.all(20),

                decoration:
                    BoxDecoration(
                  color: Colors.white,

                  borderRadius:
                      BorderRadius.circular(
                          30),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black
                          .withOpacity(.04),
                      blurRadius: 20,
                    )
                  ],
                ),

                child: Row(
                  children: [

                    Expanded(
                      child: statItem(
                          Icons.route,
                          "12",
                          "Trips"),
                    ),

                    divider(),

                    Expanded(
                      child: statItem(
                          Icons.speed,
                          "520",
                          "KM"),
                    ),

                    divider(),

                    Expanded(
                      child: statItem(
                          Icons.access_time,
                          "18h",
                          "Online"),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 35),

              Text(
                "Recent Transactions",
                style:
                    GoogleFonts.poppins(
                  fontWeight:
                      FontWeight.w700,
                  fontSize: 20,
                ),
              ),

              const SizedBox(height: 18),

              Container(
                decoration:
                    BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(
                          30),
                ),

                child: Column(
                  children:
                      transactions.map((e) {
                    return transactionCard(
                        e);
                  }).toList(),
                ),
              ),

              const SizedBox(height: 30)
            ],
          ),
        ),
      ),
    );
  }

  Widget divider() {
    return Container(
      width: 1,
      height: 90,
      color: Colors.grey.shade200,
    );
  }

  Widget statItem(
      IconData icon,
      String value,
      String title) {
    return Column(
      children: [

        Container(
          height: 56,
          width: 56,

          decoration: BoxDecoration(
            color: const Color(
                0xffFFF8E6),

            borderRadius:
                BorderRadius.circular(
                    18),
          ),

          child: Icon(
            icon,
            color:
                const Color(0xffF5B400),
          ),
        ),

        const SizedBox(height: 14),

        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 28,
            fontWeight:
                FontWeight.w700,
          ),
        ),

        Text(
          title,
          style: GoogleFonts.poppins(
            color:
                Colors.grey.shade600,
          ),
        )
      ],
    );
  }

  Widget transactionCard(
      Map item) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context)
            .showSnackBar(
          SnackBar(
            content: Text(
                "${item["trip"]} clicked"),
          ),
        );
      },

      child: Container(
        padding:
            const EdgeInsets.all(20),

        child: Row(
          children: [

            Container(
              width: 58,
              height: 58,

              decoration:
                  const BoxDecoration(
                color:
                    Color(0xffFFF4CA),
                shape:
                    BoxShape.circle,
              ),

              child: const Icon(
                Icons.local_shipping,
              ),
            ),

            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment
                        .start,
                children: [

                  Text(
                    item["trip"],
                    style:
                        GoogleFonts
                            .poppins(
                      fontWeight:
                          FontWeight
                              .w700,
                      fontSize: 18,
                    ),
                  ),

                  const SizedBox(
                      height: 4),

                  Text(
                    item["time"],
                    style:
                        GoogleFonts
                            .poppins(
                      color: Colors
                          .grey
                          .shade600,
                    ),
                  ),
                ],
              ),
            ),

            Text(
              item["amount"],
              style:
                  GoogleFonts.poppins(
                fontSize: 20,
                color: Colors.green,
                fontWeight:
                    FontWeight.w700,
              ),
            ),

            const SizedBox(width: 10),

            Icon(
              Icons.chevron_right,
              color:
                  Colors.grey.shade400,
            )
          ],
        ),
      ),
    );
  }
}