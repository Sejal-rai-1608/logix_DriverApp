import 'package:drivaer_logixapp/MainScreen/wallet_screen.dart';
import 'package:drivaer_logixapp/widget/custom_bottombar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EarningsScreen extends StatefulWidget {
  const EarningsScreen({super.key});

  @override
  State<EarningsScreen> createState() => _EarningsScreenState();
}

class _EarningsScreenState extends State<EarningsScreen> {
  String selectedRange = "This Week";

  final List<Map<String, String>> transactions = [
    {
      "trip": "Trip #TRP1234",
      "time": "Today, 01:20 PM",
      "amount": "+ ₹850",
      "status": "Success",
    },
    {
      "trip": "Trip #TRP1235",
      "time": "Today, 11:45 AM",
      "amount": "+ ₹600",
      "status": "Success",
    },
    {
      "trip": "Trip #TRP1236",
      "time": "Yesterday, 07:30 PM",
      "amount": "+ ₹950",
      "status": "Success",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFBF0),

      bottomNavigationBar: CustomBottomBar(
        currentIndex: 2,
        onItemTapped: (index) {
          print(index);
        },
      ),

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
                      height: 52,
                      width: 52,

                      decoration: BoxDecoration(
                        color: Colors.white,

                        borderRadius: BorderRadius.circular(18),

                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.04),

                            blurRadius: 14,
                          ),
                        ],
                      ),

                      child: const Icon(Icons.arrow_back_ios_new),
                    ),
                  ),

                  const Spacer(),

                  Text(
                    "Earnings",

                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  const Spacer(),

                  // Container(
                  //   height: 52,
                  //   width: 52,

                  //   decoration: BoxDecoration(
                  //     color: Colors.white,

                  //     borderRadius: BorderRadius.circular(18),

                  //     boxShadow: [
                  //       BoxShadow(
                  //         color: Colors.black.withOpacity(.04),

                  //         blurRadius: 14,
                  //       ),
                  //     ],
                  //   ),

                  //   child: const Icon(Icons.more_vert_rounded),
                  // ),
                ],
              ),

              const SizedBox(height: 28),

              /// FILTER
              Align(
                alignment: Alignment.center,

                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 3,
                  ),

                  decoration: BoxDecoration(
                    color: Colors.white,

                    borderRadius: BorderRadius.circular(20),

                    boxShadow: [
                      BoxShadow(
                        blurRadius: 15,

                        color: Colors.black.withOpacity(.04),
                      ),
                    ],
                  ),

                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedRange,

                      icon: const Icon(Icons.keyboard_arrow_down),

                      items: ["Today", "This Week", "This Month"]
                          .map(
                            (e) => DropdownMenuItem<String>(
                              value: e,

                              child: Text(e),
                            ),
                          )
                          .toList(),

                      onChanged: (v) {
                        if (v != null) {
                          setState(() {
                            selectedRange = v;
                          });
                        }
                      },
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              /// WALLET CARD
              Container(
                width: double.infinity,

                padding: const EdgeInsets.all(26),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(34),

                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 156, 128, 29),
                      Color.fromARGB(255, 179, 158, 103),
                    ],

                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),

                  boxShadow: [
                    BoxShadow(
                      blurRadius: 24,

                      color: Colors.black.withOpacity(.15),

                      offset: const Offset(0, 10),
                    ),
                  ],
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    /// TOP
                    Row(
                      children: [
                        Container(
                          height: 64,
                          width: 64,

                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xffFFD84D), Color(0xffF7B500)],
                            ),

                            borderRadius: BorderRadius.circular(22),
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

                                size: 18,
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

                    const SizedBox(height: 28),

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
                        color: Colors.white,

                        fontSize: 44,

                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    const SizedBox(height: 10),

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
                            onTap: () {},

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
                                  fontWeight: FontWeight.w700,

                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 14),

                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,

                                MaterialPageRoute(
                                  builder: (_) => const WalletScreen(),
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
                                "Open Wallet",

                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,

                                  color: Colors.white,
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

              const SizedBox(height: 34),

              /// TITLE
              Text(
                "Recent Transactions",

                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
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
          BoxShadow(color: Colors.black.withOpacity(.04), blurRadius: 15),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Container(
            height: 48,
            width: 48,

            decoration: BoxDecoration(
              color: const Color(0xffFFF4CA),

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

  Widget transactionCard(Map<String, String> item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),

      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(26),

        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(.04), blurRadius: 14),
        ],
      ),

      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,

            decoration: BoxDecoration(
              color: const Color(0xffFFF4CA),

              borderRadius: BorderRadius.circular(18),
            ),

            child: const Icon(Icons.local_shipping, color: Color(0xffF5B400)),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  item["trip"] ?? "",

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

                  color: Colors.green,

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
