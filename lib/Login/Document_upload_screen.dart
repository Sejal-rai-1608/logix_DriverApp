import 'dart:io';
import 'package:drivaer_logixapp/widget/background_pattern.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:drivaer_logixapp/theme/app_colors.dart';

import '../widget/AuthButton.dart';
import 'package:drivaer_logixapp/Login/under_review_screen.dart';

class DriverDocumentsScreen extends StatefulWidget {
  const DriverDocumentsScreen({super.key});

  @override
  State<DriverDocumentsScreen> createState() => _DriverDocumentsScreenState();
}

class _DriverDocumentsScreenState extends State<DriverDocumentsScreen>
    with SingleTickerProviderStateMixin {
  final ImagePicker picker = ImagePicker();
  final List<Map<String, dynamic>> docs = [
    {
      "title": "Driver License",
      "subtitle": "Upload your valid driving license",
      "icon": Icons.badge_outlined,
      "file": null,
      "status": "pending"
    },
    {
      "title": "RC Book",
      "subtitle": "Upload vehicle registration",
      "icon": Icons.menu_book_rounded,
      "file": null,
      "status": "approved"
    },
    {
      "title": "Vehicle Insurance",
      "subtitle": "Upload insurance document",
      "icon": Icons.shield_outlined,
      "file": null,
      "status": "approved"
    },
    {
      "title": "Vehicle Permit",
      "subtitle": "Upload permit document",
      "icon": Icons.description_outlined,
      "file": null,
      "status": "pending"
    },
    {
      "title": "Aadhaar / ID",
      "subtitle": "Upload Aadhaar or Gov ID",
      "icon": Icons.credit_card_rounded,
      "file": null,
      "status": "rejected"
    },
  ];

  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _slideAnimation = Tween<Offset>(begin: const Offset(0, 0.05), end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future pickImage(int index) async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;
    setState(() {
      docs[index]["file"] = File(image.path);
      docs[index]["status"] = "pending";
    });
  }

  Color statusColor(String status) {
    switch (status) {
      case "approved": return Colors.green;
      case "rejected": return Colors.red;
      default: return Colors.orange;
    }
  }

  submit() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const DriverUnderReviewScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: BackgroundPattern(
        child: SafeArea(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: SlideTransition(
              position: _slideAnimation,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// BACK BUTTON
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: AppColors.border, width: 1.5),
                        ),
                        child: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
                      ),
                    ),

                    const SizedBox(height: 32),

                    Text(
                      "Documents",
                      style: GoogleFonts.poppins(
                        fontSize: 32,
                        fontWeight: FontWeight.w800,
                        color: AppColors.accent,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      "Please upload clear photos of your documents for verification.",
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: AppColors.textGrey,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 32),

                    ListView.builder(
                      itemCount: docs.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        var item = docs[index];
                        return _buildDocCard(item, index);
                      },
                    ),

                    const SizedBox(height: 32),

                    AuthButton(
                      title: "Submit Documents",
                      onTap: submit,
                    ),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDocCard(Map<String, dynamic> item, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: AppColors.yellow2.withOpacity(0.1),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Icon(item["icon"], color: AppColors.yellow2, size: 26),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item["title"],
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.accent,
                  ),
                ),
                Text(
                  item["subtitle"],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: AppColors.textGrey,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusColor(item["status"]).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    item["status"].toUpperCase(),
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.w800,
                      color: statusColor(item["status"]),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          GestureDetector(
            onTap: () => pickImage(index),
            child: item["file"] == null
                ? Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: AppColors.bg,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: AppColors.border, width: 1.5),
                    ),
                    child: const Icon(Icons.add_a_photo_rounded, size: 20, color: AppColors.textGrey),
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.file(
                      item["file"],
                      width: 56,
                      height: 56,
                      fit: BoxFit.cover,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}