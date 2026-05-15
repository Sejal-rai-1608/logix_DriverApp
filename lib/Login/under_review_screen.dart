import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_colors.dart';

import 'package:drivaer_logixapp/MainScreen/driver_dashboard_screen.dart';

class DriverUnderReviewScreen extends StatefulWidget {
  const DriverUnderReviewScreen({super.key});

  @override
  State<DriverUnderReviewScreen> createState() =>
      _DriverUnderReviewScreenState();
}

class _DriverUnderReviewScreenState
    extends State<DriverUnderReviewScreen> {

  bool verificationComplete = false;

  @override
  void initState() {
    super.initState();

    /// Backend later:
    /// pollReviewStatus();

    fakeReviewCheck();
  }

  void fakeReviewCheck() {

    Timer(
      const Duration(seconds: 8),
      () {

        setState(() {
          verificationComplete = true;
        });

      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.bg,
      

      body: SafeArea(
        child: SingleChildScrollView(

          padding:
          const EdgeInsets.symmetric(
            horizontal: 22,
            vertical: 20,
          ),

          child: Column(
            children: [

              const SizedBox(height:20),

              /// LOGO

              Row(
                mainAxisAlignment:
                MainAxisAlignment.center,

                children: [

                  const Icon(
                    Icons.local_shipping,
                    color:
                    AppColors.yellow2,
                    size:40,
                  ),

                  const SizedBox(width:8),

                  RichText(
                    text: TextSpan(
                      children: [

                        TextSpan(
                          text:"Driver",

                          style:
                          GoogleFonts.poppins(

                            fontSize:32,
                            color:Colors.black,
                            fontWeight:
                            FontWeight.w800,
                          ),
                        ),

                        TextSpan(
                          text:"X",

                          style:
                          GoogleFonts.poppins(

                            color:
                            AppColors.yellow2,

                            fontSize:32,

                            fontWeight:
                            FontWeight.w800,
                          ),
                        )

                      ],
                    ),
                  )

                ],
              ),

              const SizedBox(height:40),

              heroSection(),

              const SizedBox(height:30),

              Text(
                "Your account is",

                style:
                GoogleFonts.poppins(
                  fontWeight:
                  FontWeight.w700,

                  fontSize:34,
                ),
              ),

              Text(
                verificationComplete
                    ? "approved"
                    : "under review",

                style:
                GoogleFonts.poppins(
                  color:
                  AppColors.yellow2,

                  fontWeight:
                  FontWeight.w800,

                  fontSize:34,
                ),
              ),

              const SizedBox(height:20),

              Text(
                verificationComplete
                    ? "You can now start accepting trips"
                    : "We'll notify you once profile and documents are approved.",

                textAlign:
                TextAlign.center,

                style:
                GoogleFonts.poppins(
                  color:
                  Colors.grey,
                  fontSize:16,
                ),
              ),

              const SizedBox(height:35),

              timelineCard(),

              const SizedBox(height:35),

              verificationComplete
                  ? const Icon(
                Icons.check_circle,
                size:60,
                color:
                Colors.green,
              )
                  : const CircularProgressIndicator(
                color:
                AppColors.yellow2,
              ),

              const SizedBox(height:40),

              GestureDetector(

                onTap:(){

                  Navigator.pushAndRemoveUntil(

                    context,

                    MaterialPageRoute(
                      builder:(_)=>
                      const DriverDashboardScreen(),
                    ),

                        (route)=>false,
                  );

                },

                child: Container(

                  width:double.infinity,
                  height:65,

                  decoration:
                  BoxDecoration(

                    gradient:
                    const LinearGradient(

                      colors:[

                        Color(0xffFFD84D),

                        Color(0xffF7B500)
                      ],
                    ),

                    borderRadius:
                    BorderRadius.circular(
                        25),
                  ),

                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.center,

                    children: [

                      const Icon(
                        Icons.login,
                      ),

                      const SizedBox(
                        width:10,
                      ),

                      Text(

                        verificationComplete
                            ? "Start Driving"
                            : "Back to Login",

                        style:
                        GoogleFonts.poppins(

                            fontSize:20,

                            fontWeight:
                            FontWeight.w700
                        ),
                      )
                    ],
                  ),
                ),
              ),

              const SizedBox(height:30)

            ],
          ),
        ),
      ),
    );
  }

  Widget heroSection() {
    return Container(
      width: 320,
      height: 320,

      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.yellow1.withOpacity(.08),
        boxShadow: [
          BoxShadow(
            blurRadius: 25,
            spreadRadius: 5,
            color: AppColors.yellow2.withOpacity(.12),
          )
        ],
      ),

      child: Center(
        child: Image.asset(
          "assets/screen/driver_verification.png",
          fit: BoxFit.contain,
        ),
      ),
    );
  }


  Widget cardIcon(
      IconData icon){

    return Container(

      padding:
      const EdgeInsets.all(14),

      decoration:
      BoxDecoration(

        color:Colors.white,

        borderRadius:
        BorderRadius.circular(
            20),

        boxShadow:[

          BoxShadow(
              blurRadius:10,

              color:Colors.black
                  .withOpacity(.05)
          )
        ],
      ),

      child:Icon(
        icon,

        color:
        AppColors.yellow2,
      ),
    );
  }


  Widget timelineCard(){

    return Container(

      padding:
      const EdgeInsets.all(22),

      decoration:
      BoxDecoration(

          color:
          Colors.white,

          borderRadius:
          BorderRadius.circular(
              30)
      ),

      child:Column(

        children:[

          timelineItem(
            true,
            "Profile Completed",
            Icons.person,
          ),

          timelineItem(
            true,
            "Documents Uploaded",
            Icons.description,
          ),

          timelineItem(
            verificationComplete,
            verificationComplete
                ? "Verification Complete"
                : "Verification in progress",

            Icons.access_time,

            subtitle:
            "Our team is reviewing information",
          )

        ],
      ),
    );
  }



  Widget timelineItem(
      bool done,
      String title,
      IconData icon,
      {String? subtitle}) {

    return Padding(
      padding:
      const EdgeInsets.only(
          bottom:25),

      child: Row(

        children:[

          CircleAvatar(
            radius:18,

            backgroundColor:
            done
                ? Colors.green
                : AppColors.yellow2,

            child:Icon(

              done
                  ? Icons.check
                  : Icons.more_horiz,

              color:
              Colors.white,
            ),
          ),

          const SizedBox(width:18),

          Expanded(
            child:Column(

              crossAxisAlignment:
              CrossAxisAlignment.start,

              children:[

                Text(
                  title,

                  style:
                  GoogleFonts.poppins(

                      fontSize:18,

                      fontWeight:
                      FontWeight.w700
                  ),
                ),

                if(subtitle!=null)

                  Text(
                    subtitle,

                    style:
                    GoogleFonts.poppins(
                      color:
                      Colors.grey,
                    ),
                  )
              ],
            ),
          ),

          CircleAvatar(

            backgroundColor:
            Colors.green
                .withOpacity(.1),

            child:Icon(
              icon,

              color:
              Colors.green,
            ),
          )
        ],
      ),
    );
  }
}