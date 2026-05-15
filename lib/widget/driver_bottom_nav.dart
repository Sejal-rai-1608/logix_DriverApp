import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';

class DriverBottomNav extends StatelessWidget {

  final int currentIndex;
  final Function(int) onTap;

  const DriverBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 75,

      margin: const EdgeInsets.only(
        left: 18,
        right: 18,
        bottom: 15,
      ),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius:
            BorderRadius.circular(28),

        boxShadow: [
          BoxShadow(
            blurRadius: 15,
            color: Colors.black
                .withOpacity(.03),
          )
        ],
      ),

      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceAround,

        children: [

          navItem(
            Icons.home_rounded,
            "Home",
            0,
          ),

          navItem(
            Icons.local_shipping_outlined,
            "Trips",
            1,
          ),

          navItem(
            Icons.account_balance_wallet_outlined,
            "Earnings",
            2,
          ),

          navItem(
            Icons.person_outline,
            "Profile",
            3,
          ),
        ],
      ),
    );
  }

  Widget navItem(
      IconData icon,
      String title,
      int index) {

    bool active =
        currentIndex == index;

    return GestureDetector(

      onTap: () {
        onTap(index);
      },

      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center,

        children: [

          AnimatedContainer(
            duration:
                const Duration(
                    milliseconds: 250),

            height: 42,
            width: 70,

            decoration:
                BoxDecoration(
              color: active
                  ? AppColors.yellow1
                  : Colors.transparent,

              borderRadius:
                  BorderRadius.circular(
                      16),
            ),

            child: Icon(
              icon,
              size: 26,

              color: active
                  ? Colors.black
                  : Colors.grey,
            ),
          ),

          const SizedBox(height: 5),

          Text(
            title,

            style:
                GoogleFonts.poppins(
              fontSize: 12,

              color: active
                  ? AppColors.yellow2
                  : Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}