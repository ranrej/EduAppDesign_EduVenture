import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'GamesHome.dart';
import 'theme_provider.dart';

class GamesMinuteMath extends StatefulWidget {
  final ThemeProvider themeProvider;
  const GamesMinuteMath({Key? key, required this.themeProvider})
      : super(key: key);

  @override
  _GamesMinuteMathState createState() => _GamesMinuteMathState();
}

class _GamesMinuteMathState extends State<GamesMinuteMath> {
  late final ThemeProvider themeProvider;
  int _timeLeft = 60;
  Timer? _timer;
  List<List<int>> _mathValues = [];
  List<TextEditingController> _controllers = [];
  String? _resultImage;
  bool _timerEnded = false;

  @override
  void initState() {
    super.initState();
    themeProvider = widget.themeProvider;
    _generateMathValues();
    _startTimer();
  }

  void _generateMathValues() {
    final random = Random();
    for (int i = 0; i < 9; i++) {
      final num1 = random.nextInt(10) + 1; // Random number between 1 and 10
      final num2 = random.nextInt(10) + 1; // Random number between 1 and 10
      final answer = num1 + num2;
      _mathValues.add([num1, num2, answer]);
      _controllers.add(TextEditingController());
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_timeLeft > 0) {
          _timeLeft--;
        } else {
          _timer?.cancel();
          _checkResults();
        }
      });
    });
  }

  void _checkResults() {
    bool allCorrect = true;
    for (int i = 0; i < _mathValues.length; i++) {
      if (_controllers[i].text != _mathValues[i][2].toString()) {
        allCorrect = false;
        break;
      }
    }
    setState(() {
      String resultImage =
          allCorrect ? 'assets/images/pass.png' : 'assets/images/fail.png';
      _resultImage = resultImage;
      _timerEnded = true;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Fetching the current theme data
    final theme = Theme.of(context);

    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  GameHomeScreen(themeProvider: themeProvider)),
        );
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: themeProvider.themeMode == ThemeMode.dark
              ? Colors.grey[850]
              : Color.fromARGB(255, 203, 173, 0),
          title: Text('Minute Math'),
        ),
        backgroundColor: themeProvider.themeMode == ThemeMode.dark
            ? Colors.black
            : Color(0xFFF7E5C6),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  SizedBox(height: 40),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                GameHomeScreen(themeProvider: themeProvider)),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/logo.png',
                          width: 75,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Minute Math',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E5F21),
                    ),
                  ),
                  Text(
                    '00:${_timeLeft.toString().padLeft(2, '0')}',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E5F21), // Theme-based text color
                    ),
                  ),
                  SizedBox(height: 7),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 1,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                      ),
                      itemCount: 9,
                      itemBuilder: (context, index) {
                        return _buildMathCard(
                            _mathValues[index], _controllers[index]);
                      },
                    ),
                  ),
                  if (_timerEnded)
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF1E5F21),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                GamesMinuteMath(themeProvider: themeProvider),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Next',
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
      ),
    );
  }

  Widget _buildMathCard(List<int> values, TextEditingController controller) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF1E5F21), width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${values[0]}',
              style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E5F21)),
            ),
            Text(
              '+ ${values[1]}',
              style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E5F21)),
            ),
            Divider(color: Color(0xFF1E5F21), thickness: 2),
            Container(
              height: 30,
              child: TextField(
                controller: controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '=',
                  hintStyle: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E5F21)),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E5F21)),
                enabled:
                    !_timerEnded, // Disable the TextField when _timerEnded is true
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final String resultImage;

  ResultScreen({required this.resultImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          resultImage,
          width: 400,
          height: 400,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
