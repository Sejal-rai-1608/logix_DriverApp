/// ======================================
/// FILE:
/// screens/documents_screen.dart
/// ======================================

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DocumentsScreen extends StatelessWidget {
  const DocumentsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor:
          const Color(0xffF8F8F8),

      appBar: AppBar(
        backgroundColor:
            Colors.transparent,

        elevation: 0,

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },

          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),

        centerTitle: true,

        title: Text(
          "Documents",

          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight:
                FontWeight.w600,
          ),
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),

        children: [

          documentCard(
            title: "Driving License",
            status: "Verified",
            icon:
                Icons.verified_outlined,
          ),

          documentCard(
            title: "GST Certificate",
            status: "Pending",
            icon:
                Icons.description_outlined,
          ),

          documentCard(
            title: "Insurance Paper",
            status: "Uploaded",
            icon:
                Icons.file_copy_outlined,
          ),
        ],
      ),
    );
  }

  Widget documentCard({
    required String title,
    required String status,
    required IconData icon,
  }) {

    return Container(
      margin: const EdgeInsets.only(
        bottom: 18,
      ),

      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius:
            BorderRadius.circular(20),
      ),

      child: Row(
        children: [

          Container(
            width: 52,
            height: 52,

            decoration: BoxDecoration(
              color: const Color(
                0xffFFF5D9,
              ),

              borderRadius:
                  BorderRadius.circular(
                14,
              ),
            ),

            child: Icon(
              icon,
              color: const Color(
                0xffF7B500,
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
                  title,

                  style:
                      GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight:
                        FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  status,

                  style:
                      GoogleFonts.poppins(
                    color: status ==
                            "Verified"
                        ? Colors.green
                        : Colors.orange,

                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          const Icon(
            Icons.arrow_forward_ios,
            size: 18,
          ),
        ],
      ),
    );
  }
}