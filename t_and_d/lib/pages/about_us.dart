import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("About Us"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            Container(
              margin: EdgeInsets.all(16.0),
              child: Text(
                "T & D Electronic Systems is manufacturer & Exporter of Laser Leveller for Agriculture Industries & Others, We highly believe in not only the developinng of Our Company but the contribution in development of national & International participation , That why Straight forwardely We have kept a motive of Innovation and development for farmers,Land Developers,Land Promoters and other Category of people.",
                // textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 16.0,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
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
                  "Our Team",
                  style: GoogleFonts.poppins(
                    color: Colors.black,
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
              height: 10.0,
            ),
            Container(
              margin: EdgeInsets.all(16.0),
              child: Text(
                "We are able to sustain the challenges of the industry with the active support of our team of experts. They work in close tandem with each other, in order to fulfill the goals and objectives of our organization. These personnel are the main reason behind our sustained success in the industry. We also conduct regular training sessions for our team members to keep themselves abreast with industry standards. Moreover, with the support of this team, we meet the bulk demand of our clients within a given timeline.",
                // textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 16.0,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: screenWidth * 0.10,
                  height: 1,
                  color: Colors.grey.shade300,
                ),
                Text(
                  "Our Manufacturing Unit",
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                Container(
                  width: screenWidth * 0.10,
                  height: 1,
                  color: Colors.grey.shade300,
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              margin: EdgeInsets.all(16.0),
              child: Text(
                "Our Manufacturing Unit is very spaciously built. It is very well equipped with the state of the art facilities and machinery manufacturing the best Testing and Measuring Instruments. This unit is managed by a team of highly experienced professionals who are capable of handling these products. Our range is manufactured using premium quality materials that are procured from the trusted dealers in the market. We also regularly upgrade this unit to offer highly finished products.",
                // textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 16.0,
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              children: [
                SizedBox(
                  width: screenWidth * 0.05,
                ),
                Text(
                  "Address",
                  style: GoogleFonts.poppins(
                    color: Colors.black87,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              color: Colors.red.shade400,
              width: screenWidth * 0.90,
              height: 100.0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "79 - R, Industrial Area - B, Jaimal Road, Ludhiana - 141003 (Punjab) India.",
                  style:
                      GoogleFonts.poppins(color: Colors.white, fontSize: 15.0),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              color: Colors.red.shade400,
              width: screenWidth * 0.90,
              height: 55.0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Owner: Mr. Davinder Singh",
                  style:
                      GoogleFonts.poppins(color: Colors.white, fontSize: 15.0),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              color: Colors.red.shade400,
              width: screenWidth * 0.90,
              height: 55.0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Contact: +91-161 -2532209",
                  style:
                      GoogleFonts.poppins(color: Colors.white, fontSize: 15.0),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              color: Colors.red.shade400,
              width: screenWidth * 0.90,
              height: 55.0,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "Email: info@tdelectronicsystems.com",
                  style:
                      GoogleFonts.poppins(color: Colors.white, fontSize: 15.0),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              color: Colors.red.shade400,
              width: screenWidth * 0.90,
              height: 55.0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Sister Concern: www.tdindia.org",
                  style:
                      GoogleFonts.poppins(color: Colors.white, fontSize: 15.0),
                ),
              ),
            ),
            SizedBox(
              height: 40.0,
            )
          ],
        ),
      ),
    );
  }
}
