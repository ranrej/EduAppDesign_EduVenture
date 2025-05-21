import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'theme_provider.dart';

class VideoListScreen extends StatelessWidget {
  final ThemeProvider themeProvider;
  const VideoListScreen({Key? key, required this.themeProvider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeProvider.themeMode == ThemeMode.dark
            ? Colors.grey[850]
            : Color.fromARGB(255, 203, 173, 0),
        title: Text(
          'Watch Videos',
          style: TextStyle(
            color: themeProvider.themeMode == ThemeMode.dark ? Colors.white : Colors.black,
          ),
        ),
      ),
      backgroundColor: themeProvider.themeMode == ThemeMode.dark
          ? Colors.black
          : Color(0xFFF7E5C6),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          _buildVideoButton(context, 'Subtraction Song', 'assets/videos/video1.mp4'),
          _buildVideoButton(context, 'Addition + Subtraction', 'assets/videos/video2.mp4'),
          _buildVideoButton(context, 'Division', 'assets/videos/video3.mp4'),
          _buildVideoButton(context, 'Multiplication', 'assets/videos/video4.mp4'),
          _buildVideoButton(context, 'Learn DMSB', 'assets/videos/video5.mp4'),
          _buildVideoButton(context, 'Long Multiplication', 'assets/videos/video6.mp4'),
        ],
      ),
    );
  }

  Widget _buildVideoButton(BuildContext context, String title, String videoPath) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VideoPlayerScreen(
                videoPath: videoPath,
                themeProvider: themeProvider,
              ),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: themeProvider.themeMode == ThemeMode.dark
              ? Color(0xFF1E5F21)
              : Color(0xFF1E5F21),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  final String videoPath;
  final ThemeProvider themeProvider;
  const VideoPlayerScreen({Key? key, required this.videoPath, required this.themeProvider}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.themeProvider.themeMode == ThemeMode.dark
            ? Colors.grey[850]
            : Color.fromARGB(255, 203, 173, 0),
        title: Text(
          'Video Player',
          style: TextStyle(
            color: widget.themeProvider.themeMode == ThemeMode.dark ? Colors.white : Colors.black,
          ),
        ),
      ),
      backgroundColor: widget.themeProvider.themeMode == ThemeMode.dark
          ? Colors.black
          : Color(0xFFF7E5C6),
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : CircularProgressIndicator(),
      ),
    );
  }
}
