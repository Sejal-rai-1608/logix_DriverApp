import 'package:drivaer_logixapp/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthTextField extends StatefulWidget {
  final String hint;
  final IconData icon;
  final bool isPassword;
  final TextInputType keyboardType;

  const AuthTextField({
    super.key,
    required this.hint,
    required this.icon,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  bool _obscureText = true;
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: _isFocused ? AppColors.yellow2 : Colors.transparent,
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: _isFocused 
                ? AppColors.yellow2.withOpacity(0.1) 
                : Colors.black.withOpacity(0.04),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Focus(
        onFocusChange: (hasFocus) {
          setState(() {
            _isFocused = hasFocus;
          });
        },
        child: TextField(
          obscureText: widget.isPassword ? _obscureText : false,
          keyboardType: widget.keyboardType,
          style: GoogleFonts.poppins(
            fontSize: 15,
            color: AppColors.textDark,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 18,
              horizontal: 16,
            ),
            hintText: widget.hint,
            hintStyle: GoogleFonts.poppins(
              color: AppColors.textGrey,
              fontSize: 14,
            ),
            prefixIcon: Icon(
              widget.icon,
              color: _isFocused ? AppColors.yellow2 : AppColors.textGrey,
              size: 22,
            ),
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    icon: Icon(
                      _obscureText
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: AppColors.textGrey,
                      size: 20,
                    ),
                  )
                : null,
          ),
        ),
      ),
    );
  }
}