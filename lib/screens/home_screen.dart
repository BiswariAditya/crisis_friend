import 'package:flutter/material.dart';
import 'package:kommunicate_flutter/kommunicate_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> imgList = [
    "assets/1.png",
    "assets/2.png",
    "assets/3.png",
    "assets/4.png",
    "assets/5.png"
  ];

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      try {
        await launch(url);
      } catch (e) {
        print('Error launching URL: $e');
      }
    } else {
      print('Could not launch URL: $url');
    }
  }


  void _launchDialer(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );

    print('Launching dialer with URI: $launchUri');

    try {
      await launch(launchUri.toString());
    } catch (e) {
      print('Error launching dialer: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.black,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/EarthQUAKE.png",
                        scale: 3.2,
                      ),
                      CarouselSlider(
                        items: imgList
                            .map((item) => Container(
                          child: Center(
                            child: Image.asset(item, fit: BoxFit.cover),
                          ),
                        ))
                            .toList(),
                        options: CarouselOptions(
                          height: 500, // Adjust height as needed
                          aspectRatio: 16 / 9, // Adjust aspect ratio for desired width
                          viewportFraction: 0.75, // Show 80% of each image
                          enableInfiniteScroll: true, // Loop through images
                          autoPlay: true, // Autoplay the slider
                          autoPlayInterval: const Duration(seconds: 2), // Change interval between slides
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrange,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                        ),
                        child: const Text(
                          "Try the Game..!!",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, bottom: 4),
                    child: Image.asset(
                      "assets/about.png",
                      scale: 9,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Stay safe with our immersive game designed to teach essential safety drills through virtual reality. Navigate disaster scenarios—like earthquakes, floods, and fires—where your goal is to escape to safety by making quick decisions. This app isn't just a game—it's a proactive tool to prepare you for real-life emergencies. Start training today and be ready when it matters most!",
                      style: GoogleFonts.alike(
                        textStyle: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, bottom: 4),
                    child: Image.asset(
                      "assets/helpline.png",
                      scale: 4,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: RichText(
                      text: TextSpan(
                        style: GoogleFonts.alike(
                          textStyle: TextStyle(fontSize: 16, color: Colors.white, height: 1.5), // Set line height here
                        ),
                        children: [
                          TextSpan(
                            text: "National Disaster Management Authority (NDMA): ",
                            style: TextStyle(fontWeight: FontWeight.bold), // Set color to orange
                          ),
                          TextSpan(
                            text: "1800 11 9999",
                            style: TextStyle(color: Colors.deepOrange, fontSize: 20), // Set color to orange
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => _launchDialer('1800119999'), // Dialer functionality
                          ),
                          TextSpan(
                            text: "\nNational Disaster Management Authority (NDMA): ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: "ndma.gov.in",
                            style: TextStyle(color: Colors.deepOrange, fontSize: 20), // Set color to orange
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => _launchURL('https://ndma.gov.in'), // URL launch functionality
                          ),
                          TextSpan(
                            text: "\nIndian Meteorological Department (IMD): ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: "mausam.imd.gov.in",
                            style: TextStyle(color: Colors.deepOrange, fontSize: 20), // Set color to orange
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => _launchURL('https://mausam.imd.gov.in'), // URL launch functionality
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: GestureDetector(
          onTap: () async {
            try {
              dynamic conversationObject = {
                'appId': '249a3fb4e893b0673a3ace92cab3d0fcd',
              };

              var clientConversationId = await KommunicateFlutterPlugin.buildConversation(conversationObject);
              print("Conversation builder success: $clientConversationId");
            } catch (error) {
              print("Conversation builder error: $error");
            }
          },
          child: Image.asset("assets/cato.png", scale: 11),
        ),
      ),
    );
  }
}
