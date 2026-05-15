import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../theme/app_colors.dart';
import '../widget/AuthButton.dart';
import 'package:drivaer_logixapp/Login/under_review_screen.dart';

class DriverDocumentsScreen extends StatefulWidget {
  const DriverDocumentsScreen({super.key});

  @override
  State<DriverDocumentsScreen> createState() =>
      _DriverDocumentsScreenState();
}

class _DriverDocumentsScreenState
    extends State<DriverDocumentsScreen> {

  final ImagePicker picker = ImagePicker();

  final List<Map<String,dynamic>> docs=[

    {
      "title":"Driver License",
      "subtitle":"Upload your valid driving license",
      "icon":Icons.badge_outlined,
      "file":null,
      "status":"pending"
    },

    {
      "title":"RC Book",
      "subtitle":"Upload vehicle registration",
      "icon":Icons.menu_book,
      "file":null,
      "status":"approved"
    },

    {
      "title":"Vehicle Insurance",
      "subtitle":"Upload insurance document",
      "icon":Icons.shield_outlined,
      "file":null,
      "status":"approved"
    },

    {
      "title":"Vehicle Permit",
      "subtitle":"Upload permit document",
      "icon":Icons.description_outlined,
      "file":null,
      "status":"pending"
    },

    {
      "title":"Aadhaar / Government ID",
      "subtitle":"Upload Aadhaar or ID",
      "icon":Icons.credit_card,
      "file":null,
      "status":"rejected"
    },

    {
      "title":"Profile Photo",
      "subtitle":"Upload profile photo",
      "icon":Icons.camera_alt_outlined,
      "file":null,
      "status":"approved"
    },

  ];



  Future pickImage(int index) async {

    final XFile? image=
        await picker.pickImage(
      source: ImageSource.gallery,
    );

    if(image==null)return;

    setState(() {

      docs[index]["file"]=
          File(image.path);

      docs[index]["status"]=
          "pending";

    });

  }

  Color statusColor(String status){

    switch(status){

      case "approved":
        return Colors.green;

      case "rejected":
        return Colors.red;

      default:
        return Colors.orange;
    }

  }


  submit(){

    bool allUploaded=true;

    for(var d in docs){

      if(d["file"]==null){

        allUploaded=false;

      }
    }

    if(!allUploaded){

      Navigator.pushReplacement(

        context,

        MaterialPageRoute(
          builder:(_)=>
          const DriverUnderReviewScreen(),
        ),
      );

      return;
    }


    ScaffoldMessenger.of(context)
        .showSnackBar(
      const SnackBar(
        content:
        Text("Submitted"),
      ),
    );



/// BACKEND READY:

/// api.uploadDocuments(files)

  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
      const Color(0xffFFFDF6),

      body: SafeArea(

        child: SingleChildScrollView(

          padding:
          const EdgeInsets.all(20),

          child: Column(

            children:[

              Align(
                alignment:
                Alignment.centerLeft,

                child:
                GestureDetector(

                  onTap:(){

                    Navigator.pop(context);

                  },

                  child:Container(

                    width:55,
                    height:55,

                    decoration:
                    BoxDecoration(

                        color:Colors.white,

                        borderRadius:
                        BorderRadius.circular(
                            18)
                    ),

                    child:const Icon(
                        Icons.arrow_back_ios_new
                    ),
                  ),
                ),
              ),

              const SizedBox(height:20),

              Text(
                "Upload Documents",

                style:
                GoogleFonts.poppins(

                    fontWeight:
                    FontWeight.w700,

                    fontSize:30
                ),
              ),

              const SizedBox(height:10),

              Text(
                "Please upload clear photos for verification",

                textAlign:
                TextAlign.center,

                style:
                GoogleFonts.poppins(
                    color:
                    Colors.grey
                ),
              ),

              const SizedBox(height:30),

              ListView.builder(

                itemCount:
                docs.length,

                shrinkWrap:true,

                physics:
                NeverScrollableScrollPhysics(),

                itemBuilder:(context,index){

                  var item=
                  docs[index];

                  return Container(

                    margin:
                    const EdgeInsets.only(
                        bottom:20),

                    padding:
                    const EdgeInsets.all(
                        18),

                    decoration:
                    BoxDecoration(

                      color:
                      Colors.white,

                      borderRadius:
                      BorderRadius.circular(
                          28),

                    ),

                    child:Row(

                      children:[

                        Container(

                          width:60,
                          height:60,

                          decoration:
                          BoxDecoration(

                              color:
                              const Color(
                                  0xffFFF5DB),

                              borderRadius:
                              BorderRadius.circular(
                                  18)
                          ),

                          child:Icon(
                              item["icon"]
                          ),
                        ),

                        const SizedBox(width:15),

                        Expanded(

                          child:Column(

                            crossAxisAlignment:
                            CrossAxisAlignment.start,

                            children:[

                              Text(
                                  item["title"],

                                  style:
                                  GoogleFonts.poppins(

                                      fontSize:18,

                                      fontWeight:
                                      FontWeight.w700
                                  )
                              ),

                              Text(
                                  item["subtitle"],

                                  style:
                                  GoogleFonts.poppins(
                                      color:
                                      Colors.grey
                                  )
                              ),

                              const SizedBox(
                                  height:10
                              ),

                              Container(

                                padding:
                                const EdgeInsets.symmetric(
                                    horizontal:12,
                                    vertical:6
                                ),

                                decoration:
                                BoxDecoration(

                                  color:
                                  statusColor(
                                      item["status"]
                                  ),

                                  borderRadius:
                                  BorderRadius.circular(
                                      20
                                  ),
                                ),

                                child:Text(

                                  item["status"],

                                  style:
                                  const TextStyle(
                                      color:
                                      Colors.white
                                  ),
                                ),
                              )

                            ],
                          ),
                        ),

                        GestureDetector(

                          onTap:(){

                            pickImage(index);

                          },

                          child:
                          item["file"]==null

                              ? Container(

                            width:55,
                            height:55,

                            decoration:
                            BoxDecoration(

                                color:
                                const Color(
                                    0xffFFF5DB),

                                borderRadius:
                                BorderRadius.circular(
                                    16)
                            ),

                            child:
                            const Icon(
                                Icons.upload
                            ),
                          )

                              : ClipRRect(

                            borderRadius:
                            BorderRadius.circular(
                                14
                            ),

                            child:Image.file(

                              item["file"],

                              width:70,
                              height:70,

                              fit:
                              BoxFit.cover,

                            ),
                          ),
                        )
                      ],
                    ),
                  );

                },
              ),

              const SizedBox(height:30),

              AuthButton(
                title:
                "Submit Documents",

                onTap:submit,
              ),

              const SizedBox(height:50)

            ],
          ),
        ),
      ),
    );
  }
}