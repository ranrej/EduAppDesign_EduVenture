import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'HomePage.dart';
import 'ContentLearnAddition.dart';
import 'ContentLearnSubstraction.dart';
import 'ContentLearnMultiplication.dart';
import 'ContentLearnDivision.dart';
import 'theme_provider.dart';
import 'VideoListScreen.dart'; 

class LearnContentScreen extends StatelessWidget {
  final ThemeProvider themeProvider;

  const LearnContentScreen({Key? key, required this.themeProvider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeProvider.themeMode == ThemeMode.dark
            ? Colors.grey[850]
            : Color.fromARGB(255, 203, 173, 0),
        title: Text('Learn Content'),
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
                    builder: (context) => HomePage(themeProvider: themeProvider),
                  ),
                );
              },
            ),
          ),
          Text(
            'LEARN CONTENT',
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
                _buildCard(
                  context,
                  'assets/images/operations/add_yellow.png',
                  'ADDITION',
                  () => ContentLearnAddition(themeProvider: themeProvider),
                ),
                _buildCard(
                  context,
                  'assets/images/operations/sub_yellow.png',
                  'SUBTRACTION',
                  () => ContentLearnSubstraction(themeProvider: themeProvider),
                ),
                _buildCard(
                  context,
                  'assets/images/operations/multi_yellow.png',
                  'MULTIPLICATION',
                  () => ContentLearnMultiplication(themeProvider: themeProvider),
                ),
                _buildCard(
                  context,
                  'assets/images/operations/div_yellow.png',
                  'DIVISION',
                  () => ContentLearnDivision(themeProvider: themeProvider),
                ),
              ],
            ),
          ),
          SizedBox(height: 40),
          // Button at the bottom to navigate to Video List Screen
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VideoListScreen(themeProvider: themeProvider),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: themeProvider.themeMode == ThemeMode.dark
                    ? Colors.grey[800]
                    : Color(0xFF1E5F21),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                'Watch Videos!',
                style: TextStyle(
                  fontSize: 24,
                  color: themeProvider.themeMode == ThemeMode.dark
                      ? Colors.white
                      : Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context, String iconPath, String title, Widget Function() nextPage) {
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
