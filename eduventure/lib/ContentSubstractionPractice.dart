import 'dart:async';
import 'package:flutter/material.dart';
import 'ContentHome.dart';
import 'theme_provider.dart';

class ContentSubtractionPractice extends StatefulWidget {
  final ThemeProvider themeProvider;
  final int lessonNumber;

  ContentSubtractionPractice({Key? key, required this.themeProvider, required this.lessonNumber}) : super(key: key);

  @override
  _ContentSubtractionPracticeState createState() => _ContentSubtractionPracticeState();
}

class _ContentSubtractionPracticeState extends State<ContentSubtractionPractice> {
  bool _isOptionsVisible = false;
  int? _selectedAnswer;
  bool _showResultImage = false;
  String? _resultImage;
  int _operand1 = 5;
  int _operand2 = 2;
  int _correctAnswer = 3;
  List<int> _answerOptions = [2, 3, 4];

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
          // Lesson 1: Basic Subtraction
          _operand1 = 4;
          _operand2 = 1;
          _correctAnswer = 3;
          _answerOptions = [2, 3, 5];
          break;
        case 2:
          // Lesson 2: Subtracting with Pictures
          _operand1 = 6;
          _operand2 = 2;
          _correctAnswer = 4;
          _answerOptions = [3, 4, 5];
          break;
        case 3:
          // Lesson 3: Counting Backwards
          _operand1 = 8;
          _operand2 = 5;
          _correctAnswer = 3;
          _answerOptions = [3, 5, 6];
          break;
        case 4:
          // Lesson 4: Subtracting from Ten
          _operand1 = 10;
          _operand2 = 7;
          _correctAnswer = 3;
          _answerOptions = [5, 3, 7];
          break;
        case 5:
          // Lesson 5: Large Numbers
          _operand1 = 25;
          _operand2 = 15;
          _correctAnswer = 10;
          _answerOptions = [8, 10, 12];
          break;
        default:
          _operand1 = 5;
          _operand2 = 2;
          _correctAnswer = 3;
          _answerOptions = [2, 3, 4];
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
    Color cardColor = isDarkMode ? Colors.black: Color(0xFFF7E5C6);
    Color borderColor = Color(0xFF1E5F21);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('Subtraction Practice - Lesson ${widget.lessonNumber}', style: TextStyle(color: textColor)),
      ),
      backgroundColor: backgroundColor,
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
                    'SUBTRACTION',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  SizedBox(width: 10),
                  Image.asset(
                    'assets/images/operations/sub_green.png',
                    width: 80,
                    height: 80,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Operand 1
                  if (widget.lessonNumber == 1 || widget.lessonNumber == 2)
                    _buildImageCard(List.generate(_operand1, (index) => 'assets/images/banana.png'), cardColor: cardColor, borderColor: borderColor),
                  if (widget.lessonNumber != 1 && widget.lessonNumber != 2)
                    Text('$_operand1', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: textColor)),
                  SizedBox(width: 10),
                  Image.asset(
                    'assets/images/operations/sub_green.png',
                    width: 40,
                    height: 40,
                  ),
                  SizedBox(width: 10),
                  // Operand 2
                  if (widget.lessonNumber == 1 || widget.lessonNumber == 2)
                    _buildImageCard(List.generate(_operand2, (index) => 'assets/images/banana.png'), cardColor: cardColor, borderColor: borderColor),
                  if (widget.lessonNumber != 1 && widget.lessonNumber != 2)
                    Text('$_operand2', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: textColor)),
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

  Widget _buildImageCard(List<String> imagePaths, {Color cardColor = const Color(0xFF979F01), Color borderColor = const Color(0xFF1E5F21), bool isSquare = false}) {
    return Container(
      width: isSquare ? 70 : null,
      height: isSquare ? 70 : null,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: cardColor,
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