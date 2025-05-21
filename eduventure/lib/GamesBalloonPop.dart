import 'dart:async';
import 'package:flutter/material.dart';
import 'GamesHome.dart';
import 'theme_provider.dart';
import 'dart:math';

class GamesBalloonPop extends StatefulWidget {
  final ThemeProvider themeProvider;
  const GamesBalloonPop({Key? key, required this.themeProvider})
      : super(key: key);

  @override
  _GamesBalloonPopState createState() => _GamesBalloonPopState();
}

class _GamesBalloonPopState extends State<GamesBalloonPop> {
  late final ThemeProvider themeProvider;
  String? _resultImage;
  int _targetNumber = 0;
  List<String> _solutions = [];

  @override
  void initState() {
    super.initState();
    themeProvider = widget.themeProvider;
    _generateTargetNumberAndSolutions();
  }

  void _generateTargetNumberAndSolutions() {
    final random = Random();
    _targetNumber = random.nextInt(20) + 1; // Random number between 1 and 20

    // Generate two correct solutions
    _solutions = [
      '${_targetNumber} - 0', // Always correct
      '${_targetNumber ~/ 2} x 2', // Correct only if _targetNumber is even
    ];

    // Adjust for odd numbers to ensure correctness
    if (_targetNumber % 2 != 0) {
      _solutions[1] =
          '${_targetNumber - 1} + 1'; // Correct alternative for odd numbers
    }

    // Generate two incorrect solutions
    _solutions.add('${_targetNumber + 2} - 1'); // Always incorrect
    _solutions.add('${_targetNumber - 3} + 1'); // Always incorrect
  }

  void _handleBalloonTap(String text) {
    setState(() {
      if (text == _solutions[0] || text == _solutions[1]) {
        _resultImage = 'assets/images/pass.png';
        Timer(Duration(seconds: 1), () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    GamesBalloonPop(themeProvider: themeProvider)),
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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeProvider.themeMode == ThemeMode.dark
            ? Colors.grey[850]
            : Color.fromARGB(255, 203, 173, 0),
        title: Text('Balloon Pop'),
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
                    'BALLOON POP',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E5F21),
                    ),
                  ),
                  SizedBox(width: 10),
                  Image.asset(
                    'assets/images/games/balloon.png',
                    width: 80,
                    height: 80,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'POP $_targetNumber',
                style: TextStyle(
                  fontSize: 64,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E5F21),
                ),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildBalloon('assets/images/games/balloon.png', 200, 200,
                      text: _solutions[0]),
                  _buildBalloon('assets/images/games/balloon.png', 200, 200,
                      text: _solutions[1]),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildBalloon('assets/images/games/balloon.png', 200, 200,
                      text: _solutions[2]),
                  _buildBalloon('assets/images/games/balloon.png', 200, 200,
                      text: '1 x 1'),
                ],
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

  Widget _buildBalloon(String imagePath, double width, double height,
      {required String text}) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        _handleBalloonTap(text);
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
            Padding(
              padding: const EdgeInsets.only(bottom: 90),
              child: Text(
                text,
                style: TextStyle(
                  color: theme.textTheme.bodyLarge
                      ?.color, // Theme-based text color for the balloon text
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
