import 'package:flutter/material.dart';
import 'package:kommunicate_flutter/kommunicate_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Crisis Friend",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                const SizedBox(height: 40), // Adjust or remove this if needed
                CarouselSlider(
                  items: imgList.map((item) => Container(
                    child: Center(
                      child: Image.asset(item, fit: BoxFit.cover),
                    ),
                  )).toList(),
                  options: CarouselOptions(
                    height: 500, // Adjust height as needed
                    aspectRatio: 16/9, // Adjust aspect ratio for desired width
                    viewportFraction: 0.8, // Show 80% of each image
                    enableInfiniteScroll: true, // Loop through images
                    autoPlay: true, // Autoplay the slider
                    autoPlayInterval: const Duration(seconds: 3), // Change interval between slides
                  ),
                ),
                const SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange, // Button color
                  ),
                  child: const Text(
                    "Try the Game..!!",
                    style: TextStyle(color: Colors.white),
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
    );
  }
}