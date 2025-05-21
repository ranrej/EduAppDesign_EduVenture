import 'package:flutter/material.dart';
import 'homePage.dart';
import 'GamesMatching.dart';
import 'GamesBalloonPop.dart';
import 'GamesLunchTime.dart';
import 'GamesMinuteMath.dart';
import 'theme_provider.dart';

class MathGameApp extends StatelessWidget {
  final ThemeProvider themeProvider;

  const MathGameApp({Key? key, required this.themeProvider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode:
          themeProvider.themeMode,
      darkTheme: ThemeData.dark(),
      theme: ThemeData.light(),
      home: GameHomeScreen(themeProvider: themeProvider),
      debugShowCheckedModeBanner: false,
    );
  }
}

class GameHomeScreen extends StatelessWidget {
  final ThemeProvider themeProvider;

  const GameHomeScreen({Key? key, required this.themeProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeProvider.themeMode == ThemeMode.dark
            ? Colors.grey[850]
            : Color.fromARGB(255, 203, 173, 0),
        title: Text('Games'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(themeProvider: themeProvider),
              ),
            );
          },
        ),
      ),
      backgroundColor: themeProvider.themeMode == ThemeMode.dark
          ? Colors.black
          : Color(0xFFF7E5C6),
      body: Column(
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
                        HomePage(themeProvider: themeProvider),
                  ),
                );
              },
            ),
          ),
          Text(
            'MATH GAME',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: themeProvider.themeMode == ThemeMode.dark
                  ? Colors.white
                  : Color(0xFF1E5F21),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              padding: EdgeInsets.all(20),
              children: [
                _buildGameCard(
                  context,
                  'assets/images/games/hourglass.png',
                  'MINUTE MATH',
                  () => GamesMinuteMath(themeProvider: themeProvider),
                ),
                _buildGameCard(
                  context,
                  'assets/images/games/balloon.png',
                  'BALLOON POP',
                  () => GamesBalloonPop(themeProvider: themeProvider),
                ),
                _buildGameCard(
                  context,
                  'assets/images/games/food_plate.png',
                  'LUNCH TIME',
                  () => GamesLunchTime(themeProvider: themeProvider),
                ),
                _buildGameCard(
                  context,
                  'assets/images/games/two_puzzles.png',
                  'MATCHING',
                  () => GamesMatching(themeProvider: themeProvider),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGameCard(BuildContext context, String iconPath, String title,
      Widget Function() nextPage) {
    return Card(
      color: themeProvider.themeMode == ThemeMode.dark
          ? Colors.grey[800]
          : Color(0xFF1E5F21),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => nextPage()),
          );
        },
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                iconPath,
                width: 64,
                height: 64,
              ),
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  color: themeProvider.themeMode == ThemeMode.dark
                      ? Colors.white
                      : Colors.white, 
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
