import 'package:drivaer_logixapp/Trip/trips_history_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_colors.dart';
import '../widget/driver_bottom_nav.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  final List<Map<String, String>> transactions = [
    {
      "title": "Trip Payment",
      "time": "Today, 1:20 PM",
      "amount": "+ ₹850",
      "status": "Success",
    },
    {
      "title": "Wallet Withdraw",
      "time": "Yesterday, 8:45 PM",
      "amount": "- ₹2,000",
      "status": "Completed",
    },
    {
      "title": "Bonus Cashback",
      "time": "18 May, 11:00 AM",
      "amount": "+ ₹120",
      "status": "Reward",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,

      // bottomNavigationBar: CustomBottomBar(
      //   currentIndex: 2,

      //   gestureDetector: (index) {
      //     print(index);
      //   },
      // ),

      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),

          padding: const EdgeInsets.fromLTRB(18, 14, 18, 120),

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
                      width: 54,
                      height: 54,

                      decoration: BoxDecoration(
                        color: Colors.white,

                        borderRadius: BorderRadius.circular(18),

                        boxShadow: [
                          BoxShadow(
                            blurRadius: 16,

                            color: Colors.black.withOpacity(.04),
                          ),
                        ],
                      ),

                      child: const Icon(Icons.arrow_back_ios_new),
                    ),
                  ),

                  const Spacer(),

                  Text(
                    "Wallet",

                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  const Spacer(),

                  Container(
                    width: 54,
                    height: 54,

                    decoration: BoxDecoration(
                      color: Colors.white,

                      borderRadius: BorderRadius.circular(18),

                      boxShadow: [
                        BoxShadow(
                          blurRadius: 16,

                          color: Colors.black.withOpacity(.04),
                        ),
                      ],
                    ),

                    child: const Icon(Icons.more_vert_rounded),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              /// WALLET CARD
              Container(
                width: double.infinity,

                padding: const EdgeInsets.all(28),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(34),

                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 221, 196, 53),
                      Color.fromARGB(255, 123, 119, 65),
                    ],

                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),

                  boxShadow: [
                    BoxShadow(
                      blurRadius: 25,

                      color: Colors.black.withOpacity(.15),

                      offset: const Offset(0, 10),
                    ),
                  ],
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    /// TOP ROW
                    Row(
                      children: [
                        Container(
                          width: 62,
                          height: 62,

                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xffFFD84D), Color(0xffF7B500)],
                            ),

                            borderRadius: BorderRadius.circular(20),
                          ),

                          child: const Icon(
                            Icons.account_balance_wallet,

                            color: Colors.black,

                            size: 34,
                          ),
                        ),

                        const Spacer(),

                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 8,
                          ),

                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(.08),

                            borderRadius: BorderRadius.circular(18),
                          ),

                          child: Row(
                            children: [
                              const Icon(
                                Icons.bolt,

                                color: Colors.amber,

                                size: 16,
                              ),

                              const SizedBox(width: 6),

                              Text(
                                "Cashback Active",

                                style: GoogleFonts.poppins(
                                  color: Colors.white,

                                  fontSize: 12,

                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),

                    Text(
                      "Wallet Balance",

                      style: GoogleFonts.poppins(
                        color: Colors.white70,

                        fontSize: 15,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      "₹ 2,450",

                      style: GoogleFonts.poppins(
                        fontSize: 44,

                        fontWeight: FontWeight.w800,

                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      "+ ₹240 added today",

                      style: GoogleFonts.poppins(
                        color: Colors.greenAccent,

                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 30),

                    /// BUTTONS
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,

                                builder: (_) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24),
                                  ),

                                  title: const Text("Withdraw"),

                                  content: const Text(
                                    "₹2,000 transferred successfully",
                                  ),

                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },

                                      child: const Text("OK"),
                                    ),
                                  ],
                                ),
                              );
                            },

                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 16),

                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xffFFD84D),
                                    Color(0xffF7B500),
                                  ],
                                ),

                                borderRadius: BorderRadius.circular(18),
                              ),

                              alignment: Alignment.center,

                              child: Text(
                                "Withdraw",

                                style: GoogleFonts.poppins(
                                  color: Colors.black,

                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 14),

                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Transfer feature coming soon"),
                                ),
                              );
                            },

                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 16),

                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(.08),

                                borderRadius: BorderRadius.circular(18),
                              ),

                              alignment: Alignment.center,

                              child: Text(
                                "Transfer",

                                style: GoogleFonts.poppins(
                                  color: Colors.white,

                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 26),

              /// ANALYTICS TITLE
              Text(
                "Wallet Analytics",

                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 18),

              /// ANALYTICS
              Row(
                children: [
                  Expanded(
                    child: analyticsCard(
                      "₹500",
                      "Pending",
                      Icons.pending_actions,
                    ),
                  ),

                  const SizedBox(width: 14),

                  Expanded(
                    child: analyticsCard("₹120", "Cashback", Icons.bolt),
                  ),
                ],
              ),

              const SizedBox(height: 14),

              Row(
                children: [
                  Expanded(child: analyticsCard("24", "Trips", Icons.route)),

                  const SizedBox(width: 14),

                  Expanded(
                    child: analyticsCard("+18%", "Growth", Icons.trending_up),
                  ),
                ],
              ),

              const SizedBox(height: 28),

              /// FEATURE CARDS
              Row(
                children: [
                  Expanded(
                    child: featureCard(
                      title: "Payout History",

                      icon: Icons.description_outlined,

                      onTap: () {
                        Navigator.push(
                          context,

                          MaterialPageRoute(
                            builder: (_) => const TripsHistoryScreen(),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(width: 14),

                  Expanded(
                    child: featureCard(
                      title: "Payment Methods",

                      icon: Icons.credit_card,

                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Payment Methods")),
                        );
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 34),

              /// TRANSACTION TITLE
              Text(
                "Recent Transactions",

                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 18),

              /// TRANSACTIONS
              Column(
                children: transactions.map((e) {
                  return transactionCard(e);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget analyticsCard(String value, String title, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(26),

        boxShadow: [
          BoxShadow(blurRadius: 16, color: Colors.black.withOpacity(.04)),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Container(
            width: 48,
            height: 48,

            decoration: BoxDecoration(
              color: const Color(0xffFFF7E0),

              borderRadius: BorderRadius.circular(16),
            ),

            child: Icon(icon, color: const Color(0xffF5B400)),
          ),

          const SizedBox(height: 18),

          Text(
            value,

            style: GoogleFonts.poppins(
              fontSize: 26,
              fontWeight: FontWeight.w700,
            ),
          ),

          const SizedBox(height: 4),

          Text(title, style: GoogleFonts.poppins(color: Colors.grey.shade600)),
        ],
      ),
    );
  }

  Widget featureCard({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,

      borderRadius: BorderRadius.circular(26),

      child: Container(
        height: 145,

        padding: const EdgeInsets.all(18),

        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius: BorderRadius.circular(26),

          boxShadow: [
            BoxShadow(blurRadius: 16, color: Colors.black.withOpacity(.04)),
          ],
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Container(
              width: 55,
              height: 55,

              decoration: BoxDecoration(
                color: const Color(0xffFFF8E6),

                borderRadius: BorderRadius.circular(18),
              ),

              child: Icon(icon, color: const Color(0xffF5B400)),
            ),

            const Spacer(),

            Text(
              title,

              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,

                fontSize: 16,
              ),
            ),

            Align(
              alignment: Alignment.centerRight,
              child: Icon(Icons.chevron_right, color: Colors.grey.shade400),
            ),
          ],
        ),
      ),
    );
  }

  Widget transactionCard(Map<String, String> item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),

      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(26),

        boxShadow: [
          BoxShadow(blurRadius: 14, color: Colors.black.withOpacity(.04)),
        ],
      ),

      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,

            decoration: BoxDecoration(
              color: const Color(0xffFFF7E0),

              borderRadius: BorderRadius.circular(18),
            ),

            child: const Icon(
              Icons.account_balance_wallet,

              color: Color(0xffF5B400),
            ),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  item["title"] ?? "",

                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700,

                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  item["time"] ?? "",

                  style: GoogleFonts.poppins(
                    color: Colors.grey.shade600,

                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,

            children: [
              Text(
                item["amount"] ?? "",

                style: GoogleFonts.poppins(
                  fontSize: 18,

                  color: item["amount"]?.contains("-") == true
                      ? Colors.red
                      : Colors.green,

                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 6),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),

                decoration: BoxDecoration(
                  color: const Color(0xffE8F5E9),

                  borderRadius: BorderRadius.circular(30),
                ),

                child: Text(
                  item["status"] ?? "",

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
