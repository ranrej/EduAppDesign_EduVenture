import 'package:flutter/material.dart';
import 'homePage.dart';
import 'theme_provider.dart';

class Escape extends StatelessWidget {
  final ThemeProvider themeProvider;
  const Escape({Key? key, required this.themeProvider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = themeProvider.isDarkMode;

    final backgroundColor = isDarkMode ? Colors.black : Color(0xFFFDF3DC);
    final appBarColor = isDarkMode ? Colors.grey[850] : Color.fromARGB(255, 203, 173, 0);
    final textColor = isDarkMode ? Colors.white : Colors.black;
    final buttonColor = Color(0xFF1E5F21);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text('Escape Room', style: TextStyle(color: textColor)),
      ),
      backgroundColor: backgroundColor,
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
                  MaterialPageRoute(builder: (context) => HomePage(themeProvider: themeProvider)),
                );
              },
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/escape.png',
                      height: 300,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Escape Room',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        'Welcome to the Escape Room!\nSolve the puzzles to unlock the levels and escape.\nTap the numbers to enter your answers.\nGood luck!',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: textColor),
                      ),
                    ),
                    SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LevelRoadmap(themeProvider: themeProvider)),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColor,
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                      ),
                      child: Text(
                        'Begin',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LevelRoadmap extends StatefulWidget {
  final ThemeProvider themeProvider;

  LevelRoadmap({required this.themeProvider});
  @override
  _LevelRoadmapState createState() => _LevelRoadmapState();
}

class _LevelRoadmapState extends State<LevelRoadmap> {
  late ThemeProvider themeProvider;

  @override
  void initState() {
    super.initState();
    themeProvider = widget.themeProvider;
    themeProvider.loadTheme();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = themeProvider.themeMode == ThemeMode.dark;

    final backgroundColor = isDarkMode ? Colors.black : Color(0xFFFDF3DC);
    final textColor = isDarkMode ? Colors.white : Colors.black;
    final buttonColor = Color(0xFF1E5F21);
    final appBarColor = isDarkMode ? Colors.grey[850] : Color.fromARGB(255, 203, 173, 0);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text('Levels', style: TextStyle(color: textColor)),
        backgroundColor: appBarColor,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Select a Level',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              SizedBox(height: 30),
              for (int i = 1; i <= 10; i++) ...[
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EscapeRoomLevel(startLevel: i, themeProvider: themeProvider)),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColor,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  ),
                  child: Text(
                    'Level $i',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class EscapeRoomLevel extends StatefulWidget {
  final int startLevel;
  final ThemeProvider themeProvider;

  EscapeRoomLevel({required this.startLevel, required this.themeProvider});

  @override
  _EscapeRoomLevelState createState() => _EscapeRoomLevelState();
}

class _EscapeRoomLevelState extends State<EscapeRoomLevel> {
  int currentLevel = 1;
  List<String> code = [];
  bool isEscaped = false;

  @override
  void initState() {
    super.initState();
    currentLevel = widget.startLevel;
  }

  void _checkCode() {
    setState(() {
      String enteredCode = code.join();
      if (currentLevel == 1 && enteredCode == '9') {
        _showLevelPassedDialog();
        _nextLevel();
      } else if (currentLevel == 2 && enteredCode == '18') {
        _showLevelPassedDialog();
        _nextLevel();
      } else if (currentLevel == 3 && enteredCode == '19') {
        _showLevelPassedDialog();
        _nextLevel();
      } else if (currentLevel == 4 && enteredCode == '25') {
        _showLevelPassedDialog();
        _nextLevel();
      } else if (currentLevel == 5 && enteredCode == '579') {
        _showLevelPassedDialog();
        _nextLevel();
      } else if (currentLevel == 6 && enteredCode == '6') {
        _showLevelPassedDialog();
        _nextLevel();
      } else if (currentLevel == 7 && enteredCode == '246') {
        _showLevelPassedDialog();
        _nextLevel();
      } else if (currentLevel == 8 && enteredCode == '2') {
        _showLevelPassedDialog();
        _nextLevel();
      } else if (currentLevel == 9 && enteredCode == '12') {
        _showLevelPassedDialog();
        _nextLevel();
      } else if (currentLevel == 10 && enteredCode == '68') {
        setState(() {
          isEscaped = true;
        });
      } else {
        _showIncorrectDialog();
        _resetLevel();
      }
    });
  }

  void _nextLevel() {
    setState(() {
      currentLevel++;
      code.clear();
    });
  }

  void _resetLevel() {
    setState(() {
      code.clear();
    });
  }

  void _backspace() {
    setState(() {
      if (code.isNotEmpty) {
        code.removeLast();
      }
    });
  }

  void _showIncorrectDialog() {
    final dialogBackgroundColor = Colors.red[300];
    final dialogTitleBackgroundColor = Colors.red[700];
    final dialogTextColor = Colors.white;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: dialogBackgroundColor,
          title: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: dialogTitleBackgroundColor, 
            ),
            child: Text(
              'Incorrect Answer',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          content: Text(
            'Try again!',
            style: TextStyle(
              color: dialogTextColor,
              fontSize: 18,
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'OK',
                style: TextStyle(
                  color: dialogTextColor,
                  fontSize: 18,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showLevelPassedDialog() {
    final dialogBackgroundColor = Colors.green[300];
    final dialogTitleBackgroundColor = Colors.green[700];
    final dialogTextColor = Colors.white;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: dialogBackgroundColor, 
          title: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: dialogTitleBackgroundColor, 
            ),
            child: Text(
              'Level Passed!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          content: Text(
            'You solved the puzzle!',
            style: TextStyle(
              color: dialogTextColor,
              fontSize: 18,
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'OK',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildLevelPage({
    required int levelNumber,
    required String title,
    required String question,
    required dynamic answer,
    required int codeLength,
  }) {
    final themeMode = widget.themeProvider.themeMode;
    final isDarkMode = themeMode == ThemeMode.dark;
    final backgroundColor = isDarkMode ? Colors.black : Color(0xFFFDF3DC);
    final textColor = isDarkMode ? Colors.white : Colors.black;
    final buttonColor = Color(0xFF1E5F21);
    final appBarColor = isDarkMode ? Colors.grey[850] : Color.fromARGB(255, 203, 173, 0);
    final textFieldBorderColor = isDarkMode ? Colors.white : Colors.black;
    final keyboardButtonColor = isDarkMode ? Colors.grey : buttonColor;

    return Scaffold(
      appBar: AppBar(
        title: Text('Level $levelNumber', style: TextStyle(color: textColor)),
        backgroundColor: appBarColor,
      ),
      backgroundColor: backgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'LEVEL $levelNumber: $title',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                question,
                style: TextStyle(
                  fontSize: 18,
                  color: isDarkMode ? Colors.white70 : Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  codeLength,
                  (index) => Container(
                    width: 40,
                    height: 40,
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      border: Border.all(color: textFieldBorderColor),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      code.length > index ? code[index] : '',
                      style: TextStyle(fontSize: 20, color: textColor),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 10,
                runSpacing: 10,
                children: List.generate(10, (index) {
                  return ElevatedButton(
                    onPressed: () => setState(() => code.add(index.toString())),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: keyboardButtonColor,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    ),
                    child: Text(
                      (index).toString(),
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _backspace,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: keyboardButtonColor,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    ),
                    child: Text(
                      'Backspace',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: _checkCode,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    ),
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEscaped() {
    final themeMode = widget.themeProvider.themeMode;
    final isDarkMode = themeMode == ThemeMode.dark;
    final backgroundColor = isDarkMode ? Colors.black : Color(0xFFFDF3DC);
    final textColor = isDarkMode ? Colors.white : Colors.black;
    final buttonColor = Color(0xFF1E5F21);
    final appBarColor = isDarkMode ? Colors.grey[850] : Color.fromARGB(255, 203, 173, 0);

    return Scaffold(
      appBar: AppBar(
        title: Text('Escape Room'),
        backgroundColor: appBarColor,
      ),
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/trophy.png',
              height: 150,
            ),
            SizedBox(height: 20),
            Text(
              'Congratulations!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'You have completed all levels!\nYou are a true escape master!',
              style: TextStyle(
                fontSize: 18,
                color: isDarkMode ? Colors.white70 : Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  currentLevel = 1;
                  code.clear();
                  isEscaped = false;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
              ),
              child: Text(
                'Play Again',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isEscaped) {
      return _buildEscaped();
    }
    switch (currentLevel) {
      case 1:
        return _buildLevelPage(levelNumber: 1, title: 'The Banana Puzzle', question: 'Monkey has 5 bananas and finds 4 more.\nHow many bananas does he have?', answer: 9, codeLength: 1);
      case 2:
        return _buildLevelPage(levelNumber: 2, title: 'The Coconut Code', question: 'Monkey found 20 coconuts but ate 2.\nHow many coconuts are left?', answer: 18, codeLength: 2);
      case 3:
        return _buildLevelPage(levelNumber: 3, title: 'The Jungle Animals', question: 'There are 8 birds and 11 lions in the jungle.\nHow many animals are there in total?', answer: 19, codeLength: 2);
      case 4:
        return _buildLevelPage(levelNumber: 4, title: 'The Apple Tree', question: 'There are 28 apples on a tree, 3 fall down.\nHow many are left on the tree?', answer: 25, codeLength: 2);
      case 5:
        return _buildLevelPage(levelNumber: 5, title: 'The Hidden Path', question: 'Follow the pattern: 0, 1, 3, __, __, __.\nEnter the missing numbers.', answer: 579, codeLength: 3);
      case 6:
        return _buildLevelPage(levelNumber: 6, title: 'The Sum Code', question: 'Find the last code digit which\nsums to 2 + 4', answer: 6, codeLength: 1);
      case 7:
        return _buildLevelPage(levelNumber: 7, title: 'The Even Numbers', question: 'Enter the first 3 even numbers', answer: 246, codeLength: 3);
      case 8:
        return _buildLevelPage(levelNumber: 8, title: 'The Jungle Maze', question: 'A monkey takes 3 steps forward, then 2 steps back. If he does this twice, how many steps forward did he move in total?', answer: 2, codeLength: 1);
      case 9:
        return _buildLevelPage(levelNumber: 9, title: 'The Parrot\'s Riddle', question: 'A parrot repeats every word 3 times. If you say "hello" 4 times, how many times will the parrot say it?', answer: 12, codeLength: 2);
      case 10:
        return _buildLevelPage(levelNumber: 10, title: 'The Final Code', question: 'Find the next two numbers: 2, 4, __, __', answer: 68, codeLength: 2);
      default:
        return _buildEscaped();
    }
  }
}