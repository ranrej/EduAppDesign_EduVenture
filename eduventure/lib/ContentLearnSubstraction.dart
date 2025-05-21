import 'package:flutter/material.dart';
import 'ContentSubstractionPractice.dart';
import 'theme_provider.dart';

class ContentLearnSubstraction extends StatelessWidget {
  final ThemeProvider themeProvider;

  const ContentLearnSubstraction({Key? key, required this.themeProvider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeProvider.themeMode == ThemeMode.dark
            ? Colors.grey[850]
            : Color.fromARGB(255, 203, 173, 0),
        title: Text('Subtraction'),
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
                'SUBTRACTION',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E5F21),
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
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Subtraction is like taking away some bananas you have.\n"
              "Let's learn different ways to subtract!",
              style: TextStyle(
                color: Color(0xFF056203),
                fontSize: 19,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 10),
          Column(
            children: [
              _buildLessonButton(context, 'Lesson 1: Basic Subtraction', ContentSubtractionLesson1(themeProvider: themeProvider), 1),
              _buildLessonButton(context, 'Lesson 2: Subtracting with Pictures', ContentSubtractionLesson2(themeProvider: themeProvider), 2),
              _buildLessonButton(context, 'Lesson 3: Counting Backwards', ContentSubtractionLesson3(themeProvider: themeProvider), 3),
              _buildLessonButton(context, 'Lesson 4: Subtracting from Ten', ContentSubtractionLesson4(themeProvider: themeProvider), 4),
              _buildLessonButton(context, 'Lesson 5: Large Numbers', ContentSubtractionLesson5(themeProvider: themeProvider), 5),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLessonButton(BuildContext context, String lessonTitle, Widget lessonPage, int lessonNumber) {
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
            MaterialPageRoute(
                builder: (context) => lessonPage.runtimeType == ContentSubtractionPractice
                    ? ContentSubtractionPractice(themeProvider: themeProvider, lessonNumber: lessonNumber)
                    : lessonPage),
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
class ContentSubtractionLesson1 extends StatelessWidget {
  final ThemeProvider themeProvider;
  const ContentSubtractionLesson1({Key? key, required this.themeProvider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeProvider.themeMode == ThemeMode.dark
            ? Colors.grey[850]
            : Color.fromARGB(255, 203, 173, 0),
        title: Text('Lesson 1: Basic Subtraction'),
      ),
      backgroundColor: themeProvider.themeMode == ThemeMode.dark
          ? Colors.black
          : Color(0xFFF7E5C6),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "In this lesson, we will learn how to subtract basic numbers. Start with simple problems like 3 - 1, 5 - 2.\n"
              "You can use your fingers to help! For example, start with 3 fingers up, then put 1 down to see how many are left.",
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
              _buildImageCard(['assets/images/banana.png', 'assets/images/banana.png', 'assets/images/banana.png']),
              Image.asset(
                'assets/images/operations/sub_green.png',
                width: 40,
                height: 40,
              ),
              _buildImageCard(['assets/images/banana.png']),
              Image.asset(
                'assets/images/operations/equal_green.png',
                width: 40,
                height: 40,
              ),
              _buildImageCard(['assets/images/banana.png', 'assets/images/banana.png']),
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
                MaterialPageRoute(builder: (context) => ContentSubtractionPractice(themeProvider: themeProvider, lessonNumber: 1,)),
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
class ContentSubtractionLesson2 extends StatelessWidget {
  final ThemeProvider themeProvider;
  const ContentSubtractionLesson2({Key? key, required this.themeProvider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeProvider.themeMode == ThemeMode.dark
            ? Colors.grey[850]
            : Color.fromARGB(255, 203, 173, 0),
        title: Text('Lesson 2: Subtracting with Pictures'),
      ),
      backgroundColor: themeProvider.themeMode == ThemeMode.dark
          ? Colors.black
          : Color(0xFFF7E5C6),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "In this lesson, you will learn how to subtract by using pictures of objects.\n"
              "For example, if you have 5 bananas and you take away 2 bananas, you can see how many are left.",
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
                'assets/images/banana.png'
              ]),
              Image.asset(
                'assets/images/operations/sub_green.png',
                width: 40,
                height: 40,
              ),
              _buildImageCard(['assets/images/banana.png', 'assets/images/banana.png']),
              Image.asset(
                'assets/images/operations/equal_green.png',
                width: 40,
                height: 40,
              ),
              _buildImageCard(['assets/images/banana.png', 'assets/images/banana.png', 'assets/images/banana.png']),
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
                MaterialPageRoute(builder: (context) => ContentSubtractionPractice(themeProvider: themeProvider, lessonNumber: 2,)),
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
class ContentSubtractionLesson3 extends StatelessWidget {
  final ThemeProvider themeProvider;
  const ContentSubtractionLesson3({Key? key, required this.themeProvider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeProvider.themeMode == ThemeMode.dark
            ? Colors.grey[850]
            : Color.fromARGB(255, 203, 173, 0),
        title: Text('Lesson 3: Counting Backwards'),
      ),
      backgroundColor: themeProvider.themeMode == ThemeMode.dark
          ? Colors.black
          : Color(0xFFF7E5C6),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Counting backwards is a fun way to subtract! Start with the bigger number and count backwards the number you are subtracting.\n"
              "For example, for 7 - 3, start at 7 and count back 3 times: 6, 5, 4. The answer is 4!",
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
              Text("7", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF1E5F21))),
              Image.asset(
                'assets/images/operations/sub_green.png',
                width: 40,
                height: 40,
              ),
              Text("3", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF1E5F21))),
              Image.asset(
                'assets/images/operations/equal_green.png',
                width: 40,
                height: 40,
              ),
              Text("?", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF1E5F21))),
            ],
          ),
          SizedBox(height: 10),
          Text("Count back: 7 -> 6 -> 5 -> 4", style: TextStyle(fontSize: 18, color: Color(0xFF056203))),
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
                MaterialPageRoute(builder: (context) => ContentSubtractionPractice(themeProvider: themeProvider, lessonNumber: 3,)),
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

// --- Lesson 4 ---
class ContentSubtractionLesson4 extends StatelessWidget {
  final ThemeProvider themeProvider;
  const ContentSubtractionLesson4({Key? key, required this.themeProvider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeProvider.themeMode == ThemeMode.dark
            ? Colors.grey[850]
            : Color.fromARGB(255, 203, 173, 0),
        title: Text('Lesson 4: Subtracting from Ten'),
      ),
      backgroundColor: themeProvider.themeMode == ThemeMode.dark
          ? Colors.black
          : Color(0xFFF7E5C6),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Subtracting from ten can be easier! Think about how many you need to add to a number to make ten.\n"
              "For 10 - 4, think: What do I add to 4 to get 10? The answer is 6, so 10 - 4 = 6.\n"
              "Imagine you have 10 bananas and you give away 4. You have 6 left.",
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
              Text("10", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF1E5F21))),
              Image.asset(
                'assets/images/operations/sub_green.png',
                width: 40,
                height: 40,
              ),
              Text("4", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF1E5F21))),
              Image.asset(
                'assets/images/operations/equal_green.png',
                width: 40,
                height: 40,
              ),
              Text("?", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF1E5F21))),
            ],
          ),
          SizedBox(height: 10),
          Text("Think: 4 + ? = 10", style: TextStyle(fontSize: 18, color: Color(0xFF056203))),
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
                MaterialPageRoute(builder: (context) => ContentSubtractionPractice(themeProvider: themeProvider, lessonNumber: 4,)),
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
class ContentSubtractionLesson5 extends StatelessWidget {
  final ThemeProvider themeProvider;
  const ContentSubtractionLesson5({Key? key, required this.themeProvider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeProvider.themeMode == ThemeMode.dark
            ? Colors.grey[850]
            : Color.fromARGB(255, 203, 173, 0),
        title: Text('Lesson 5: Large Numbers'),
      ),
      backgroundColor: themeProvider.themeMode == ThemeMode.dark
          ? Colors.black
          : Color(0xFFF7E5C6),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "When subtracting larger numbers, it helps to break it down place by place, starting from the right.\n"
              "Let's try 57 - 23:\n"
              "First, subtract the ones place: 7 - 3 = 4.\n"
              "Then, subtract the tens place: 5 - 2 = 3.\n"
              "So, 57 - 23 = 34.\n"
              "Imagine you have 57 bananas and you give away 23. You have 34 left.",
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
              Text("57 - 23 =", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF1E5F21))),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text("Tens", style: TextStyle(fontSize: 16, color: Color(0xFF056203))),
                      Text("5", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF1E5F21))),
                    ],
                  ),
                  SizedBox(width: 10),
                  Column(
                    children: [
                      Text("Ones", style: TextStyle(fontSize: 16, color: Color(0xFF056203))),
                      Text("7", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF1E5F21))),
                    ],
                  ),
                  SizedBox(width: 20),
                  Image.asset(
                    'assets/images/operations/sub_green.png',
                    width: 40,
                    height: 40,
                  ),
                  SizedBox(width: 20),
                  Column(
                    children: [
                      Text("Tens", style: TextStyle(fontSize: 16, color: Color(0xFF056203))),
                      Text("2", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF1E5F21))),
                    ],
                  ),
                  SizedBox(width: 10),
                  Column(
                    children: [
                      Text("Ones", style: TextStyle(fontSize: 16, color: Color(0xFF056203))),
                      Text("3", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF1E5F21))),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text("Step 1: Subtract the ones: 7 - 3 = 4", style: TextStyle(fontSize: 18, color: Color(0xFF056203))),
              Text("Step 2: Subtract the tens: 5 - 2 = 3", style: TextStyle(fontSize: 18, color: Color(0xFF056203))),
              SizedBox(height: 10),
              Text("So, 57 - 23 = 34", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF1E5F21))),
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
                MaterialPageRoute(builder: (context) => ContentSubtractionPractice(themeProvider: themeProvider, lessonNumber: 5,)),
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