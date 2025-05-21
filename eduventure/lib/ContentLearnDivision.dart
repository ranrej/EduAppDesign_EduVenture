import 'package:flutter/material.dart';
import 'ContentDivisionPractice.dart';
import 'theme_provider.dart';

class ContentLearnDivision extends StatelessWidget {
  final ThemeProvider themeProvider;
  const ContentLearnDivision({Key? key, required this.themeProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeProvider.themeMode == ThemeMode.dark
            ? Colors.grey[850]
            : Color.fromARGB(255, 203, 173, 0),
        title: Text('Division'),
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
                  color: Color(0xFF1E5F21),
                ),
              ),
              SizedBox(
                  width: 10),
              Image.asset(
                'assets/images/operations/div_green.png',
                width: 80,
                height: 80,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Division is like splitting all the bananas you have to your friends equally.\n"
              "Let's learn different ways to divide!",
              style: TextStyle(
                color: Color(0xFF056203),
                fontSize: 19,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 10),
          // Buttons for five lessons
          Column(
            children: [
              _buildLessonButton(context, 'Lesson 1: Basic Division',
                  ContentDivisionLesson1(themeProvider: themeProvider)),
              _buildLessonButton(context, 'Lesson 2: Division as Sharing',
                  ContentDivisionLesson2(themeProvider: themeProvider)),
              _buildLessonButton(context, 'Lesson 3: Understanding Remainders',
                  ContentDivisionLesson3(themeProvider: themeProvider)),
              _buildLessonButton(context, 'Lesson 4: Division Using DMSB',
                  ContentDivisionLesson4(themeProvider: themeProvider)),
              _buildLessonButton(
                  context,
                  'Lesson 5: Division with Larger Numbers',
                  ContentDivisionLesson5(themeProvider: themeProvider)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLessonButton(
      BuildContext context, String lessonTitle, Widget lessonPage) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF1E5F21),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => lessonPage),
          );
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              lessonTitle,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
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
    );
  }
}

// --- Lesson 1 ---
class ContentDivisionLesson1 extends StatelessWidget {
  final ThemeProvider themeProvider;
  const ContentDivisionLesson1({Key? key, required this.themeProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeProvider.themeMode == ThemeMode.dark
            ? Colors.grey[850]
            : Color.fromARGB(255, 203, 173, 0),
        title: Text('Lesson 1: Basic Division'),
      ),
      backgroundColor: themeProvider.themeMode == ThemeMode.dark
          ? Colors.black
          : Color(0xFFF7E5C6),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Let's start with the basics! Division is splitting a number into equal groups.\n"
              "If you have 6 bananas and want to share them with 3 friends, you are dividing 6 by 3.\n"
              "Each friend gets 2 bananas because 6 ÷ 3 = 2.",
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
              _buildImageCard([
                'assets/images/banana.png',
                'assets/images/banana.png',
                'assets/images/banana.png',
                'assets/images/banana.png',
                'assets/images/banana.png',
                'assets/images/banana.png'
              ]),
              Image.asset(
                'assets/images/operations/div_green.png',
                width: 40,
                height: 40,
              ),
              Image.asset('assets/images/numbers/no_3.png',
                  width: 40, height: 40),
              Image.asset(
                'assets/images/operations/equal_green.png',
                width: 40,
                height: 40,
              ),
              _buildImageCard([
                'assets/images/banana.png',
                'assets/images/banana.png',
              ]),
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
                MaterialPageRoute(
                    builder: (context) => ContentDivisionPractice(
                          themeProvider: themeProvider,
                          lessonNumber: 1,
                        )),
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
class ContentDivisionLesson2 extends StatelessWidget {
  final ThemeProvider themeProvider;
  const ContentDivisionLesson2({Key? key, required this.themeProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeProvider.themeMode == ThemeMode.dark
            ? Colors.grey[850]
            : Color.fromARGB(255, 203, 173, 0),
        title: Text('Lesson 2: Division as Sharing'),
      ),
      backgroundColor: themeProvider.themeMode == ThemeMode.dark
          ? Colors.black
          : Color(0xFFF7E5C6),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Think of division as sharing equally. Let's say you have 8 bananas and 4 friends.\n"
              "To find out how many bananas each friend gets, you divide 8 by 4.\n"
              "Imagine giving one banana to each friend until you run out of bananas. Each friend will have 2 bananas.",
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
              _buildImageCard([
                'assets/images/banana.png',
                'assets/images/banana.png',
                'assets/images/banana.png',
                'assets/images/banana.png',
                'assets/images/banana.png',
                'assets/images/banana.png',
                'assets/images/banana.png',
                'assets/images/banana.png'
              ]),
              Image.asset(
                'assets/images/operations/div_green.png',
                width: 40,
                height: 40,
              ),
              Image.asset('assets/images/numbers/no_4.png',
                  width: 40, height: 40),
              Image.asset(
                'assets/images/operations/equal_green.png',
                width: 40,
                height: 40,
              ),
              _buildImageCard([
                'assets/images/banana.png',
                'assets/images/banana.png',
              ]),
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
                MaterialPageRoute(
                    builder: (context) => ContentDivisionPractice(
                          themeProvider: themeProvider,
                          lessonNumber: 2,
                        )),
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
class ContentDivisionLesson3 extends StatelessWidget {
  final ThemeProvider themeProvider;
  const ContentDivisionLesson3({Key? key, required this.themeProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeProvider.themeMode == ThemeMode.dark
            ? Colors.grey[850]
            : Color.fromARGB(255, 203, 173, 0),
        title: Text('Lesson 3: Understanding Remainders'),
      ),
      backgroundColor: themeProvider.themeMode == ThemeMode.dark
          ? Colors.black
          : Color(0xFFF7E5C6),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Sometimes, you can't divide things equally. You might have some left over. This leftover is called a remainder.\n"
              "If you have 7 bananas and want to give 2 to each friend, you can give 2 bananas to 3 friends (that's 6 bananas).\n"
              "You will have 1 banana left over. So, 7 ÷ 2 = 3 with a remainder of 1.",
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
              _buildImageCard([
                'assets/images/banana.png',
                'assets/images/banana.png',
                'assets/images/banana.png',
                'assets/images/banana.png',
                'assets/images/banana.png',
                'assets/images/banana.png',
                'assets/images/banana.png'
              ]),
              Image.asset(
                'assets/images/operations/div_green.png',
                width: 40,
                height: 40,
              ),
              Image.asset('assets/images/numbers/no_2.png',
                  width: 40, height: 40),
              Image.asset(
                'assets/images/operations/equal_green.png',
                width: 40,
                height: 40,
              ),
              _buildImageCard([
                'assets/images/banana.png',
                'assets/images/banana.png',
                'assets/images/banana.png',
              ]),
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
                MaterialPageRoute(
                    builder: (context) => ContentDivisionPractice(
                          themeProvider: themeProvider,
                          lessonNumber: 3,
                        )),
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
class ContentDivisionLesson4 extends StatelessWidget {
  final ThemeProvider themeProvider;
  const ContentDivisionLesson4({Key? key, required this.themeProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeProvider.themeMode == ThemeMode.dark
            ? Colors.grey[850]
            : Color.fromARGB(255, 203, 173, 0),
        title: Text('Lesson 4: Division Using DMSB'),
      ),
      backgroundColor: themeProvider.themeMode == ThemeMode.dark
          ? Colors.black
          : Color(0xFFF7E5C6),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "DMSB is a handy way to remember the steps for division!\n"
              "D stands for Divide: First, divide the numbers.\n"
              "M stands for Multiply: Then, multiply the result by the divisor.\n"
              "S stands for Subtract: Next, subtract that from the original number.\n"
              "B stands for Bring Down: Finally, bring down the next digit (if there is one).\n"
              "Let's try 10 ÷ 2:\n"
              "Divide: 10 ÷ 2 = 5\n"
              "Multiply: 5 x 2 = 10\n"
              "Subtract: 10 - 10 = 0\n"
              "Bring Down: Nothing to bring down!",
              style: TextStyle(
                color: Color(0xFF056203),
                fontSize: 19,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20),
          Column(
            children: [
              Text("10 ÷ 2 =",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E5F21))),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("D: 10 ÷ 2 = 5",
                      style: TextStyle(fontSize: 18, color: Color(0xFF056203))),
                  SizedBox(width: 20),
                  Text("M: 5 x 2 = 10",
                      style: TextStyle(fontSize: 18, color: Color(0xFF056203))),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("S: 10 - 10 = 0",
                      style: TextStyle(fontSize: 18, color: Color(0xFF056203))),
                  SizedBox(width: 20),
                  Text("B: (None)",
                      style: TextStyle(fontSize: 18, color: Color(0xFF056203))),
                ],
              ),
              SizedBox(height: 10),
              Text("So, 10 ÷ 2 = 5",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E5F21))),
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
                MaterialPageRoute(
                    builder: (context) => ContentDivisionPractice(
                          themeProvider: themeProvider,
                          lessonNumber: 4,
                        )),
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
}

// --- Lesson 5 ---
class ContentDivisionLesson5 extends StatelessWidget {
  final ThemeProvider themeProvider;
  const ContentDivisionLesson5({Key? key, required this.themeProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeProvider.themeMode == ThemeMode.dark
            ? Colors.grey[850]
            : Color.fromARGB(255, 203, 173, 0),
        title: Text('Lesson 5: Division with Larger Numbers'),
      ),
      backgroundColor: themeProvider.themeMode == ThemeMode.dark
          ? Colors.black
          : Color(0xFFF7E5C6),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "When dividing larger numbers, you can break it down step by step using DMSB.\n"
              "Let's try 48 ÷ 4:\n"
              "Divide: How many times does 4 go into 4? Once (1).\n"
              "Multiply: 1 x 4 = 4.\n"
              "Subtract: 4 - 4 = 0.\n"
              "Bring Down: Bring down the 8.\n"
              "Now we have 8.\n"
              "Divide: How many times does 4 go into 8? Twice (2).\n"
              "Multiply: 2 x 4 = 8.\n"
              "Subtract: 8 - 8 = 0.\n"
              "So, 48 ÷ 4 = 12.",
              style: TextStyle(
                color: Color(0xFF056203),
                fontSize: 19,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20),
          Column(
            children: [
              Text("48 ÷ 4 =",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E5F21))),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Step 1: 4 ÷ 4 = 1",
                      style: TextStyle(fontSize: 18, color: Color(0xFF056203))),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Step 2: 1 x 4 = 4",
                      style: TextStyle(fontSize: 18, color: Color(0xFF056203))),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Step 3: 4 - 4 = 0",
                      style: TextStyle(fontSize: 18, color: Color(0xFF056203))),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Step 4: Bring down 8",
                      style: TextStyle(fontSize: 18, color: Color(0xFF056203))),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Step 5: 8 ÷ 4 = 2",
                      style: TextStyle(fontSize: 18, color: Color(0xFF056203))),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Step 6: 2 x 4 = 8",
                      style: TextStyle(fontSize: 18, color: Color(0xFF056203))),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Step 7: 8 - 8 = 0",
                      style: TextStyle(fontSize: 18, color: Color(0xFF056203))),
                ],
              ),
              SizedBox(height: 10),
              Text("So, 48 ÷ 4 = 12",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E5F21))),
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
                MaterialPageRoute(
                    builder: (context) => ContentDivisionPractice(
                          themeProvider: themeProvider,
                          lessonNumber: 5,
                        )),
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
}
