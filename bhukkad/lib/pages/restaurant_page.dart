import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RestaurantPage extends StatefulWidget {
  final String name;
  final String id;
  final int index;
  const RestaurantPage(this.name, this.id, this.index, {super.key});

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  int currentIndex = 0;
  List<dynamic> imagesList = [];
  List<dynamic> imagesIndexes = [];
  late PageController _controller;

  @override
  void initState() {
    fetchImagesList();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Colors.white,
        title: Text(
          widget.name,
          style: GoogleFonts.poppins(
            fontSize: 18,
          ),
        ),
      ),
      body: imagesList.isEmpty
          ? const Center(
              child: CircularProgressIndicator(), // Show loader while fetching
            )
          : Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: double.infinity,
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
                          loadingBuilder: (context, child, loadingProgress) {
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
                  bottom: 60,
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
    );
  }
}
