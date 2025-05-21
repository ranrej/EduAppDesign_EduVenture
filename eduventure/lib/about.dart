import 'package:flutter/material.dart';
import 'theme_provider.dart';

class AboutPage extends StatefulWidget {
  final ThemeProvider themeProvider;

  AboutPage({required this.themeProvider});

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  void initState() {
    super.initState();
    widget.themeProvider.loadTheme();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = widget.themeProvider.themeMode == ThemeMode.dark;

    final backgroundColor = isDarkMode ? Colors.black : Color(0xFFFDF3DC);
    final textColor = isDarkMode ? Colors.white : Colors.black;
    final appBarColor = isDarkMode ? Colors.grey[850] : Color.fromARGB(255, 203, 173, 0);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text('About', style: TextStyle(color: textColor)),
      ),
      body: Container(
        color: backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Image.asset('assets/images/logo.png', height: 250),
              SizedBox(height: 20),
              Text(
                'ABOUT',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                  fontFamily: 'Cursive',
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "EduVenture's primary purpose is to make arithmetic learning entertaining and engaging for children aged 6 to 9, by integrating instructional content with interactive forest-themed games. The software attempts to instill a love of arithmetic in children through games, quizzes, and an escape room that requires them to apply their skills in novel ways.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: isDarkMode ? Colors.white : Colors.black87,
                    fontFamily: 'Handwritten',
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text(
                'DEVELOPED BY',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Eisha Rizvi',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),
              Text(
                'Rania Rejdal',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
