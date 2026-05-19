import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BankDetailsScreen extends StatefulWidget {
  const BankDetailsScreen({super.key});

  @override
  State<BankDetailsScreen> createState() =>
      _BankDetailsScreenState();
}

class _BankDetailsScreenState
    extends State<BankDetailsScreen> {
  final holderNameController =
      TextEditingController(
    text: "John Driver",
  );

  final bankNameController =
      TextEditingController(
    text: "HDFC Bank",
  );

  final accountNumberController =
      TextEditingController(
    text: "458796321458",
  );

  final ifscController =
      TextEditingController(
    text: "HDFC0004587",
  );

  final upiController =
      TextEditingController(
    text: "johndriver@upi",
  );

  bool isSaving = false;

  Future<void> saveBankDetails() async {
    setState(() {
      isSaving = true;
    });

    await Future.delayed(
      const Duration(seconds: 2),
    );

    if (!mounted) return;

    setState(() {
      isSaving = false;
    });

    ScaffoldMessenger.of(context)
        .showSnackBar(
      const SnackBar(
        content: Text(
          "Bank Details Updated",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xffFFFBF0),

      body: SafeArea(
        child: SingleChildScrollView(
          physics:
              const BouncingScrollPhysics(),

          padding:
              const EdgeInsets.fromLTRB(
            18,
            18,
            18,
            30,
          ),

          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [
              /// TOP BAR
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(
                        context,
                      );
                    },

                    child: Container(
                      width: 50,
                      height: 50,

                      decoration:
                          BoxDecoration(
                        color: Colors.white,

                        borderRadius:
                            BorderRadius
                                .circular(
                          18,
                        ),

                        boxShadow: [
                          BoxShadow(
                            blurRadius: 14,

                            color: Colors
                                .black
                                .withOpacity(
                                    .04),
                          ),
                        ],
                      ),

                      child: const Icon(
                        Icons
                            .arrow_back_ios_new_rounded,

                        size: 20,
                      ),
                    ),
                  ),

                  const SizedBox(width: 16),

                  Column(
                    crossAxisAlignment:
                        CrossAxisAlignment
                            .start,

                    children: [
                      Text(
                        "Bank Details",

                        style:
                            GoogleFonts
                                .poppins(
                          fontSize: 22,

                          fontWeight:
                              FontWeight
                                  .w700,

                          color:
                              const Color(
                            0xff1A1A1A,
                          ),
                        ),
                      ),

                      const SizedBox(
                          height: 3),

                      Text(
                        "Manage payout account",

                        style:
                            GoogleFonts
                                .poppins(
                          fontSize: 13,

                          color:
                              Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 28),

              /// BANK CARD
              Container(
                width: double.infinity,

                padding:
                    const EdgeInsets.all(
                  22,
                ),

                decoration:
                    BoxDecoration(
                  gradient:
                      const LinearGradient(
                    colors: [
                      Color(0xffFFD84D),
                      Color(0xffF7B500),
                    ],

                    begin:
                        Alignment.topLeft,
                    end:
                        Alignment.bottomRight,
                  ),

                  borderRadius:
                      BorderRadius.circular(
                    30,
                  ),

                  boxShadow: [
                    BoxShadow(
                      blurRadius: 18,

                      offset:
                          const Offset(
                        0,
                        8,
                      ),

                      color: const Color(
                        0xffF7B500,
                      ).withOpacity(
                        .25,
                      ),
                    ),
                  ],
                ),

                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment
                          .start,

                  children: [
                    Row(
                      children: [
                        Container(
                          width: 62,
                          height: 62,

                          decoration:
                              BoxDecoration(
                            color: Colors
                                .white
                                .withOpacity(
                              .25,
                            ),

                            borderRadius:
                                BorderRadius
                                    .circular(
                              20,
                            ),
                          ),

                          child: const Icon(
                            Icons
                                .account_balance_rounded,

                            size: 34,

                            color:
                                Colors.white,
                          ),
                        ),

                        const Spacer(),

                        Container(
                          padding:
                              const EdgeInsets.symmetric(
                            horizontal:
                                12,
                            vertical: 6,
                          ),

                          decoration:
                              BoxDecoration(
                            color: Colors
                                .white
                                .withOpacity(
                              .20,
                            ),

                            borderRadius:
                                BorderRadius
                                    .circular(
                              30,
                            ),
                          ),

                          child: Text(
                            "Primary Account",

                            style:
                                GoogleFonts.poppins(
                              color: Colors
                                  .white,

                              fontWeight:
                                  FontWeight
                                      .w600,

                              fontSize:
                                  12,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 26),

                    Text(
                      "HDFC BANK",

                      style:
                          GoogleFonts.poppins(
                        color:
                            Colors.white70,

                        letterSpacing:
                            1.5,

                        fontSize: 13,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      "4587 9632 1458",

                      style:
                          GoogleFonts.poppins(
                        color: Colors.white,

                        fontSize: 28,

                        fontWeight:
                            FontWeight
                                .w700,

                        letterSpacing:
                            2,
                      ),
                    ),

                    const SizedBox(height: 18),

                    Row(
                      children: [
                        Column(
                          crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,

                          children: [
                            Text(
                              "Account Holder",

                              style:
                                  GoogleFonts.poppins(
                                color: Colors
                                    .white70,

                                fontSize: 12,
                              ),
                            ),

                            const SizedBox(
                                height: 4),

                            Text(
                              "John Driver",

                              style:
                                  GoogleFonts.poppins(
                                color: Colors
                                    .white,

                                fontWeight:
                                    FontWeight
                                        .w600,
                              ),
                            ),
                          ],
                        ),

                        const Spacer(),

                        Column(
                          crossAxisAlignment:
                              CrossAxisAlignment
                                  .end,

                          children: [
                            Text(
                              "IFSC",

                              style:
                                  GoogleFonts.poppins(
                                color: Colors
                                    .white70,

                                fontSize: 12,
                              ),
                            ),

                            const SizedBox(
                                height: 4),

                            Text(
                              "HDFC0004587",

                              style:
                                  GoogleFonts.poppins(
                                color: Colors
                                    .white,

                                fontWeight:
                                    FontWeight
                                        .w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              /// BANK DETAILS
              sectionTitle(
                "Account Details",
              ),

              const SizedBox(height: 18),

              modernField(
                "Account Holder Name",
                Icons.person_outline,
                holderNameController,
              ),

              modernField(
                "Bank Name",
                Icons.account_balance_outlined,
                bankNameController,
              ),

              modernField(
                "Account Number",
                Icons.credit_card_outlined,
                accountNumberController,
              ),

              modernField(
                "IFSC Code",
                Icons.code_rounded,
                ifscController,
              ),

              modernField(
                "UPI ID",
                Icons.qr_code_rounded,
                upiController,
              ),

              const SizedBox(height: 28),

              /// STATUS CARD
              Container(
                padding:
                    const EdgeInsets.all(
                  18,
                ),

                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius:
                      BorderRadius.circular(
                    24,
                  ),

                  boxShadow: [
                    BoxShadow(
                      blurRadius: 14,

                      color: Colors
                          .black
                          .withOpacity(
                              .03),
                    ),
                  ],
                ),

                child: Row(
                  children: [
                    Container(
                      width: 54,
                      height: 54,

                      decoration:
                          BoxDecoration(
                        color:
                            Colors.green
                                .withOpacity(
                          .12,
                        ),

                        borderRadius:
                            BorderRadius
                                .circular(
                          18,
                        ),
                      ),

                      child: const Icon(
                        Icons
                            .verified_rounded,

                        color:
                            Colors.green,
                      ),
                    ),

                    const SizedBox(width: 16),

                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment
                                .start,

                        children: [
                          Text(
                            "Bank Verification",

                            style:
                                GoogleFonts.poppins(
                              fontWeight:
                                  FontWeight
                                      .w600,

                              fontSize:
                                  15,
                            ),
                          ),

                          const SizedBox(
                              height: 4),

                          Text(
                            "Your account is verified for payouts",

                            style:
                                GoogleFonts.poppins(
                              color: Colors
                                  .grey,

                              fontSize:
                                  12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 34),

              /// SAVE BUTTON
              GestureDetector(
                onTap:
                    isSaving
                        ? null
                        : saveBankDetails,

                child: Container(
                  height: 62,
                  width: double.infinity,

                  decoration:
                      BoxDecoration(
                    gradient:
                        const LinearGradient(
                      colors: [
                        Color(
                          0xffFFD84D,
                        ),
                        Color(
                          0xffF7B500,
                        ),
                      ],
                    ),

                    borderRadius:
                        BorderRadius.circular(
                      22,
                    ),
                  ),

                  alignment:
                      Alignment.center,

                  child:
                      isSaving
                          ? const SizedBox(
                            width: 24,
                            height: 24,

                            child:
                                CircularProgressIndicator(
                              strokeWidth:
                                  2.5,

                              color:
                                  Colors.black,
                            ),
                          )
                          : Text(
                            "Save Details",

                            style:
                                GoogleFonts.poppins(
                              fontSize:
                                  16,

                              fontWeight:
                                  FontWeight
                                      .w700,

                              color:
                                  Colors.black,
                            ),
                          ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget sectionTitle(
    String title,
  ) {
    return Text(
      title,

      style: GoogleFonts.poppins(
        fontSize: 18,

        fontWeight: FontWeight.w700,

        color: const Color(
          0xff1A1A1A,
        ),
      ),
    );
  }

  Widget modernField(
    String hint,
    IconData icon,
    TextEditingController controller,
  ) {
    return Container(
      margin:
          const EdgeInsets.only(
        bottom: 14,
      ),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius:
            BorderRadius.circular(
          22,
        ),

        boxShadow: [
          BoxShadow(
            blurRadius: 14,

            color:
                Colors.black.withOpacity(
              .03,
            ),
          ),
        ],
      ),

      child: TextFormField(
        controller: controller,

        style: GoogleFonts.poppins(
          fontWeight:
              FontWeight.w500,
        ),

        decoration: InputDecoration(
          border: InputBorder.none,

          contentPadding:
              const EdgeInsets.symmetric(
            vertical: 20,
          ),

          prefixIcon: Icon(
            icon,

            color: const Color(
              0xffF7B500,
            ),
          ),

          hintText: hint,

          hintStyle:
              GoogleFonts.poppins(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}