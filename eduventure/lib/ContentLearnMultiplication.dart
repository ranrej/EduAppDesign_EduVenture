import 'package:flutter/material.dart';
import 'ContentMultiplicationPractice.dart';
import 'theme_provider.dart';

class ContentLearnMultiplication extends StatelessWidget {
  final ThemeProvider themeProvider;

  const ContentLearnMultiplication({Key? key, required this.themeProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeProvider.themeMode == ThemeMode.dark
            ? Colors.grey[850]
            : Color.fromARGB(255, 203, 173, 0),
        title: Text('Multiplication'),
      ),
      backgroundColor: themeProvider.themeMode == ThemeMode.dark
          ? Colors.black
          : Color(0xFFF7E5C6),
      body: SingleChildScrollView(
        child: Column(
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
                    color: Color(0xFF1E5F21),
                  ),
                ),
                SizedBox(
                    width: 10),
                Image.asset(
                  'assets/images/operations/multi_green.png',
                  width: 80,
                  height: 80,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Multiplication is like adding the same number many times!\n"
                "Let's explore different ways to multiply.",
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
                _buildLessonButton(
                    context,
                    'Lesson 1: Repeated Addition',
                    ContentMultiplicationLesson1(themeProvider: themeProvider),
                    1),
                _buildLessonButton(
                    context,
                    'Lesson 2: Multiplying with Pictures',
                    ContentMultiplicationLesson2(themeProvider: themeProvider),
                    2),
                _buildLessonButton(
                    context,
                    'Lesson 3: Using Arrays for Multiplication',
                    ContentMultiplicationLesson3(themeProvider: themeProvider),
                    3),
                _buildLessonButton(
                    context,
                    'Lesson 4: Multiplication Facts',
                    ContentMultiplicationLesson4(themeProvider: themeProvider),
                    4),
                _buildLessonButton(
                    context,
                    'Lesson 5: Multiplying Larger Numbers',
                    ContentMultiplicationLesson5(themeProvider: themeProvider),
                    5),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLessonButton(BuildContext context, String lessonTitle,
      Widget lessonPage, int lessonNumber) {
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
                builder: (context) =>
                    lessonPage.runtimeType == ContentMultiplicationPractice
                        ? ContentMultiplicationPractice(
                            themeProvider: themeProvider,
                            lessonNumber: lessonNumber)
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
class ContentMultiplicationLesson1 extends StatelessWidget {
  final ThemeProvider themeProvider;
  const ContentMultiplicationLesson1({Key? key, required this.themeProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeProvider.themeMode == ThemeMode.dark
            ? Colors.grey[850]
            : Color.fromARGB(255, 203, 173, 0),
        title: Text('Lesson 1: Repeated Addition'),
      ),
      backgroundColor: themeProvider.themeMode == ThemeMode.dark
          ? Colors.black
          : Color(0xFFF7E5C6),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Multiplication is a shortcut for adding the same number over and over again.\n"
                "For example, 3 x 2 is the same as adding 3 two times: 3 + 3 = 6.\n"
                "Imagine you have 2 groups of 3 bananas. That's 3 + 3 = 6 bananas!",
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
                  'assets/images/banana.png'
                ]),
                Image.asset(
                  'assets/images/operations/add_green.png',
                  width: 40,
                  height: 40,
                ),
                _buildImageCard([
                  'assets/images/banana.png',
                  'assets/images/banana.png',
                  'assets/images/banana.png'
                ]),
                Image.asset(
                  'assets/images/operations/equal_green.png',
                  width: 40,
                  height: 40,
                ),
                Text("6",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E5F21))),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("3",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E5F21))),
                Image.asset(
                  'assets/images/operations/multi_green.png',
                  width: 40,
                  height: 40,
                ),
                Text("2",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E5F21))),
                Image.asset(
                  'assets/images/operations/equal_green.png',
                  width: 40,
                  height: 40,
                ),
                Text("6",
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
                      builder: (context) => ContentMultiplicationPractice(
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
class ContentMultiplicationLesson2 extends StatelessWidget {
  final ThemeProvider themeProvider;
  const ContentMultiplicationLesson2({Key? key, required this.themeProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeProvider.themeMode == ThemeMode.dark
            ? Colors.grey[850]
            : Color.fromARGB(255, 203, 173, 0),
        title: Text('Lesson 2: Multiplying with Pictures'),
      ),
      backgroundColor: themeProvider.themeMode == ThemeMode.dark
          ? Colors.black
          : Color(0xFFF7E5C6),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Using pictures can help you understand multiplication. Each group of pictures represents a number.\n"
                "For 2 x 4, you can have 2 groups of 4 bananas each. Count all the bananas to find the answer.",
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
                Column(
                  children: [
                    _buildImageCard([
                      'assets/images/banana.png',
                      'assets/images/banana.png',
                      'assets/images/banana.png',
                      'assets/images/banana.png'
                    ]),
                  ],
                ),
                Image.asset(
                  'assets/images/operations/multi_green.png',
                  width: 40,
                  height: 40,
                ),
                Column(
                  children: [
                    _buildImageCard([
                      'assets/images/banana.png',
                      'assets/images/banana.png'
                    ]),
                  ],
                ),
                Image.asset(
                  'assets/images/operations/equal_green.png',
                  width: 40,
                  height: 40,
                ),
                Text("8",
                    style: TextStyle(
                        fontSize: 34,
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
                      builder: (context) => ContentMultiplicationPractice(
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
class ContentMultiplicationLesson3 extends StatelessWidget {
  final ThemeProvider themeProvider;
  const ContentMultiplicationLesson3({Key? key, required this.themeProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeProvider.themeMode == ThemeMode.dark
            ? Colors.grey[850]
            : Color.fromARGB(255, 203, 173, 0),
        title: Text('Lesson 3: Using Arrays'),
      ),
      backgroundColor: themeProvider.themeMode == ThemeMode.dark
          ? Colors.black
          : Color(0xFFF7E5C6),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "An array is a way to arrange objects in rows and columns. This can help with multiplication!\n"
                "For 3 x 4, you can make an array with 3 rows and 4 columns of bananas. Counting all the bananas will give you the answer.",
                style: TextStyle(
                  color: Color(0xFF056203),
                  fontSize: 19,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildImageCard([
                    'assets/images/banana.png',
                    'assets/images/banana.png',
                    'assets/images/banana.png',
                    'assets/images/banana.png'
                  ]),
                  _buildImageCard([
                    'assets/images/banana.png',
                    'assets/images/banana.png',
                    'assets/images/banana.png',
                    'assets/images/banana.png'
                  ]),
                  _buildImageCard([
                    'assets/images/banana.png',
                    'assets/images/banana.png',
                    'assets/images/banana.png',
                    'assets/images/banana.png'
                  ]),
                ],
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("4 rows x 3 columns =",
                    style: TextStyle(fontSize: 18, color: Color(0xFF056203))),
                SizedBox(width: 10),
                Text("12",
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
                      builder: (context) => ContentMultiplicationPractice(
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
class ContentMultiplicationLesson4 extends StatelessWidget {
  final ThemeProvider themeProvider;
  const ContentMultiplicationLesson4({Key? key, required this.themeProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeProvider.themeMode == ThemeMode.dark
            ? Colors.grey[850]
            : Color.fromARGB(255, 203, 173, 0),
        title: Text('Lesson 4: Multiplication Facts'),
      ),
      backgroundColor: themeProvider.themeMode == ThemeMode.dark
          ? Colors.black
          : Color(0xFFF7E5C6),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Learning multiplication facts can make multiplying faster! These are simple multiplications you can memorize.\n"
                "For example, knowing that 2 x 3 = 6 and 5 x 2 = 10 can help you solve problems quickly.\n"
                "Think of it like remembering how many bananas are in certain groups!",
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("2 x 3 = 6",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1E5F21))),
                    Text("5 x 2 = 10",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1E5F21))),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("3 x 4 = 12",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1E5F21))),
                    Text("10 x 1 = 10",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1E5F21))),
                  ],
                ),
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
                      builder: (context) => ContentMultiplicationPractice(
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
      ),
    );
  }
}

// --- Lesson 5 ---
class ContentMultiplicationLesson5 extends StatelessWidget {
  final ThemeProvider themeProvider;
  const ContentMultiplicationLesson5({Key? key, required this.themeProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeProvider.themeMode == ThemeMode.dark
            ? Colors.grey[850]
            : Color.fromARGB(255, 203, 173, 0),
        title: Text('Lesson 5: Multiplying Large Numbers'),
      ),
      backgroundColor: themeProvider.themeMode == ThemeMode.dark
          ? Colors.black
          : Color(0xFFF7E5C6),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "When multiplying larger numbers, we can break it down into smaller steps. Let's try 12 x 3:\n"
                "First, multiply the ones place: 2 x 3 = 6.\n"
                "Then, multiply the tens place: 1 x 3 = 3.\n"
                "Combine the results: 3 tens and 6 ones make 36.\n"
                "So, 12 x 3 = 36. Imagine you have 3 groups of 12 bananas!",
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
                Text("12 x 3 =",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E5F21))),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text("Tens",
                            style: TextStyle(
                                fontSize: 16, color: Color(0xFF056203))),
                        Text("1",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1E5F21))),
                      ],
                    ),
                    SizedBox(width: 10),
                    Column(
                      children: [
                        Text("Ones",
                            style: TextStyle(
                                fontSize: 16, color: Color(0xFF056203))),
                        Text("2",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1E5F21))),
                      ],
                    ),
                    SizedBox(width: 20),
                    Image.asset(
                      'assets/images/operations/multi_green.png',
                      width: 40,
                      height: 40,
                    ),
                    SizedBox(width: 20),
                    Text("3",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1E5F21))),
                  ],
                ),
                SizedBox(height: 10),
                Text("Step 1: Multiply ones: 2 x 3 = 6",
                    style: TextStyle(fontSize: 18, color: Color(0xFF056203))),
                Text("Step 2: Multiply tens: 1 x 3 = 3",
                    style: TextStyle(fontSize: 18, color: Color(0xFF056203))),
                SizedBox(height: 10),
                Text("So, 12 x 3 = 36",
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
                      builder: (context) => ContentMultiplicationPractice(
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
      ),
    );
  }
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
