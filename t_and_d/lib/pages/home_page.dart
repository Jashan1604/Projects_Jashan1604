import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart' as c_slider;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:t_and_d/components/products_list.dart';
import 'package:page_transition/page_transition.dart';
import 'package:t_and_d/pages/about_us.dart';
import 'package:t_and_d/pages/product_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isNotificationFilled = false;

  List sliderImageList = [
    {"id": 0, "image_path": "assets/images/slider_1.jpg"},
    {"id": 1, "image_path": "assets/images/slider_2.jpg"},
    {"id": 2, "image_path": "assets/images/slider_3.jpg"},
    {"id": 3, "image_path": "assets/images/slider_4.jpg"},
    {"id": 4, "image_path": "assets/images/slider_5.jpg"},
  ];

  List drawerSections = [
    {"title": "Products", "icon": Icon(Icons.account_balance_wallet)},
    {"title": "Home", "icon": Icon(Icons.home)},
    {"title": "Quality", "icon": Icon(Icons.check)},
    {"title": "Features", "icon": Icon(Icons.list_alt)},
    {"title": "Benefits", "icon": Icon(Icons.beenhere)},
    {"title": "Feedback", "icon": Icon(Icons.feedback)},
    {"title": "Contact Us", "icon": Icon(Icons.phone_enabled)}
  ];

  final carouselController = c_slider.CarouselSliderController();
  int currentIndex = 0;
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            // Drawer Header
            DrawerHeader(
              margin: EdgeInsets.only(bottom: 0.0),
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/images/slider_5.jpg"),
                fit: BoxFit.cover,
              )),
              child: null,
            ),
            // Drawer Items
            Expanded(
              child: ListView.builder(
                  itemCount: drawerSections.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      title: Text(
                        drawerSections[index]['title'],
                        style: GoogleFonts.poppins(),
                      ),
                      leading: drawerSections[index]['icon'],
                      tileColor: selectedIndex == index
                          ? Colors.green
                          : Colors.transparent,
                      textColor:
                          selectedIndex == index ? Colors.white : Colors.black,
                      iconColor:
                          selectedIndex == index ? Colors.white : Colors.black,
                    );
                  }),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    child: Builder(
                      builder: (context) {
                        return InkWell(
                          onTap: () {
                            Scaffold.of(context).openDrawer();
                          },
                          child: Image.asset("assets/images/menu_icon.png"),
                        );
                      },
                    ),
                  ),
                  // Text("T & D",
                  //     style: GoogleFonts.poppins(
                  //         textStyle: TextStyle(
                  //       fontWeight: FontWeight.normal,
                  //       fontSize: 20,
                  //     ))),
                  Image.asset(
                    "assets/images/logo.png",
                    width: screenWidth * 0.65,
                    height: 50,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 5),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isNotificationFilled = !isNotificationFilled;
                        });
                        Fluttertoast.showToast(
                          msg: isNotificationFilled
                              ? "Notifications Enabled"
                              : "Notifications Disabled",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                        );
                      },
                      child: Image.asset(
                        isNotificationFilled
                            ? "assets/images/notifications_icon_filled.png"
                            : "assets/images/notifications_icon.png",
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              Stack(
                children: [
                  c_slider.CarouselSlider(
                      items: sliderImageList
                          .map((item) => Image.asset(
                                item["image_path"],
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ))
                          .toList(),
                      carouselController: carouselController,
                      options: c_slider.CarouselOptions(
                          scrollPhysics: const BouncingScrollPhysics(),
                          autoPlay: true,
                          aspectRatio: 1.5,
                          viewportFraction: 1,
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentIndex = index;
                            });
                          })),
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: sliderImageList.map((item) {
                        return GestureDetector(
                          onTap: () =>
                              carouselController.animateToPage(item["id"]),
                          child: Container(
                            width: 7,
                            height: 7,
                            margin: const EdgeInsets.symmetric(horizontal: 1.5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: currentIndex == item["id"]
                                    ? Colors.black
                                    : Colors.black.withAlpha(50)),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text("T & D ELECTRONIC SYSTEMS",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ))),
              SizedBox(
                height: 10,
              ),
              Container(
                width: screenWidth * 0.4,
                height: 3,
                color: Color(0xFFE1271C),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/slider_2.jpg"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: screenWidth * 0.94,
                height: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(0, 0, 0, 0.6),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text("About Us",
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.white))),
                                SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                  width: screenWidth * 0.6,
                                  child: Text(
                                    "T & D Electronic Systems is manufacturer & exporter of laser leveller for agriculture & other industries. We highly believe in not only the developing our company but also contribution .........",
                                    softWrap: true,
                                    style: GoogleFonts.poppins(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: screenWidth * 0.03,
                            ),
                            Container(
                              height: 180,
                              width: 1,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: screenWidth * 0.03,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        child: AboutUs(),
                                        type: PageTransitionType.leftToRight));
                              },
                              child: Image.asset(
                                "assets/images/next_arrow_circular.png",
                              ),
                            ),
                            SizedBox(
                              width: screenWidth * 0.03,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: screenWidth * 0.25,
                    height: 1,
                    color: Colors.grey.shade300,
                  ),
                  Text(
                    "Our Products",
                    style: GoogleFonts.poppins(
                      color: Colors.grey.shade600,
                      fontSize: 20,
                    ),
                  ),
                  Container(
                    width: screenWidth * 0.25,
                    height: 1,
                    color: Colors.grey.shade300,
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              GridView.builder(
                  itemCount: productsList.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 10.0,
                      crossAxisCount: 2),
                  itemBuilder: (context, index) => gridComponent(index))
            ],
          ),
        ),
      ),
    );
  }

  InkWell gridComponent(index) {
    return InkWell(
      borderRadius: BorderRadius.circular(15.0),
      onTap: () {
        Navigator.push(
            context,
            PageTransition(
                child: ProductPage(), type: PageTransitionType.bottomToTop));
      },
      child: Card(
        elevation: 4.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Container(
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(productsList[index]["image_path"]),
            ),
          ),
          child: Container(
            width: double.infinity,
            height: 30.0,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0)),
              color: Color.fromRGBO(0, 0, 0, 0.6),
            ),
            alignment: Alignment.center,
            child: Text(
              productsList[index]["name"],
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
