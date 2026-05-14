import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class AuthTextField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final bool isPassword;

  const AuthTextField({
    super.key,
    required this.hint,
    required this.icon,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(20),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
          ),
        ],
      ),

      child: TextField(
        obscureText: isPassword,

        decoration: InputDecoration(
          border: InputBorder.none,

          contentPadding:
              const EdgeInsets.symmetric(
            vertical: 20,
          ),

          hintText: hint,

          hintStyle: GoogleFonts.poppins(
            color: Colors.grey.shade500,
          ),

          prefixIcon: Icon(
            icon,
            color: const Color(0xffF7B500),
          ),

          suffixIcon: isPassword
              ? const Icon(
                  Icons.visibility_off_outlined,
                  color: Colors.grey,
                )
              : null,
        ),
      ),
    );
  }
}