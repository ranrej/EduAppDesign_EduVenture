import 'dart:async';
import 'package:flutter/material.dart';
import 'ContentHome.dart';
import 'theme_provider.dart';

class ContentMultiplicationPractice extends StatefulWidget {
  final ThemeProvider themeProvider;
  final int lessonNumber;

  ContentMultiplicationPractice({Key? key, required this.themeProvider, required this.lessonNumber}) : super(key: key);

  @override
  _ContentMultiplicationPracticeState createState() => _ContentMultiplicationPracticeState();
}

class _ContentMultiplicationPracticeState extends State<ContentMultiplicationPractice> {
  bool _isOptionsVisible = false;
  int? _selectedAnswer;
  bool _showResultImage = false;
  String? _resultImage;
  int _factor1 = 2;
  int _factor2 = 3;
  int _correctAnswer = 6;
  List<int> _answerOptions = [4, 5, 6];

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
          // Lesson 1: Repeated Addition
          _factor1 = 6;
          _factor2 = 2;
          _correctAnswer = 12;
          _answerOptions = [10, 16, 12];
          break;
        case 2:
          // Lesson 2: Multiplying with Pictures
          _factor1 = 4;
          _factor2 = 3;
          _correctAnswer = 12;
          _answerOptions = [12, 8, 7];
          break;
        case 3:
          // Lesson 3: Using Arrays for Multiplication (Let's use numbers here)
          _factor1 = 5;
          _factor2 = 4;
          _correctAnswer = 20;
          _answerOptions = [6, 20, 9];
          break;
        case 4:
          // Lesson 4: Multiplication Facts (Numbers)
          _factor1 = 5;
          _factor2 = 3;
          _correctAnswer = 15;
          _answerOptions = [12, 15, 16];
          break;
        case 5:
          // Lesson 5: Multiplying Larger Numbers (Numbers)
          _factor1 = 10;
          _factor2 = 2;
          _correctAnswer = 20;
          _answerOptions = [18, 20, 22];
          break;
        default:
          _factor1 = 2;
          _factor2 = 3;
          _correctAnswer = 6;
          _answerOptions = [4, 5, 6];
          break;
      }
      _answerOptions.shuffle();
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    Color backgroundColor = isDarkMode ? Colors.black : Color(0xFFF7E5C6);
    Color? primaryColor = isDarkMode ? Colors.grey[850] : Color.fromARGB(255, 203, 173, 0);
    Color textColor = isDarkMode ? Colors.white : Colors.black;
    Color cardColor = isDarkMode ? Colors.black : Color(0xFFF7E5C6);
    Color borderColor = Color(0xFF1E5F21);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.themeProvider.themeMode == ThemeMode.dark
            ? Colors.grey[850]
            : Color.fromARGB(255, 203, 173, 0),
        title: Text('Multiplication - Lesson ${widget.lessonNumber}'),
      ),
      backgroundColor: backgroundColor,
      body: SingleChildScrollView( 
        child: Stack(
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
                      'MULTIPLICATION',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                    SizedBox(width: 10),
                    Image.asset(
                      'assets/images/operations/multi_green.png',
                      width: 80,
                      height: 80,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (widget.lessonNumber == 1 || widget.lessonNumber == 2)
                      _buildImageCard(List.generate(_factor1, (index) => 'assets/images/banana.png'), cardColor: cardColor, borderColor: borderColor)
                    else
                      Text('$_factor1', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: textColor)),
                    SizedBox(width: 10),
                    Image.asset(
                      'assets/images/operations/multi_green.png',
                      width: 40,
                      height: 40,
                    ),
                    SizedBox(width: 10),
                    if (widget.lessonNumber == 2)
                      Text('$_factor2', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: textColor))
                    else if (widget.lessonNumber == 1)
                      _buildImageCard(List.generate(_factor2, (index) => 'assets/images/banana.png'), cardColor: cardColor, borderColor: borderColor)
                    else
                      Text('$_factor2', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: textColor)),
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
                                border: Border.all(color: borderColor, width: 3),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            )
                          : Text('$_selectedAnswer', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: textColor)),
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
                          border: Border.all(color: borderColor, width: 3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text('$option', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: textColor)),
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
                SizedBox(height: 40), 
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
      ),
    );
  }

  Widget _buildImageCard(List<String> imagePaths, {bool isSquare = false, required Color cardColor, required Color borderColor}) {
    return Container(
      width: isSquare ? 70 : null,
      height: isSquare ? 70 : null,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isSquare ? cardColor : Colors.transparent,
        border: Border.all(color: borderColor, width: 3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: isSquare
          ? null
          : Column(
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