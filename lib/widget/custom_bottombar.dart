import 'package:drivaer_logixapp/MainScreen/driver_dashboard_screen.dart';
import 'package:drivaer_logixapp/MainScreen/earnings_screen.dart';
import 'package:drivaer_logixapp/MainScreen/profile_screen.dart';
import 'package:drivaer_logixapp/MainScreen/trips_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBottomBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onItemTapped;

  const CustomBottomBar({
    super.key,
    required this.currentIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 18, right: 18, bottom: 18),

      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(28),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,

        children: [
          GestureDetector(
            onTap: () {
              if (currentIndex != 0) {
                Navigator.pushReplacement(
                  context,

                  MaterialPageRoute(
                    builder: (_) => const DriverDashboardScreen(),
                  ),
                );
              }
            },

            child: _navItem(
              icon: Icons.home_rounded,
              label: "Home",
              isSelected: currentIndex == 0,
            ),
          ),

          GestureDetector(
            onTap: () {
              if (currentIndex != 1) {
                Navigator.pushReplacement(
                  context,

                  MaterialPageRoute(
                    builder: (_) => const AvailableTripsScreen(),
                  ),
                );
              }
            },
            child: _navItem(
              icon: Icons.local_taxi_rounded,
              label: "Trips",
              isSelected: currentIndex == 1,
            ),
          ),

          GestureDetector(
            onTap: () {
              if (currentIndex != 2) {
                Navigator.pushReplacement(
                  context,

                  MaterialPageRoute(builder: (_) => const EarningsScreen()),
                );
              }
            },
            child: _navItem(
              icon: Icons.account_balance_wallet_rounded,
              label: "Earnings",
              isSelected: currentIndex == 2,
            ),
          ),

          GestureDetector(
            onTap: () {
              if (currentIndex != 3) {
                Navigator.pushReplacement(
                  context,

                  MaterialPageRoute(builder: (_) => const ProfileScreen()),
                );
              }
            },
            child: _navItem(
              icon: Icons.person_rounded,
              label: "Profile",
              isSelected: currentIndex == 3,
            ),
          ),
        ],
      ),
    );
  }

  Widget _navItem({
    required IconData icon,
    required String label,
    required bool isSelected,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),

      padding: EdgeInsets.symmetric(
        horizontal: isSelected ? 16 : 10,
        vertical: 10,
      ),

      decoration: BoxDecoration(
        gradient: isSelected
            ? const LinearGradient(
                colors: [Color(0xffFFD84D), Color(0xffF7B500)],
              )
            : null,

        borderRadius: BorderRadius.circular(18),
      ),

      child: Row(
        mainAxisSize: MainAxisSize.min,

        children: [
          Icon(
            icon,
            size: 24,

            color: isSelected ? Colors.black : Colors.grey.shade500,
          ),

          if (isSelected) ...[
            const SizedBox(width: 8),

            Text(
              label,

              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
