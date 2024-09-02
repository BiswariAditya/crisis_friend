import 'package:carousel_slider/carousel_slider.dart';
import 'package:crisis_friend/screens/quiz_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kommunicate_flutter/kommunicate_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

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

  final List<Map<String, String>> teamList = [
    {
      "image": "assets/parth.jpeg",
      "name": "Parth Agarwal",
      "role": "Android, AR/VR Developer"
    },
    {
      "image": "assets/vaishnavi.jpeg",
      "name": "Vaishnavi Singh",
      "role": "AR/VR Developer"
    },
    {
      "image": "assets/aditya.jpeg",
      "name": "Aditya Biswari Gupta",
      "role": "Android Developer"
    },
    {
      "image": "assets/ayushSingh.jpeg",
      "name": "Ayush Singh",
      "role": "ML Developer"
    },
    {
      "image": "assets/aishwarya.jpeg",
      "name": "Aishwarya Tewari",
      "role": "Web Developer"
    },
    {
      "image": "assets/ayushGupta.jpeg",
      "name": "Ayush Gupta",
      "role": "Web Developer"
    }
  ];

  void _launchDialer(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    try {
      await launchUrlString(launchUri.toString());
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
                  const SizedBox(height: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/EarthQUAKE.png",
                        scale: 3.2,
                      ),
                      CarouselSlider(
                        items: imgList
                            .map((item) => Center(
                                  child: Image.asset(item, fit: BoxFit.cover),
                                ))
                            .toList(),
                        options: CarouselOptions(
                          height: 500,
                          aspectRatio: 16 / 9,
                          viewportFraction: 0.75,
                          enableInfiniteScroll: true,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 2),
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
                      const SizedBox(height: 10),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, bottom: 4),
                    child: Center(
                      child: Image.asset(
                        "assets/about.png",
                        scale: 9,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Stay safe with our immersive game designed to teach essential safety drills through virtual reality. Navigate disaster scenarios—like earthquakes, floods, and fires—where your goal is to escape to safety by making quick decisions. This app isn't just a game—it's a proactive tool to prepare you for real-life emergencies. Start training today and be ready when it matters most!",
                      style: GoogleFonts.alike(
                        textStyle:
                            const TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const QuizScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                      ),
                      child: const Text(
                        "Take a quiz",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                    ),
                    child: Center(
                      child: Image.asset(
                        "assets/helpline.png",
                        scale: 4,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: GoogleFonts.alike(
                          textStyle: const TextStyle(
                              fontSize: 16, color: Colors.white, height: 1.5),
                        ),
                        children: [
                          const TextSpan(
                            text:
                                "\n National Disaster Management Authority (NDMA):  ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: "1800 11 9999",
                            style: const TextStyle(
                                color: Colors.deepOrange, fontSize: 20),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => _launchDialer('1800119999'),
                          ),
                          const TextSpan(
                            text:
                                "\n National Disaster Response Force (NDRF):  ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: "011-24363260",
                            style: const TextStyle(
                                color: Colors.deepOrange, fontSize: 20),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => _launchDialer('01124363260'),
                          ),
                          const TextSpan(
                            text: "\n India Meteorological Department(IMD):  ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: "	011-24611792",
                            style: const TextStyle(
                                color: Colors.deepOrange, fontSize: 20),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => _launchDialer('01124611792'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, bottom: 4),
                    child: Center(
                      child: Image.asset(
                        "assets/MeetTeam.png",
                        scale: 5,
                      ),
                    ),
                  ),
                  CarouselSlider(
                    items: teamList.map((teamMember) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipOval(
                            child: Image.asset(
                              teamMember["image"]!,
                              fit: BoxFit.cover,
                              height: 120, // Adjust size for the circle
                              width: 120, // Adjust size for the circle
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            teamMember["name"]!,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors
                                  .white, // Adjust color to match your theme
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            teamMember["role"]!,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors
                                  .grey, // Adjust color to match your theme
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                    options: CarouselOptions(
                      height: 240,
                      // Adjust height for the image, text, and role combined
                      aspectRatio: 1.0,
                      // Square aspect ratio since we are using circles
                      viewportFraction: 0.6,
                      // Adjust to show part of next/previous circle
                      enableInfiniteScroll: true,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 2),
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

              var clientConversationId =
                  await KommunicateFlutterPlugin.buildConversation(
                      conversationObject);
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
