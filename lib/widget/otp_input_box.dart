import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OtpInputBox extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode? nextFocus;

  final VoidCallback? onCompleted;

  const OtpInputBox({
    super.key,
    required this.controller,
    required this.focusNode,
    this.nextFocus,
    this.onCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      height: 72,

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),

        border: Border.all(color: Colors.grey.shade300),
      ),

      child: TextField(
        controller: controller,
        focusNode: focusNode,

        keyboardType: TextInputType.number,

        textAlign: TextAlign.center,

        maxLength: 1,

        style: GoogleFonts.poppins(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),

        decoration: const InputDecoration(
          border: InputBorder.none,
          counterText: "",
        ),

        onChanged: (value) {
          if (value.isNotEmpty) {
            if (nextFocus != null) {
              FocusScope.of(context).requestFocus(nextFocus);
            } else {
              FocusScope.of(context).unfocus();

              if (onCompleted != null) {
                onCompleted!();
              }
            }
          }
        },
      ),
    );
  }
}
