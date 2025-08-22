import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Laser Land Leveller"),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
                future: Future.wait([
                  precacheImage(
                      AssetImage("assets/images/laser_land_leveller_1.jpg"),
                      context),
                  precacheImage(
                      AssetImage("assets/images/laser_land_leveller_2.jpg"),
                      context),
                  precacheImage(
                      AssetImage("assets/images/laser_land_leveller_3.jpg"),
                      context),
                ]),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Column(
                      children: [
                        SizedBox(height: 160.0),
                        Image.asset("assets/images/gear_loader.gif"),
                        SizedBox(height: 160.0),
                        Image.asset("assets/images/gear_loader.gif"),
                        SizedBox(height: 160.0),
                        Image.asset("assets/images/gear_loader.gif"),
                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        Image.asset("assets/images/laser_land_leveller_1.jpg"),
                        Image.asset("assets/images/laser_land_leveller_2.jpg"),
                        Image.asset("assets/images/laser_land_leveller_3.jpg"),
                      ],
                    );
                  }
                }),
            SizedBox(
              height: 50.0,
            ),
            Container(
              margin: EdgeInsets.all(30.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset("assets/images/point_arrow_filled.png"),
                      SizedBox(width: 20.0),
                      Flexible(
                        child: Text(
                          "T & D Laser Guided Land Leveller is perfect for Land Leveling, Subsidy Approved in INDIA. T & D Laser Samtal has a Long-range laser transmitter 1500 meters (750 radius), Computerized self-calibration.",
                          style: GoogleFonts.poppins(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    children: [
                      Image.asset("assets/images/point_arrow_filled.png"),
                      SizedBox(width: 20.0),
                      Flexible(
                        child: Text(
                          "In house manufacturing, Development, and testing center for Laser Land Levelers, Rotary laser level accuracy +/- 1 mm at 30 meters, Fuel consumption 4 Liters/hr.",
                          style: GoogleFonts.poppins(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    children: [
                      Image.asset("assets/images/point_arrow_filled.png"),
                      SizedBox(width: 20.0),
                      Flexible(
                        child: Text(
                          "Wireless and touch control, Laser receiver working fully under HT lines, Accurate working of the rotary laser at high temperature. Get the maximum yield of crops using T & D Laser Land Leveler.",
                          style: GoogleFonts.poppins(),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: screenWidth * 0.20,
                  height: 1,
                  color: Colors.grey.shade300,
                ),
                Text(
                  "Specifications",
                  style: GoogleFonts.poppins(
                    color: Colors.grey.shade600,
                    fontSize: 20,
                  ),
                ),
                Container(
                  width: screenWidth * 0.20,
                  height: 1,
                  color: Colors.grey.shade300,
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Table(
                border: TableBorder.all(color: Colors.black),
                columnWidths: const {
                  0: FlexColumnWidth(1),
                  1: FlexColumnWidth(2),
                },
                children: [
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Model',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('T & D',
                          style: TextStyle(fontWeight: FontWeight.normal)),
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Working',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('7 feet (2.1 mtr)',
                          style: TextStyle(fontWeight: FontWeight.normal)),
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Suitable HP',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('40-45 HP',
                          style: TextStyle(fontWeight: FontWeight.normal)),
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Efficiency',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('4.5 ltr/hour',
                          style: TextStyle(fontWeight: FontWeight.normal)),
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Range',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('1500 meters',
                          style: TextStyle(fontWeight: FontWeight.normal)),
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Hydraulic Pressure',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('250 Bar Max',
                          style: TextStyle(fontWeight: FontWeight.normal)),
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Operating Voltage',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('12V DC',
                          style: TextStyle(fontWeight: FontWeight.normal)),
                    ),
                  ]),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: screenWidth * 0.30,
                  height: 1,
                  color: Colors.grey.shade300,
                ),
                Text(
                  "Features",
                  style: GoogleFonts.poppins(
                    color: Colors.grey.shade600,
                    fontSize: 20,
                  ),
                ),
                Container(
                  width: screenWidth * 0.30,
                  height: 1,
                  color: Colors.grey.shade300,
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              margin: EdgeInsets.all(30.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset("assets/images/point_arrow_filled.png"),
                      SizedBox(width: 20.0),
                      Flexible(
                        child: Text(
                          "Simple one button operation.",
                          style: GoogleFonts.poppins(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    children: [
                      Image.asset("assets/images/point_arrow_filled.png"),
                      SizedBox(width: 20.0),
                      Flexible(
                        child: Text(
                          "Tested by NRFMTTI for Govt subsidy in India.",
                          style: GoogleFonts.poppins(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    children: [
                      Image.asset("assets/images/point_arrow_filled.png"),
                      SizedBox(width: 20.0),
                      Flexible(
                        child: Text(
                          "Portable carrying care.",
                          style: GoogleFonts.poppins(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    children: [
                      Image.asset("assets/images/point_arrow_filled.png"),
                      SizedBox(width: 20.0),
                      Flexible(
                        child: Text(
                          "Very economical spare parts in its category.",
                          style: GoogleFonts.poppins(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    children: [
                      Image.asset("assets/images/point_arrow_filled.png"),
                      SizedBox(width: 20.0),
                      Flexible(
                        child: Text(
                          "Maintain perfomance even in duty and other harsh job and weather conditions.",
                          style: GoogleFonts.poppins(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    children: [
                      Image.asset("assets/images/point_arrow_filled.png"),
                      SizedBox(width: 20.0),
                      Flexible(
                        child: Text(
                          "Fast set up.",
                          style: GoogleFonts.poppins(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    children: [
                      Image.asset("assets/images/point_arrow_filled.png"),
                      SizedBox(width: 20.0),
                      Flexible(
                        child: Text(
                          "Designed for single person levelling systems.",
                          style: GoogleFonts.poppins(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    children: [
                      Image.asset("assets/images/point_arrow_filled.png"),
                      SizedBox(width: 20.0),
                      Flexible(
                        child: Text(
                          "Built to withstand severe drops.",
                          style: GoogleFonts.poppins(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    children: [
                      Image.asset("assets/images/point_arrow_filled.png"),
                      SizedBox(width: 20.0),
                      Flexible(
                        child: Text(
                          "Alfa numeric display for all function.",
                          style: GoogleFonts.poppins(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    children: [
                      Image.asset("assets/images/point_arrow_filled.png"),
                      SizedBox(width: 20.0),
                      Flexible(
                        child: Text(
                          "Roburt Design.",
                          style: GoogleFonts.poppins(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
