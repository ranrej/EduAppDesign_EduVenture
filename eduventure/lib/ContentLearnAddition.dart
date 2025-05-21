import 'package:flutter/material.dart';
import 'ContentAdditionPractice.dart';
import 'theme_provider.dart';

class ContentLearnAddition extends StatelessWidget {
  final ThemeProvider themeProvider;

  const ContentLearnAddition({Key? key, required this.themeProvider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeProvider.themeMode == ThemeMode.dark
            ? Colors.grey[850]
            : Color.fromARGB(255, 203, 173, 0),
        title: Text('Addition'),
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
                'ADDITION',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E5F21),
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
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Addition is like putting two groups of bananas together to have MORE bananas.\n"
              "If I have 1 banana and 3 bananas together, I will have 4 bananas.\n"
              "That’s a lot more bananas!",
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
              _buildLessonButton(context, 'Lesson 1: Basic Addition', ContentLesson1(themeProvider: themeProvider)),
              _buildLessonButton(context, 'Lesson 2: Adding with Pictures', ContentLesson2(themeProvider: themeProvider)),
              _buildLessonButton(context, 'Lesson 3: Adding Doubles', ContentLesson3(themeProvider: themeProvider)),
              _buildLessonButton(context, 'Lesson 4: Word Problems', ContentLesson4(themeProvider: themeProvider)),
              _buildLessonButton(context, 'Lesson 5: Addition with Large Numbers', ContentLesson5(themeProvider: themeProvider)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLessonButton(BuildContext context, String lessonTitle, Widget lessonPage) {
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
          ? Colors.black
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
                MaterialPageRoute(builder: (context) => ContentAdditionPractice(themeProvider: themeProvider, lessonNumber: 1,)),
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
          ? Colors.black
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
                MaterialPageRoute(builder: (context) => ContentAdditionPractice(themeProvider: themeProvider, lessonNumber: 2,)),
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
          ? Colors.black
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
              _buildImageCard(['assets/images/banana.png', 'assets/images/banana.png', 'assets/images/banana.png', 'assets/images/banana.png']),
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
                MaterialPageRoute(builder: (context) => ContentAdditionPractice(themeProvider: themeProvider, lessonNumber: 3,)),
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
          ? Colors.black
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
              _buildImageCard(['assets/images/banana.png', 'assets/images/banana.png', 'assets/images/banana.png', 'assets/images/banana.png']),
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
              _buildImageCard(['assets/images/banana.png', 'assets/images/banana.png', 'assets/images/banana.png', 'assets/images/banana.png', 'assets/images/banana.png', 'assets/images/banana.png',]),
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
                MaterialPageRoute(builder: (context) => ContentAdditionPractice(themeProvider: themeProvider, lessonNumber: 4,)),
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
          ? Colors.black
          : Color(0xFFF7E5C6),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Adding large numbers is easy when you break it down!\n\n"
              "1. Write the numbers vertically, lining up the digits by place value\n"
              "2. Add from right to left, starting with the ones place\n"
              "3. If the sum in any column is 10 or more, carry the extra digit to the next column\n\n"
              "Example:\n"
              "  2456\n"
              "+ 3789\n"
              "-------\n"
              "  6245",
              style: TextStyle(
                color: Color(0xFF056203),
                fontSize: 19,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20),
          _buildImageCard(['assets/images/addition_example.png']),
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
                MaterialPageRoute(builder: (context) => ContentAdditionPractice(themeProvider: themeProvider, lessonNumber: 5,)),
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
          width: 200,
          height: 200,
        ))
            .toList(),
      ),
    );
  }
}