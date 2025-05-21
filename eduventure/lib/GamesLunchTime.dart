import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'GamesHome.dart';
import 'theme_provider.dart';

class GamesLunchTime extends StatefulWidget {
  final ThemeProvider themeProvider;
  const GamesLunchTime({Key? key, required this.themeProvider})
      : super(key: key);

  @override
  _GamesLunchTimeState createState() => _GamesLunchTimeState();
}

class _GamesLunchTimeState extends State<GamesLunchTime> {
  late final ThemeProvider themeProvider; // Declare the themeProvider here
  String? _resultImage;
  late int answer;
  late int number1;
  late int number2;

  @override
  void initState() {
    super.initState();
    themeProvider =
        widget.themeProvider; // Initialize themeProvider in initState
    _generateRandomNumbers();
  }

  void _generateRandomNumbers() {
    final random = Random();
    number1 = random.nextInt(2) + 1;
    number2 = random.nextInt(3) + 1;
    answer = number1 + number2;
  }

  void _handleBananaChoice(List<String> bananaImages) {
    setState(() {
      if (bananaImages.length == answer) {
        _resultImage = 'assets/images/pass.png';
        Timer(Duration(seconds: 1), () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    GamesLunchTime(themeProvider: themeProvider)),
            (Route<dynamic> route) => false,
          );
        });
      } else {
        _resultImage = 'assets/images/fail.png';
        Timer(Duration(seconds: 3), () {
          setState(() {
            _resultImage = null;
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Fetching the current theme data
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeProvider.themeMode == ThemeMode.dark
            ? Colors.grey[850]
            : Color.fromARGB(255, 203, 173, 0),
        title: Text('Lunch Time'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    GameHomeScreen(themeProvider: themeProvider),
              ),
            );
          },
        ),
      ),
      backgroundColor: themeProvider.themeMode == ThemeMode.dark
          ? Colors.black
          : Color(0xFFF7E5C6),
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 20),
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Image.asset(
                    'assets/images/logo.png',
                    width: 90,
                  ),
                  iconSize: 40,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            GameHomeScreen(themeProvider: themeProvider),
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'LUNCH TIME',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E5F21), // Theme-based text color
                    ),
                  ),
                  SizedBox(
                      width:
                          10), // Add some space between the text and the image
                  Image.asset(
                    'assets/images/games/food_plate.png',
                    width: 80,
                    height: 80,
                  ),
                ],
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildAnswerBox(
                      'assets/images/games/puzzle_green.png', 130, 180,
                      bananaImages: List.generate(
                          answer - 1, (index) => 'assets/images/banana.png')),
                  _buildAnswerBox(
                      'assets/images/games/puzzle_green.png', 130, 180,
                      bananaImages: List.generate(
                          answer, (index) => 'assets/images/banana.png')),
                  _buildAnswerBox(
                      'assets/images/games/puzzle_green.png', 130, 180,
                      bananaImages: List.generate(
                          answer + 1, (index) => 'assets/images/banana.png')),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Feed me $number1 + $number2 bananas',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E5F21), // Theme-based text color
                ),
              ),
              SizedBox(height: 20),
              Image.asset(
                'assets/images/monkey.png',
                width: 300,
                height: 295,
              ),
            ],
          ),
          if (_resultImage != null)
            Center(
              child: Image.asset(
                _resultImage!,
                width: 400,
                height: 400,
                fit: BoxFit.cover,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildAnswerBox(String imagePath, double width, double height,
      {String? text, List<String>? bananaImages}) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        if (bananaImages != null) {
          _handleBananaChoice(bananaImages);
        }
      },
      child: Container(
        width: width,
        height: height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              imagePath,
              width: width,
              height: height,
            ),
            if (text != null)
              Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 64,
                  fontWeight: FontWeight.bold,
                ),
              ),
            if (bananaImages != null)
              Column(
                mainAxisSize: MainAxisSize.min,
                children: bananaImages
                    .map((bananaImage) =>
                        Image.asset(bananaImage, width: 50, height: 30))
                    .toList(),
              ),
          ],
        ),
      ),
    );
  }
}
