import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'GamesHome.dart';
import 'theme_provider.dart';

class GamesMatching extends StatefulWidget {
  final ThemeProvider themeProvider;
  const GamesMatching({Key? key, required this.themeProvider})
      : super(key: key);

  @override
  _GamesMatchingState createState() => _GamesMatchingState();
}

class _GamesMatchingState extends State<GamesMatching> {
  late final ThemeProvider themeProvider; // Declare themeProvider as late
  String? _resultImage;

  @override
  void initState() {
    super.initState();
    themeProvider = widget.themeProvider; // Initialize themeProvider here
  }

  void _handlePuzzlePieceTap(List<String> bananaImages, int randomNumber) {
    setState(() {
      if (bananaImages.length == randomNumber) {
        _resultImage = 'assets/images/pass.png';
        Timer(Duration(seconds: 1), () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    GamesMatching(themeProvider: themeProvider)),
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
    final theme = Theme.of(context);
    final random = Random();
    final randomNumber = random.nextInt(4) + 2; // Define randomNumber here

    List<Widget> puzzlePieces = List.generate(3, (index) {
      int adjustedBananaCount;
      if (index == 0) {
        adjustedBananaCount = randomNumber + 1;
      } else if (index == 1) {
        //always the correct answer
        adjustedBananaCount = randomNumber;
      } else {
        adjustedBananaCount = randomNumber - 1;
      }
      return _buildPuzzlePiece(
        'assets/images/games/puzzle_green.png',
        130,
        180,
        bananaImages: List.generate(
            adjustedBananaCount, (index) => 'assets/images/banana.png'),
        randomNumber: randomNumber, // Pass randomNumber here
      );
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeProvider.themeMode == ThemeMode.dark
            ? Colors.grey[850]
            : Color.fromARGB(255, 203, 173, 0),
        title: Text('Matching'),
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
                    'MATCHING',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E5F21),
                    ),
                  ),
                  SizedBox(width: 10),
                  Image.asset(
                    'assets/images/games/two_puzzles.png',
                    width: 80,
                    height: 80,
                  ),
                ],
              ),
              SizedBox(height: 20),
              _buildPuzzlePiece('assets/images/games/puzzle_red.png', 200, 200,
                  text: '$randomNumber'), // Use randomNumber here
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: puzzlePieces,
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

  Widget _buildPuzzlePiece(String imagePath, double width, double height,
      {String? text, List<String>? bananaImages, int? randomNumber}) {
    final theme = Theme.of(context); // Fetching the current theme data

    return GestureDetector(
      onTap: () {
        if (bananaImages != null && randomNumber != null) {
          _handlePuzzlePieceTap(bananaImages, randomNumber);
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
