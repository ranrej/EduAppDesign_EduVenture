import 'package:flutter/material.dart';
import 'theme_provider.dart';

class HomePage extends StatelessWidget {
  final ThemeProvider themeProvider;

  const HomePage({Key? key, required this.themeProvider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = themeProvider.themeMode == ThemeMode.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : const Color(0xFFF7E5C6),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Switch(
                      value: isDarkMode,
                      onChanged: (value) {
                        themeProvider.toggleTheme();
                      },
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/about');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1E5F21),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        "ABOUT",
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Image.asset(
              'assets/images/logo.png',
              width: 300,
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Column(
                children: [
                  _buildButton(context, "Learn Content", "assets/images/learn.png", '/learn', isDarkMode),
                  _buildButton(context, "Math Games", "assets/images/games.png", '/games', isDarkMode),
                  _buildButton(context, "Escape Room", "assets/images/escape.png", '/escape', isDarkMode),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: isDarkMode ? Colors.grey[900] : const Color.fromARGB(255, 203, 173, 0),
        child: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            'EduVenture',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text, String imagePath, String route, bool isDarkMode) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: isDarkMode ? Colors.grey[800] : const Color(0xFF1E5F21),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        ),
        child: Row(
          children: [
            Image.asset(imagePath, width: 50, height: 50),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                text.toUpperCase(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
