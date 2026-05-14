import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const AuthButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: double.infinity,

        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xffFFD84D),
              Color(0xffF7B500),
            ],
          ),

          borderRadius: BorderRadius.circular(20),

          boxShadow: [
            BoxShadow(
              color: const Color(0xffF7B500)
                  .withOpacity(0.35),

              blurRadius: 18,
              offset: const Offset(0, 8),
            ),
          ],
        ),

        child: Center(
          child: Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}