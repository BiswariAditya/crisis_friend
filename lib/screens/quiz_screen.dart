import 'dart:math';

import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final List<Map<String, dynamic>> _allQuestions = [
    {
      "question": "What should you do during an earthquake?",
      "options": [
        "Stand under a tree",
        "Take cover under a table",
        "Run outside",
        "Stand near a window"
      ],
      "answer": 1
    },
    {
      "question": "What is the primary cause of floods?",
      "options": [
        "Excessive rainfall",
        "Volcanic eruptions",
        "Earthquakes",
        "Forest fires"
      ],
      "answer": 0
    },
    {
      "question":
          "Which scale is used to measure the magnitude of earthquakes?",
      "options": [
        "Fujita Scale",
        "Richter Scale",
        "Saffir-Simpson Scale",
        "Beaufort Scale"
      ],
      "answer": 1
    },
    {
      "question":
          "Which organization is responsible for disaster management in India?",
      "options": ["NASA", "WHO", "NDMA", "IMD"],
      "answer": 2
    },
    {
      "question":
          "Which of the following is a preventive measure for cyclones?",
      "options": [
        "Seek shelter in basements",
        "Store water",
        "Evacuate low-lying areas",
        "Plant more trees"
      ],
      "answer": 2
    },
    {
      "question": "What is the first step to take in a fire emergency?",
      "options": [
        "Search for the source of fire",
        "Stay in the building",
        "Use the elevator to evacuate",
        "Exit the building immediately"
      ],
      "answer": 3
    },
    {
      "question": "What should you do if you are caught in a tornado?",
      "options": [
        "Seek shelter in a vehicle",
        "Hide in a ditch",
        "Go to the top floor of a building",
        "Stand outside to see the tornado"
      ],
      "answer": 1
    },
    {
      "question": "What is the best way to stay informed during a hurricane?",
      "options": [
        "Wait for emergency services",
        "Listen to a battery-powered radio",
        "Go outside to check the weather",
        "Follow social media updates"
      ],
      "answer": 1
    },
    {
      "question": "How should you prepare a disaster supply kit?",
      "options": [
        "Include only food items",
        "Prepare for at least 72 hours",
        "Only include medications",
        "Pack only clothes and blankets"
      ],
      "answer": 1
    },
    {
      "question": "What should you do if a tsunami warning is issued?",
      "options": [
        "Stay at the beach to watch",
        "Move to higher ground immediately",
        "Call friends to check on them",
        "Go to the nearest grocery store"
      ],
      "answer": 1
    },
    {
      "question": "What is a common sign of an impending earthquake?",
      "options": [
        "Sudden heavy rainfall",
        "Strange animal behavior",
        "Rapid wind changes",
        "Increase in temperature"
      ],
      "answer": 1
    },
    {
      "question": "Which of the following is a sign of a flash flood?",
      "options": [
        "Slow rising water levels",
        "Sudden water surge",
        "Heavy fog",
        "Strong winds"
      ],
      "answer": 1
    },
    {
      "question":
          "What should you do if you are trapped in debris after an earthquake?",
      "options": [
        "Try to move the debris yourself",
        "Remain still and shout for help",
        "Use your phone to call for help",
        "Attempt to find an exit"
      ],
      "answer": 1
    },
    {
      "question": "How often should you review your emergency plan?",
      "options": [
        "Once every year",
        "Every month",
        "Whenever there is a disaster",
        "Only when you move houses"
      ],
      "answer": 0
    },
    {
      "question": "What is the purpose of an emergency contact list?",
      "options": [
        "To share your vacation plans",
        "To keep track of your daily schedule",
        "To contact family and friends during a disaster",
        "To list your favorite restaurants"
      ],
      "answer": 2
    },
  ];

  // Store the selected options by the user
  List<Map<String, dynamic>> _questions = [];
  final List<int?> _selectedAnswers = List.filled(5, null);

  // Score
  int _score = 0;

  @override
  void initState() {
    super.initState();
    _questions = _getRandomQuestions();
  }

  List<Map<String, dynamic>> _getRandomQuestions() {
    final random = Random();
    List<Map<String, dynamic>> selectedQuestions = [];
    while (selectedQuestions.length < 5) {
      final question = _allQuestions[random.nextInt(_allQuestions.length)];
      if (!selectedQuestions.contains(question)) {
        selectedQuestions.add(question);
      }
    }
    return selectedQuestions;
  }

  void _evaluateQuiz() {
    setState(() {
      _score = 0;
      for (int i = 0; i < _questions.length; i++) {
        if (_selectedAnswers[i] == _questions[i]["answer"]) {
          _score++;
        }
      }
    });
    // Show score dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: const Text(
            "Quiz Results",
            style: TextStyle(color: Colors.white),
          ),
          content: Text(
            "You scored $_score out of ${_questions.length}",
            style: const TextStyle(color: Colors.deepOrange),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "OK",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        title: const Text(
          "Disaster Management Quiz",
          style: TextStyle(color: Colors.deepOrange),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _questions.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Q${index + 1}: ${_questions[index]["question"]}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      ...List.generate(4, (optionIndex) {
                        return ListTile(
                          title: GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedAnswers[index] = optionIndex;
                              });
                            },
                            child: Text(
                              _questions[index]["options"][optionIndex],
                              style: TextStyle(
                                color: _selectedAnswers[index] == optionIndex
                                    ? Colors.deepOrange
                                    : Colors.white,
                              ),
                            ),
                          ),
                          leading: Radio<int>(
                            value: optionIndex,
                            groupValue: _selectedAnswers[index],
                            onChanged: (value) {
                              setState(() {
                                _selectedAnswers[index] = value;
                              });
                            },
                            activeColor: Colors.deepOrange,
                          ),
                        );
                      }),
                      const SizedBox(height: 20),
                    ],
                  );
                },
              ),
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
                onPressed: _evaluateQuiz,
                child: const Text(
                  "Evaluate",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
