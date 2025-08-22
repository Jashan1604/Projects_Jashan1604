import 'package:bhukkad/pages/offer_page.dart';
import 'package:bhukkad/pages/restaurant_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: Colors.white,
                    title: Text(
                      'About Bhukkad',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    content: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "•  ",
                                style: GoogleFonts.poppins(),
                              ),
                              Text(
                                "Uncover hidden deals.",
                                style: GoogleFonts.poppins(),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Row(
                            children: [
                              Text(
                                "•  ",
                                style: GoogleFonts.poppins(),
                              ),
                              Text(
                                "Updated every Friday.",
                                style: GoogleFonts.poppins(),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Row(
                            children: [
                              Text(
                                "•  ",
                                style: GoogleFonts.poppins(),
                              ),
                              Text(
                                "Menus, Prices, Location.",
                                style: GoogleFonts.poppins(),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Row(
                            children: [
                              Text(
                                "•  ",
                                style: GoogleFonts.poppins(),
                              ),
                              Text(
                                "and More!",
                                style: GoogleFonts.poppins(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFE23744),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'OK',
                          style:
                              GoogleFonts.poppins(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            icon: Icon(
              Icons.info_outline_rounded,
              color: Color(0xFFE23744),
            ),
          ),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: Colors.white,
                    title: Text(
                      'Contact Us',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    content: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "To list your kitchen / any other queries, contact at :",
                            style: GoogleFonts.poppins(),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "+91 9041450207",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFE23744),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'OK',
                          style:
                              GoogleFonts.poppins(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            icon: Icon(
              Icons.phone,
              color: Color(0xFFE23744),
            ),
          ),
        ],
        centerTitle: true,
        leading: Icon(
          Icons.food_bank,
          color: Color(0xFFE23744),
          size: 30,
        ),
        toolbarHeight: 65,
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        title: Text(
          "भुक्कड़ iitr",
          style: GoogleFonts.baloo2(
            color: Color(0xFFE23744),
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 8,
            ),
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('restaurants')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text("Error: ${snapshot.error}"),
                  );
                }
                final restaurants = snapshot.data?.docs ?? [];
                return SizedBox(
                  height: 165,
                  width: double.infinity,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisExtent: 145,
                    ),
                    itemCount:
                        restaurants.length, // replace 10 by restaurants.length
                    itemBuilder: (context, index) {
                      final restaurant =
                          restaurants[index]; // replace 0 by index
                      String name = restaurant['name'];
                      String id = restaurant['id'];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () {
                            Get.to(
                              () => RestaurantPage(name, id, index),
                              transition: Transition.rightToLeftWithFade,
                              duration: Duration(
                                milliseconds: 150,
                              ),
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  fit: BoxFit.cover,
                                  restaurant['imageUrl'],
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Center(
                                      child: Image.asset(
                                          'assets/images/spinning_burger.gif'),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                name.length > 14
                                    ? "${name.substring(0, 14)}...."
                                    : name,
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '⚡ ${restaurant['type']} • ${restaurant['distance']}',
                                    style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        color: Color(0xFF009a51),
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 1,
                  width: screenWidth * 0.1,
                  color: Colors.grey.shade300,
                ),
                Text(
                  "🔥 WEEKLY HOT DEALS!",
                  style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.grey.shade700,
                      letterSpacing: 3,
                      fontWeight: FontWeight.w500),
                ),
                Container(
                  height: 1,
                  width: screenWidth * 0.1,
                  color: Colors.grey.shade300,
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('offers').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text("Error: ${snapshot.error}"),
                  );
                }
                final offers = snapshot.data?.docs ?? [];
                return SizedBox(
                  width: double.infinity,
                  child: GridView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisExtent: 150,
                    ),
                    itemCount: offers.length, // replace 10 by offers.length
                    itemBuilder: (context, index) {
                      final offer = offers[index]; // replace 0 by index
                      String name = offer['name'];
                      String id = offer['id'];
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: InkWell(
                          onTap: () {
                            Get.to(
                              () => OfferPage(name, id, index),
                              transition: Transition.rightToLeftWithFade,
                              duration: Duration(
                                milliseconds: 150,
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              SizedBox(
                                width: screenWidth * 0.3,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      Image.network(
                                        fit: BoxFit.cover,
                                        offer['imageUrl'],
                                        loadingBuilder:
                                            (context, child, loadingProgress) {
                                          if (loadingProgress == null) {
                                            return child;
                                          }
                                          return Center(
                                            child: Image.asset(
                                                'assets/images/spinning_burger.gif'),
                                          );
                                        },
                                      ),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                          alignment: Alignment.bottomCenter,
                                          height: 50,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                                colors: [
                                                  Colors.transparent,
                                                  // ignore: deprecated_member_use
                                                  Colors.black
                                                ],
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(4),
                                            child: Text(
                                              offer['badge'],
                                              style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    name.length > 18
                                        ? "${name.substring(0, 18)}...."
                                        : name,
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        color: Colors.amber,
                                        Icons.stars_rounded,
                                        size: 15,
                                      ),
                                      const SizedBox(
                                        width: 2.0,
                                      ),
                                      Text(
                                        "${offer['rating']}  •  ",
                                        style: GoogleFonts.poppins(
                                          color: Color(0xFF009a51),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        "Valid Till: ${offer['valid_till']}",
                                        style: GoogleFonts.poppins(
                                          color: Color(0xFF009a51),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    "• ${offer['point1']}",
                                    style: GoogleFonts.poppins(
                                      color: Colors.grey.shade800,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    "• ${offer['point2']}",
                                    style: GoogleFonts.poppins(
                                      color: Colors.grey.shade800,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    "• ${offer['point3']}",
                                    style: GoogleFonts.poppins(
                                      color: Colors.grey.shade800,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
