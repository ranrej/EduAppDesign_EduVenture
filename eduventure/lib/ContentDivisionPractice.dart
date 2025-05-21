import 'dart:async';
import 'package:flutter/material.dart';
import 'ContentHome.dart';
import 'theme_provider.dart';

class ContentDivisionPractice extends StatefulWidget {
  final ThemeProvider themeProvider;
  final int lessonNumber;

  ContentDivisionPractice({Key? key, required this.themeProvider, required this.lessonNumber}) : super(key: key);
  @override
  _ContentDivisionPracticeState createState() => _ContentDivisionPracticeState();
}

class _ContentDivisionPracticeState extends State<ContentDivisionPractice> {
  bool _isOptionsVisible = false;
  int? _selectedAnswer;
  bool _showResultImage = false;
  String? _resultImage;
  int _dividend = 4;
  int _divisor = 2;
  int _correctAnswer = 2;
  List<int> _answerOptions = [1, 2, 3];

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
          // Basic Division
          _dividend = 4;
          _divisor = 2;
          _correctAnswer = 2;
          _answerOptions = [1, 2, 3];
          break;
        case 2:
          // Division as Sharing
          _dividend = 6;
          _divisor = 3;
          _correctAnswer = 2;
          _answerOptions = [1, 2, 3];
          break;
        case 3:
          // Understanding Remainders
          _dividend = 7;
          _divisor = 2;
          _correctAnswer = 3;
          _answerOptions = [2, 3, 4];
          break;
        case 4:
          // Division Using DMSB
          _dividend = 12;
          _divisor = 3;
          _correctAnswer = 4;
          _answerOptions = [3, 4, 5];
          break;
        case 5:
          // Division with Larger Numbers
          _dividend = 56;
          _divisor = 7;
          _correctAnswer = 8;
          _answerOptions = [9, 8, 4];
          break;
        default:
          _dividend = 4;
          _divisor = 2;
          _correctAnswer = 2;
          _answerOptions = [1, 2, 3];
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
        backgroundColor: primaryColor,
        title: Text('Division Practice - Lesson ${widget.lessonNumber}', style: TextStyle(color: textColor)),
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
                    'DIVISION',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  SizedBox(width: 10),
                  Image.asset(
                    'assets/images/operations/div_green.png',
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
                    _buildImageCard(List.generate(_dividend, (index) => 'assets/images/banana.png'), cardColor: cardColor, borderColor: borderColor),
                  if (widget.lessonNumber != 1 && widget.lessonNumber != 2)
                    Text('$_dividend', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: textColor)),
                  SizedBox(width: 10),
                  Image.asset(
                    'assets/images/operations/div_green.png',
                    width: 40,
                    height: 40,
                  ),
                  SizedBox(width: 10),
                  if (widget.lessonNumber == 1 || widget.lessonNumber == 2)
                    _buildImageCard(List.generate(_divisor, (index) => 'assets/images/banana.png'), cardColor: cardColor, borderColor: borderColor),
                  if (widget.lessonNumber != 1 && widget.lessonNumber != 2)
                    Text('$_divisor', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: textColor)),
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