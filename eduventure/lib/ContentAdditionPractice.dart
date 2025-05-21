import 'dart:async';
import 'package:flutter/material.dart';
import 'ContentHome.dart';
import 'theme_provider.dart';

class ContentAdditionPractice extends StatefulWidget {
  final ThemeProvider themeProvider;
  final int lessonNumber;

  ContentAdditionPractice({Key? key, required this.themeProvider, required this.lessonNumber}) : super(key: key);

  @override
  _ContentAdditionPracticeState createState() => _ContentAdditionPracticeState();
}

class _ContentAdditionPracticeState extends State<ContentAdditionPractice> {
  bool _isOptionsVisible = false;
  int? _selectedAnswer;
  bool _showResultImage = false;
  String? _resultImage;
  int _firstNumber = 1;
  int _secondNumber = 3;
  int _correctAnswer = 4;
  List<int> _answerOptions = [1, 3, 4];

  @override
  void initState() {
    super.initState();
    _generateQuestion(widget.lessonNumber);
  }

  void _generateQuestion(int lesson) {
    setState(() {
      _showResultImage = false;
      _selectedAnswer = null;
      switch (lesson) {
        case 1:
          // Basic Addition
          _firstNumber = 3;
          _secondNumber = 6;
          _correctAnswer = 9;
          _answerOptions = [9, 10, 7];
          break;
        case 2:
          // Adding with Pictures
          _firstNumber = 2;
          _secondNumber = 3;
          _correctAnswer = 5;
          _answerOptions = [4, 5, 6];
          break;
        case 3:
          // Adding Doubles
          _firstNumber = 4;
          _secondNumber = 4;
          _correctAnswer = 8;
          _answerOptions = [9, 8, 6];
          break;
        case 4:
          // Word Problemss
          _firstNumber = 5;
          _secondNumber = 3;
          _correctAnswer = 8;
          _answerOptions = [5, 8, 7];
          break;
        case 5:
          // Addition with Large Numbers
          _firstNumber = 12;
          _secondNumber = 25;
          _correctAnswer = 37;
          _answerOptions = [35, 37, 39];
          break;
        default:
          _firstNumber = 1;
          _secondNumber = 3;
          _correctAnswer = 4;
          _answerOptions = [1, 3, 4];
          break;
      }
      _answerOptions.shuffle();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.themeProvider.themeMode == ThemeMode.dark
            ? Colors.grey[850]
            : Color.fromARGB(255, 203, 173, 0),
        title: Text('Addition Practice - Lesson ${widget.lessonNumber}'),
      ),
      backgroundColor: widget.themeProvider.themeMode == ThemeMode.dark
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
                    Navigator.pop(context);
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ADDITION',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: widget.themeProvider.themeMode == ThemeMode.dark
                          ? Colors.white
                          : Color(0xFF1E5F21),
                    ),
                  ),
                  SizedBox(width: 10),
                  Image.asset(
                    'assets/images/operations/add_green.png',
                    width: 80,
                    height: 80,
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Question Display
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (widget.lessonNumber == 2 || widget.lessonNumber == 4)
                    _buildImageCard(List.generate(_firstNumber, (index) => 'assets/images/banana.png')),
                  if (widget.lessonNumber != 2 && widget.lessonNumber != 4)
                    Text('$_firstNumber', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                  SizedBox(width: 10),
                  Image.asset(
                    'assets/images/operations/add_green.png',
                    width: 40,
                    height: 40,
                  ),
                  SizedBox(width: 10),
                  if (widget.lessonNumber == 2 || widget.lessonNumber == 4)
                    _buildImageCard(List.generate(_secondNumber, (index) => 'assets/images/banana.png')),
                  if (widget.lessonNumber != 2 && widget.lessonNumber != 4)
                    Text('$_secondNumber', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                  SizedBox(width: 10),
                  Image.asset(
                    'assets/images/operations/equal_green.png',
                    width: 40,
                    height: 40,
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isOptionsVisible = !_isOptionsVisible;
                      });
                    },
                    child: _selectedAnswer == null
                        ? Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Color(0xFF979F01),
                              border: Border.all(color: Color(0xFF1E5F21), width: 3),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          )
                        : Text('$_selectedAnswer', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              SizedBox(height: 20),
              if (_isOptionsVisible)
                Wrap(
                  spacing: 20,
                  runSpacing: 10,
                  children: _answerOptions.map((option) => GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedAnswer = option;
                        _isOptionsVisible = false;
                      });
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color(0xFF979F01),
                        border: Border.all(color: Color(0xFF1E5F21), width: 3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text('$option', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                    ),
                  )).toList(),
                ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1E5F21),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                onPressed: () {
                  setState(() {
                    if (_selectedAnswer == _correctAnswer) {
                      _resultImage = 'assets/images/pass.png';
                      _showResultImage = true;
                      Timer(Duration(seconds: 2), () {
                        Navigator.pop(context);
                      });
                    } else {
                      _resultImage = 'assets/images/fail.png';
                      _showResultImage = true;
                      Timer(Duration(seconds: 2), () {
                        setState(() {
                          _showResultImage = false;
                        });
                      });
                    }
                  });
                },
                child: Text(
                  'SUBMIT',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
          if (_showResultImage)
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

  Widget _buildImageCard(List<String> imagePaths) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF1E5F21), width: 3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: imagePaths
            .map((path) => Image.asset(
                  path,
                  width: 40,
                  height: 40,
                ))
            .toList(),
      ),
    );
  }
}

// --- Lesson 1 ---
class ContentLesson1 extends StatelessWidget {
  final ThemeProvider themeProvider;

  const ContentLesson1({Key? key, required this.themeProvider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeProvider.themeMode == ThemeMode.dark
            ? Colors.grey[850]
            : Color.fromARGB(255, 203, 173, 0),
        title: Text('Lesson 1: Basic Addition'),
      ),
      backgroundColor: themeProvider.themeMode == ThemeMode.dark
          ? Colors.grey[900]
          : Color(0xFFF7E5C6),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "In this lesson, we will learn how to add basic numbers. Start with simple numbers like 1 + 2, 2 + 3.\n"
              "You can also use your fingers to count! For example, show 2 fingers, then add 3 more to see the total.",
              style: TextStyle(
                color: Color(0xFF056203),
                fontSize: 19,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildImageCard(['assets/images/banana.png']),
              Image.asset(
                'assets/images/operations/add_green.png',
                width: 40,
                height: 40,
              ),
              _buildImageCard(['assets/images/banana.png', 'assets/images/banana.png']),
              Image.asset(
                'assets/images/operations/equal_green.png',
                width: 40,
                height: 40,
              ),
              Text('3', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF1E5F21),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContentAdditionPractice(themeProvider: themeProvider, lessonNumber: 1)),
              );
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Let\'s Practice!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                SizedBox(width: 10),
                Image.asset(
                  'assets/images/next.png',
                  width: 30,
                  height: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageCard(List<String> imagePaths) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF1E5F21), width: 3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: imagePaths
            .map((path) => Image.asset(
                  path,
                  width: 40,
                  height: 40,
                ))
            .toList(),
      ),
    );
  }
}

// --- Lesson 2 ---
class ContentLesson2 extends StatelessWidget {
  final ThemeProvider themeProvider;

  const ContentLesson2({Key? key, required this.themeProvider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeProvider.themeMode == ThemeMode.dark
            ? Colors.grey[850]
            : Color.fromARGB(255, 203, 173, 0),
        title: Text('Lesson 2: Adding with Pictures'),
      ),
      backgroundColor: themeProvider.themeMode == ThemeMode.dark
          ? Colors.grey[900]
          : Color(0xFFF7E5C6),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "In this lesson, you will learn how to add by using pictures of objects.\n"
              "For example, if you have 2 bananas and then add 3 bananas, you can see how many bananas there are in total.",
              style: TextStyle(
                color: Color(0xFF056203),
                fontSize: 19,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildImageCard(['assets/images/banana.png', 'assets/images/banana.png']),
              Image.asset(
                'assets/images/operations/add_green.png',
                width: 40,
                height: 40,
              ),
              _buildImageCard(['assets/images/banana.png', 'assets/images/banana.png', 'assets/images/banana.png']),
              Image.asset(
                'assets/images/operations/equal_green.png',
                width: 40,
                height: 40,
              ),
              _buildImageCard(['assets/images/banana.png', 'assets/images/banana.png', 'assets/images/banana.png', 'assets/images/banana.png', 'assets/images/banana.png']),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF1E5F21),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContentAdditionPractice(themeProvider: themeProvider, lessonNumber: 2)),
              );
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Let\'s Practice!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                SizedBox(width: 10),
                Image.asset(
                  'assets/images/next.png',
                  width: 30,
                  height: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageCard(List<String> imagePaths) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF1E5F21), width: 3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: imagePaths
            .map((path) => Image.asset(
                  path,
                  width: 40,
                  height: 40,
                ))
            .toList(),
      ),
    );
  }
}


// --- Lesson 3 ---
class ContentLesson3 extends StatelessWidget {
  final ThemeProvider themeProvider;

  const ContentLesson3({Key? key, required this.themeProvider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeProvider.themeMode == ThemeMode.dark
            ? Colors.grey[850]
            : Color.fromARGB(255, 203, 173, 0),
        title: Text('Lesson 3: Adding Doubles'),
      ),
      backgroundColor: themeProvider.themeMode == ThemeMode.dark
          ? Colors.grey[900]
          : Color(0xFFF7E5C6),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "In this lesson, we will learn about adding doubles! Doubles are when you add the same number twice, like 2 + 2 or 5 + 5.\n"
              "This is a great way to practice addition quickly!",
              style: TextStyle(
                color: Color(0xFF056203),
                fontSize: 19,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildImageCard(['assets/images/banana.png', 'assets/images/banana.png']),
              Image.asset(
                'assets/images/operations/add_green.png',
                width: 40,
                height: 40,
              ),
              _buildImageCard(['assets/images/banana.png', 'assets/images/banana.png']),
              Image.asset(
                'assets/images/operations/equal_green.png',
                width: 40,
                height: 40,
              ),
              Text('4', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF1E5F21),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContentAdditionPractice(themeProvider: themeProvider, lessonNumber: 3)),
              );
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Let\'s Practice!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                SizedBox(width: 10),
                Image.asset(
                  'assets/images/next.png',
                  width: 30,
                  height: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageCard(List<String> imagePaths) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF1E5F21), width: 3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: imagePaths
            .map((path) => Image.asset(
                  path,
                  width: 40,
                  height: 40,
                ))
            .toList(),
      ),
    );
  }
}

// --- Lesson 4 ---
class ContentLesson4 extends StatelessWidget {
  final ThemeProvider themeProvider;

  const ContentLesson4({Key? key, required this.themeProvider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeProvider.themeMode == ThemeMode.dark
            ? Colors.grey[850]
            : Color.fromARGB(255, 203, 173, 0),
        title: Text('Lesson 4: Word Problems'),
      ),
      backgroundColor: themeProvider.themeMode == ThemeMode.dark
          ? Colors.grey[900]
          : Color(0xFFF7E5C6),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "In this lesson, we will solve word problems about addition!\n"
              "For example: If you have 4 bananas and pick 2 more, how many bananas do you have now?\n"
              "Let’s work through word problems together!",
              style: TextStyle(
                color: Color(0xFF056203),
                fontSize: 19,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildImageCard(['assets/images/banana.png', 'assets/images/banana.png', 'assets/images/banana.png', 'assets/images/banana.png', 'assets/images/banana.png']),
              Image.asset(
                'assets/images/operations/add_green.png',
                width: 40,
                height: 40,
              ),
              _buildImageCard(['assets/images/banana.png', 'assets/images/banana.png', 'assets/images/banana.png']),
              Image.asset(
                'assets/images/operations/equal_green.png',
                width: 40,
                height: 40,
              ),
              Text('6', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF1E5F21),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContentAdditionPractice(themeProvider: themeProvider, lessonNumber: 4)),
              );
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Let\'s Practice!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                SizedBox(width: 10),
                Image.asset(
                  'assets/images/next.png',
                  width: 30,
                  height: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageCard(List<String> imagePaths) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF1E5F21), width: 3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: imagePaths
            .map((path) => Image.asset(
                  path,
                  width: 40,
                  height: 40,
                ))
            .toList(),
      ),
    );
  }
}

// --- Lesson 5 ---
class ContentLesson5 extends StatelessWidget {
  final ThemeProvider themeProvider;

  const ContentLesson5({Key? key, required this.themeProvider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeProvider.themeMode == ThemeMode.dark
            ? Colors.grey[850]
            : Color.fromARGB(255, 203, 173, 0),
        title: Text('Lesson 5: Addition with Large Numbers'),
      ),
      backgroundColor: themeProvider.themeMode == ThemeMode.dark
          ? Colors.grey[900]
          : Color(0xFFF7E5C6),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "In this lesson, we will learn how to add larger numbers. We can add the ones place first, then the tens place, and so on.\n"
              "For example, to add 12 + 25, we add 2 + 5 to get 7, and then 10 + 20 to get 30. So the answer is 37!",
              style: TextStyle(
                color: Color(0xFF056203),
                fontSize: 19,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("12", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF1E5F21))),
              Image.asset(
                'assets/images/operations/add_green.png',
                width: 40,
                height: 40,
              ),
              Text("25", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF1E5F21))),
              Image.asset(
                'assets/images/operations/equal_green.png',
                width: 40,
                height: 40,
              ),
              Text("37", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF1E5F21))),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF1E5F21),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContentAdditionPractice(themeProvider: themeProvider, lessonNumber: 5)),
              );
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Let\'s Practice!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                SizedBox(width: 10),
                Image.asset(
                  'assets/images/next.png',
                  width: 30,
                  height: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageCard(List<String> imagePaths) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF1E5F21), width: 3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: imagePaths
            .map((path) => Image.asset(
                  path,
                  width: 40,
                  height: 40,
                ))
            .toList(),
      ),
    );
  }
}