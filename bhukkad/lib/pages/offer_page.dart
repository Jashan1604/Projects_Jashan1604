import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OfferPage extends StatefulWidget {
  final String name;
  final String id;
  final int index;
  const OfferPage(this.name, this.id, this.index, {super.key});

  @override
  State<OfferPage> createState() => _OfferPageState();
}

class _OfferPageState extends State<OfferPage> {
  int currentIndex = 0;
  List<dynamic> imagesList = [];
  List<dynamic> imagesIndexes = [];
  late PageController _controller;

  @override
  void initState() {
    fetchImagesList();
    fetchOfferData();
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void fetchImagesList() {
    FirebaseFirestore.instance
        .collection('restaurants_images')
        .doc(widget.id)
        .snapshots()
        .listen((snapshot) {
      if (snapshot.data() != null) {
        final imagesMap = snapshot.data() as Map<String, dynamic>;
        setState(() {
          imagesList = imagesMap['images'] ?? [];
          imagesIndexes = imagesMap['indexes'] ?? [];
        });
      }
    });
  }

  String offerTitle = "";
  String condition1 = "", condition2 = "", condition3 = "";
  String rating = "";
  String validTill = "";

  void fetchOfferData() {
    FirebaseFirestore.instance
        .collection('offers')
        .doc(widget.id)
        .snapshots()
        .listen((snapshot) {
      if (snapshot.data() != null) {
        final dataMap = snapshot.data() as Map<String, dynamic>;
        setState(() {
          offerTitle = dataMap['offer_title'];
          condition1 = dataMap['point1'];
          condition2 = dataMap['point2'];
          condition3 = dataMap['point3'];
          rating = dataMap['rating'];
          validTill = dataMap['valid_till'];
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        toolbarHeight: 50,
        backgroundColor: Colors.black,
        title: Text(
          widget.name,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
        children: [
          imagesList.isEmpty
              ? const Center(
                  child:
                      CircularProgressIndicator(), // Show loader while fetching
                )
              : Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 250,
                      child: PageView.builder(
                        controller: _controller,
                        itemCount: imagesList.length,
                        onPageChanged: (value) {
                          setState(() {
                            currentIndex = value;
                          });
                        },
                        itemBuilder: (context, index) {
                          return FittedBox(
                            fit: BoxFit.cover,
                            child: Image.network(
                              imagesList[index],
                              errorBuilder: (context, error, stackTrace) {
                                return const Center(
                                  child: Text("Image failed to load."),
                                );
                              },
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 145,
                      right: 145,
                      child: Container(
                        alignment: Alignment.center,
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: Colors.white.withAlpha(150),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: imagesIndexes.map((item) {
                            return Container(
                              width: 9,
                              height: 9,
                              margin: const EdgeInsets.symmetric(horizontal: 2),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(9),
                                  color: currentIndex == item
                                      ? Colors.black
                                      : Colors.black.withAlpha(70)),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.maxFinite,
              child: Stack(
                children: [
                  Image.asset('assets/images/coupon_gradient.png'),
                  Positioned(
                    top: 25,
                    bottom: 25,
                    left: 105,
                    child: SizedBox(
                      width: 200,
                      child: Center(
                        child: Text(
                          offerTitle,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700,
                            fontSize: 28,
                            color: Colors.grey.shade800,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                color: Colors.amber,
                Icons.stars_rounded,
                size: 18,
              ),
              const SizedBox(
                width: 10.0,
              ),
              Text(
                "Valid Till -  $validTill",
                style: GoogleFonts.poppins(
                  // color: Color(0xFF009a51),
                  color: Colors.grey.shade800,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Conditions:",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 8,
                ),
                Text(
                  "• $condition1",
                  style: GoogleFonts.poppins(
                    color: Colors.grey.shade800,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  "• $condition2",
                  style: GoogleFonts.poppins(
                    color: Colors.grey.shade800,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  "• $condition3",
                  style: GoogleFonts.poppins(
                    color: Colors.grey.shade800,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
