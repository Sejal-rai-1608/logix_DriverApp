import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileInputCard extends StatelessWidget {

  final IconData icon;
  final String title;
  final String hint;

  final TextEditingController controller;

  final TextInputType keyboardType;

  const ProfileInputCard({
    super.key,
    required this.icon,
    required this.title,
    required this.hint,
    required this.controller,
    this.keyboardType=
        TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {

    return Container(

      margin:
          const EdgeInsets.only(
              bottom: 14),

      padding:
          const EdgeInsets.symmetric(
        horizontal:14,
        vertical:10,
      ),

      decoration:
          BoxDecoration(

        borderRadius:
            BorderRadius.circular(
                22),

        border: Border.all(
          color:
              Colors.grey.shade200,
        ),
      ),

      child: Row(
        children: [

          Container(
            width:52,
            height:52,

            decoration:
                BoxDecoration(

              color:
                  const Color(
                      0xffFFF8EA),

              borderRadius:
                  BorderRadius.circular(
                      16),
            ),

            child: Icon(
              icon,
              size:24,
            ),
          ),

          const SizedBox(width:14),

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
                    fontSize:13,

                    color:
                        Colors.grey,
                  ),
                ),

                TextField(
                  controller:
                      controller,

                  keyboardType:
                      keyboardType,

                  decoration:
                      InputDecoration(

                    hintText:
                        hint,

                    border:
                        InputBorder.none,

                    isDense:true,

                    hintStyle:
                        GoogleFonts.poppins(
                      fontSize:16,
                    ),
                  ),

                  style:
                      GoogleFonts.poppins(
                    fontSize:16,

                    fontWeight:
                        FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}