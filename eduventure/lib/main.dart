import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'homePage.dart';
import 'ContentHome.dart';
import 'about.dart';
import 'GamesHome.dart';
import 'escaperoom.dart';
import 'theme_provider.dart';

void main() {
  runApp(const EduVentureApp());
}

class EduVentureApp extends StatefulWidget {
  const EduVentureApp({super.key});

  @override
  _EduVentureAppState createState() => _EduVentureAppState();
}

class _EduVentureAppState extends State<EduVentureApp> {

  late final AudioPlayer _audioPlayer;
  late ThemeProvider _themeProvider;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _playBackgroundMusic();
    _themeProvider = ThemeProvider();
    _themeProvider.loadTheme();
  }

  void _playBackgroundMusic() async {
    try {
      await _audioPlayer.setLoopMode(LoopMode.one);
      await _audioPlayer.setAsset('assets/audio/kids_music.mp3');
      await _audioPlayer.setVolume(1.0);
      _audioPlayer.play();
    } catch (e) {
      print("Error playing audio: $e");
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _themeProvider,
      builder: (context, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: _themeProvider.themeMode,
          home: SplashScreen(themeProvider: _themeProvider),
          routes: {
            '/about': (context) => AboutPage(themeProvider: _themeProvider),
            '/learn': (context) => LearnContentScreen(themeProvider: _themeProvider),
            '/games': (context) => GameHomeScreen(themeProvider: _themeProvider),
            '/escape': (context) => Escape(themeProvider: _themeProvider),
          },
        );
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  final ThemeProvider themeProvider;
  const SplashScreen({Key? key, required this.themeProvider}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage(themeProvider: widget.themeProvider)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.themeProvider.themeMode == ThemeMode.light
          ? Color(0xFFF7E5C6)
          : Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Image.asset(
          'assets/images/logo.png',
          height: 250,
        ),
      ),
    );
  }
}