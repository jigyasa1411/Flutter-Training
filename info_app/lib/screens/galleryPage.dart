import 'package:flutter/material.dart';

class GalleryPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<GalleryPage> {
  List img = [
    "assets/GalleryImages/image1.jpg",
    "assets/GalleryImages/image2.jpg",
    "assets/GalleryImages/image3.jpg",
    "assets/GalleryImages/image4.jpg",
    "assets/GalleryImages/image5.jpg",
    "assets/GalleryImages/image6.jpg",
    "assets/GalleryImages/image7.jpg",
    "assets/GalleryImages/image8.jpg",
    "assets/GalleryImages/image9.jpg",
    "assets/GalleryImages/image10.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(color: Colors.blue),
          child: GridView.builder(
              itemCount: img.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Image.asset(img[index]));
              })),
    );
  }
}
