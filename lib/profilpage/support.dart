

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HelpSupportScreen extends StatefulWidget {
  const HelpSupportScreen({super.key});

  @override
  State<HelpSupportScreen> createState() => _HelpSupportScreenState();
}

class _HelpSupportScreenState extends State<HelpSupportScreen> {
  int expandedIndex = 1;

  final List<Map<String, String>> faqList = [
    {
      "question": "How do I track a multi-stop shipment?",

      "answer":
          "You can track every shipment stop from the live tracking screen inside your order details page.",
    },

    {
      "question": "What is the claim process for damaged freight?",

      "answer":
          "To initiate a claim, navigate to your Orders tab, select the shipment concerned, and click Report Issue. Upload clear images of the damage and our support team will assist you.",
    },

    {
      "question": "How do I update my billing information?",

      "answer":
          "Go to Settings > Payment Methods and update your billing details securely.",
    },

    {
      "question": "Can I change a delivery address mid-transit?",

      "answer":
          "Yes, but additional charges may apply depending on the shipment route and distance.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F8F8),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              /// TOP BAR
              Row(
                children: [
                  const CircleAvatar(
                    radius: 18,

                    backgroundImage: NetworkImage("https://i.pravatar.cc/300"),
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    child: Text(
                      "Support Center",

                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),

                  const Icon(Icons.notifications_none),
                ],
              ),

              const SizedBox(height: 18),

              /// HEADER CARD
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),

                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.circular(24),
                ),

                child: Column(
                  children: [
                    Text(
                      "How can we help\nyou today?",

                      textAlign: TextAlign.center,

                      style: GoogleFonts.poppins(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        height: 1.3,
                      ),
                    ),

                    const SizedBox(height: 14),

                    Text(
                      "Search for articles, guides, or\ncontact our logistics support team.",

                      textAlign: TextAlign.center,

                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: Colors.grey.shade600,
                        height: 1.7,
                      ),
                    ),

                    const SizedBox(height: 22),

                    /// SEARCH
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14),

                      decoration: BoxDecoration(
                        color: const Color(0xffF8F8F8),

                        borderRadius: BorderRadius.circular(14),

                        border: Border.all(color: Colors.grey.shade300),
                      ),

                      child: Row(
                        children: [
                          Icon(Icons.search, color: Colors.grey.shade500),

                          const SizedBox(width: 10),

                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,

                                hintText: "Search for Tracking or Invoices...",

                                hintStyle: GoogleFonts.poppins(
                                  fontSize: 13,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 22),

              /// CONTACT SUPPORT
              sectionTitle("Contact Support"),

              const SizedBox(height: 14),

              supportCard(
                icon: Icons.chat,
                title: "Live Chat",
                subtitle: "Average response: Under 2 mins",

                buttonText: "Chat with Us",

                buttonColor: const Color(0xffF7B500),
              ),

              const SizedBox(height: 14),

              supportCard(
                icon: Icons.call,
                title: "Phone Support",
                subtitle: "Available 24/7 for urgent issues",

                buttonText: "Call Support",

                buttonColor: Colors.white,
              ),

              const SizedBox(height: 24),

              /// RECENT TICKETS
              Row(
                children: [
                  sectionTitle("Recent Tickets"),

                  const Spacer(),

                  Text(
                    "View All",

                    style: GoogleFonts.poppins(
                      color: const Color(0xffF7B500),

                      fontWeight: FontWeight.w600,

                      fontSize: 12,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 14),

              ticketCard(
                id: "#HS-4401",
                title: "Delayed pickup at Chicago Hub",

                subtitle: "Updated 24 hours ago",
              ),

              const SizedBox(height: 12),

              ticketCard(
                id: "#BE-4935",
                title: "Invoice dispute for Order #4832",

                subtitle: "Resolved 2 days ago",
              ),

              const SizedBox(height: 26),

              /// FAQ
              sectionTitle("Frequently Asked Questions"),

              const SizedBox(height: 14),

              ListView.builder(
                shrinkWrap: true,

                physics: const NeverScrollableScrollPhysics(),

                itemCount: faqList.length,

                itemBuilder: (context, index) {
                  final faq = faqList[index];

                  final bool expanded = expandedIndex == index;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        expandedIndex = expanded ? -1 : index;
                      });
                    },

                    child: Container(
                      margin: const EdgeInsets.only(bottom: 12),

                      padding: const EdgeInsets.all(16),

                      decoration: BoxDecoration(
                        color: expanded
                            ? const Color(0xffFFF7E2)
                            : Colors.white,

                        borderRadius: BorderRadius.circular(18),

                        border: Border.all(
                          color: expanded
                              ? const Color(0xffF7B500)
                              : Colors.grey.shade300,
                        ),
                      ),

                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  faq["question"]!,

                                  style: GoogleFonts.poppins(
                                    fontSize: 13,

                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),

                              Icon(
                                expanded
                                    ? Icons.keyboard_arrow_up
                                    : Icons.keyboard_arrow_down,
                              ),
                            ],
                          ),

                          if (expanded)
                            Padding(
                              padding: const EdgeInsets.only(top: 14),

                              child: Text(
                                faq["answer"]!,

                                style: GoogleFonts.poppins(
                                  fontSize: 12,

                                  color: Colors.grey.shade700,

                                  height: 1.7,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Text(
      title,

      style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w700),
    );
  }

  Widget supportCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required String buttonText,
    required Color buttonColor,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(22),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Container(
            width: 48,
            height: 48,

            decoration: BoxDecoration(
              color: const Color(0xffFFF5D9),

              borderRadius: BorderRadius.circular(14),
            ),

            child: Icon(icon, color: const Color(0xffF7B500)),
          ),

          const SizedBox(height: 14),

          Text(
            title,

            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            subtitle,

            style: GoogleFonts.poppins(
              fontSize: 12,
              color: Colors.grey.shade600,
            ),
          ),

          const SizedBox(height: 16),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),

            decoration: BoxDecoration(
              color: buttonColor,

              borderRadius: BorderRadius.circular(14),

              border: buttonColor == Colors.white
                  ? Border.all(color: Colors.grey.shade300)
                  : null,
            ),

            child: Text(
              buttonText,

              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,

                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget ticketCard({
    required String id,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(18),
      ),

      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,

            decoration: BoxDecoration(
              color: const Color(0xffFFF5D9),

              borderRadius: BorderRadius.circular(12),
            ),

            child: const Icon(
              Icons.description_outlined,
              color: Color(0xffF7B500),
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  id,

                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 4),

                Text(title, style: GoogleFonts.poppins(fontSize: 13)),

                const SizedBox(height: 4),

                Text(
                  subtitle,

                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    color: Colors.grey.shade600,
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
