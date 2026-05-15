import 'package:drivaer_logixapp/profilpage/logout_confirmation_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_colors.dart';
import '../profilpage/logout_confirmation_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() =>
      _SettingsScreenState();
}

class _SettingsScreenState
    extends State<SettingsScreen> {

  bool notificationOn = true;
  bool soundOn = true;

  String language = "English";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.bg,

      body: SafeArea(
        child: SingleChildScrollView(
          padding:
          const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 18,
          ),

          child: Column(
            children: [

              /// top row
              Row(
                children: [

                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },

                    child: Container(
                      width: 55,
                      height: 55,

                      decoration:
                      BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.circular(
                            18),

                        boxShadow: [
                          BoxShadow(
                            blurRadius: 20,
                            color: Colors.black
                                .withOpacity(.04),
                          )
                        ],
                      ),

                      child: const Icon(
                        Icons.arrow_back_ios_new,
                      ),
                    ),
                  ),

                  const Spacer(),

                  Text(
                    "Settings",
                    style:
                    GoogleFonts.poppins(
                      fontSize: 21,
                      fontWeight:
                      FontWeight.w700,
                    ),
                  ),

                  const Spacer(),

                  const SizedBox(
                    width: 55,
                  )
                ],
              ),

              const SizedBox(height: 20),

              /// background decorative

              Stack(
                children: [

                  Positioned(
                    left:-10,
                    top:20,

                    child:Opacity(
                      opacity: .10,

                      child: Image.asset(
                        "assets/logo/truck.png",
                        width:120,
                      ),
                    ),
                  ),

                  Positioned(
                    right:-10,
                    top:0,

                    child:Opacity(
                      opacity:.08,

                      child: Icon(
                        Icons.inventory_2,
                        size:110,
                        color: Colors.orange,
                      ),
                    ),
                  ),

                  Container(
                    margin:
                    const EdgeInsets.only(
                        top:45),

                    padding:
                    const EdgeInsets.all(
                        14),

                    decoration:
                    BoxDecoration(
                      color: Colors.white,

                      borderRadius:
                      BorderRadius.circular(
                          32),

                      boxShadow: [

                        BoxShadow(
                          blurRadius:30,

                          color:
                          Colors.black
                              .withOpacity(
                              .05),
                        )
                      ],
                    ),

                    child: Column(
                      children: [

                        settingsTile(
                          icon:
                          Icons.notifications_none,

                          title:
                          "Notifications",

                            trailing:
                            Transform.scale(
                              scale: .85,
                              child:Switch(
                                value:
                                notificationOn,

                                activeColor:
                                Colors.green,

                                onChanged:
                                    (value){

                                  setState(() {

                                    notificationOn=
                                        value;
                                  });
                                },
                              ),
                            ),
                          ),

                          divider(),

                        settingsTile(
                          icon:
                          Icons.volume_up_outlined,

                          title:
                          "Sound",

                          trailing:
                          Switch(
                            value:
                            soundOn,

                            activeColor:
                            Colors.green,

                            onChanged:
                                (value){

                              setState(() {
                                soundOn=value;
                              });
                            },
                          ),
                        ),

                        divider(),

                        settingsTile(
                          icon:
                          Icons.language,

                          title:
                          "Language",

                          trailing:
                          Row(
                            mainAxisSize:
                            MainAxisSize.min,

                            children: [

                              Text(
                                language,

                                style:
                                GoogleFonts
                                    .poppins(
                                  color:
                                  Colors.grey,
                                ),
                              ),

                              const SizedBox(
                                  width:8),

                              const Icon(
                                Icons
                                    .chevron_right,
                              )
                            ],
                          ),

                          onTap: (){
                            selectLanguage();
                          },
                        ),

                        divider(),

                        settingsTile(
                          icon:
                          Icons.privacy_tip_outlined,

                          title:
                          "Privacy Policy",

                          onTap: (){
                            showSnack(
                                "Privacy Policy");
                          },
                        ),

                        divider(),

                        settingsTile(
                          icon:
                          Icons.description_outlined,

                          title:
                          "Terms & Conditions",

                          onTap: (){
                            showSnack(
                                "Terms");
                          },
                        ),

                        divider(),

                        settingsTile(
                          icon:
                          Icons.logout,

                          iconColor:
                          Colors.red,

                          title:
                          "Logout",

                          titleColor:
                          Colors.red,

                          onTap: (){

                            Navigator.push(
                              context,

                              MaterialPageRoute(
                                builder:(_)=>
                                const LogoutConfirmationScreen(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget divider() {
    return Padding(
      padding:
      const EdgeInsets.symmetric(
          horizontal:10),

      child: Divider(
        color:
        Colors.grey.shade200,
      ),
    );
  }

  Widget settingsTile({

    required IconData icon,
    required String title,

    Color iconColor =
        const Color(0xffF4B400),

    Color titleColor =
        Colors.black,

    Widget? trailing,

    VoidCallback? onTap,
  }) {

    return InkWell(
      onTap: onTap,

      child: Padding(
        padding:
        const EdgeInsets.symmetric(
          vertical: 12, // reduced
        ),

        child: Row(
          children: [

            Container(
              width: 48, // reduced
              height: 48,

              decoration:
              BoxDecoration(
                color:
                const Color(
                    0xffFFF8E7),

                borderRadius:
                BorderRadius.circular(
                    14),
              ),

              child: Icon(
                icon,
                color: iconColor,
                size: 24, // reduced
              ),
            ),

            const SizedBox(width: 14),

            Expanded(
              child: Text(
                title,

                style:
                GoogleFonts.poppins(
                  fontWeight:
                  FontWeight.w600,

                  fontSize: 15, // reduced

                  color:
                  titleColor,
                ),
              ),
            ),

            trailing ??

                Icon(
                  Icons.chevron_right,
                  size: 24, // reduced

                  color:
                  Colors.grey.shade400,
                )
          ],
        ),
      ),
    );
  }

  void showSnack(String text){

    ScaffoldMessenger.of(
        context)
        .showSnackBar(

      SnackBar(
        content:
        Text("$text clicked"),
      ),
    );
  }

  void selectLanguage(){

    showModalBottomSheet(

      context: context,

      builder: (_){

        return SafeArea(
          child: Column(
            mainAxisSize:
            MainAxisSize.min,

            children: [

              ListTile(
                title:
                const Text(
                    "English"),

                onTap:(){

                  setState(() {
                    language=
                    "English";
                  });

                  Navigator.pop(
                      context);
                },
              ),

              ListTile(
                title:
                const Text(
                    "Hindi"),

                onTap:(){

                  setState(() {
                    language=
                    "Hindi";
                  });

                  Navigator.pop(
                      context);
                },
              ),

              ListTile(
                title:
                const Text(
                    "Marathi"),

                onTap:(){

                  setState(() {
                    language=
                    "Marathi";
                  });

                  Navigator.pop(
                      context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}