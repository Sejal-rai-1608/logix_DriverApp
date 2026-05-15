import 'package:drivaer_logixapp/Trip/trip_completed_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../widget/driver_bottom_nav.dart';


class OnTheWayScreen extends StatefulWidget {
  final Map<String,dynamic> trip;

  const OnTheWayScreen({
    super.key,
    required this.trip,
  });

  @override
  State<OnTheWayScreen> createState() =>
      _OnTheWayScreenState();
}

class _OnTheWayScreenState
    extends State<OnTheWayScreen> {

  GoogleMapController?
      mapController;

  final LatLng pickup =
      const LatLng(
          12.9716,
          77.5946); // Bangalore

  final LatLng drop =
      const LatLng(
          12.2958,
          76.6394); // Mysore

  late Set<Marker> markers;

  late Set<Polyline>
      polylines;

  @override
  void initState() {
    super.initState();

    markers = {

      Marker(
        markerId:
            const MarkerId(
                "pickup"),

        position: pickup,

        infoWindow:
            const InfoWindow(
          title: "Bangalore",
          snippet:
              "Pickup",
        ),
      ),

      Marker(
        markerId:
            const MarkerId(
                "drop"),

        position: drop,

        infoWindow:
            const InfoWindow(
          title: "Mysore",
          snippet:
              "Drop Off",
        ),
      ),
    };

    polylines = {
      Polyline(
        polylineId:
            const PolylineId(
                "route"),

        points: [
          pickup,
          drop,
        ],

        width: 6,
        color: Colors.blue,
      )
    };
  }

  @override
  Widget build(
      BuildContext context) {

    return Scaffold(
      backgroundColor:
          const Color(
              0xffFFFDF6),

      bottomNavigationBar:
          const DriverBottomNav(
        currentIndex: 1,
      ),

      body: Stack(
        children: [

          GoogleMap(
            initialCameraPosition:
                CameraPosition(
              target: pickup,
              zoom: 7.2,
            ),

            markers:
                markers,

            polylines:
                polylines,

            myLocationEnabled:
                true,

            myLocationButtonEnabled:
                false,

            onMapCreated:
                (controller) {
              mapController =
                  controller;
            },
          ),

          SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets
                      .all(18),

              child: Column(
                children: [

                  Row(
                    children: [

                      topButton(
                        Icons
                            .arrow_back_ios_new,
                        () {
                          Navigator.pop(
                              context);
                        },
                      ),

                      const Spacer(),

                      Text(
                        "On The Way",

                        style:
                            GoogleFonts.poppins(
                          fontSize:
                              20,

                          fontWeight:
                              FontWeight
                                  .w700,
                        ),
                      ),

                      const Spacer(),

                      const SizedBox(
                          width:
                              55)
                    ],
                  ),

                  const Spacer(),

                  Container(
                    padding:
                        const EdgeInsets
                            .all(
                            18),

                    decoration:
                        BoxDecoration(
                      color: Colors
                          .white,

                      borderRadius:
                          BorderRadius.circular(
                              28),

                      boxShadow: [
                        BoxShadow(
                          color: Colors
                              .black
                              .withOpacity(
                                  .05),

                          blurRadius:
                              15,
                        )
                      ],
                    ),

                    child:
                        Column(
                      children: [

                        Row(
                          children: [

                            Container(
                              width:
                                  50,
                              height:
                                  50,

                              decoration:
                                  BoxDecoration(
                                color: Colors.amber.shade100,

                                shape: BoxShape.circle,
                              ),

                              child:
                                  const Icon(
                                Icons.local_shipping,
                              ),
                            ),

                            const SizedBox(width: 14),

                            Expanded(
                              child:
                                  Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,

                                children: [

                                  Text(
                                    "Trip #${(widget.trip["id"] ?? "TRP0000").toString()}",

                                    style:
                                        GoogleFonts.poppins(
                                      fontSize: 18,

                                      fontWeight:
                                          FontWeight.w700,
                                    ),
                                  ),

                                  Text(
                                    "${(widget.trip["from"] ?? "Unknown").toString()} → ${(widget.trip["to"] ?? "Unknown").toString()}",

                                    style:
                                        GoogleFonts.poppins(
                                      color: Colors.grey,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),

                        const SizedBox(height: 18),

                        Divider(),

                        const SizedBox(height: 15),

                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,

                          children: [

                            Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,

                              children: [

                                Text(
                                  "Estimated Arrival",

                                  style:
                                      GoogleFonts.poppins(
                                    color:
                                        Colors.grey,
                                  ),
                                ),

                                Text(
                                  "01:30 PM",

                                  style:
                                      GoogleFonts.poppins(
                                    fontSize:
                                        22,

                                    fontWeight:
                                        FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),

                            ElevatedButton.icon(
                              style:
                                  ElevatedButton.styleFrom(
                                backgroundColor:
                                    Colors.blue,

                                padding:
                                    const EdgeInsets.symmetric(
                                  horizontal:
                                      28,

                                  vertical:
                                      16,
                                ),

                                shape:
                                    RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(
                                          18),
                                ),
                              ),

                              onPressed: () {

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => TripCompletedScreen(
                                      trip: widget.trip,
                                    ),
                                  ),
                                );

                              },

                              icon:
                                  const Icon(
                                Icons
                                    .navigation,
                                color: Colors.white,
                              ),

                              label:
                                  Text(
                                "Navigate",

                                style:
                                    GoogleFonts.poppins(
                                  color:
                                      Colors.white,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget topButton(
      IconData icon,
      VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        width: 52,
        height: 52,

        decoration:
            BoxDecoration(
          color: Colors.white,

          borderRadius:
              BorderRadius.circular(
                  18),
        ),

        child:
            Icon(icon),
      ),
    );
  }
}