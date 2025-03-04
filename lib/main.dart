import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cytodoro Game',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: StartScreen(),
    );
  }
}

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  final AssetsAudioPlayer _audioPlayer = AssetsAudioPlayer();

  void _playSound() async {
    await _audioPlayer.open(
      Audio('assets/animations/Tap.mp3'), // Use the correct case
      autoStart: true,
    );
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CYTODORO'),
        backgroundColor: Colors.yellowAccent,
      ),
      body: Stack(
        children: <Widget>[
          Image.asset(
            'assets/animations/homescreen.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            color: Colors.yellow.withOpacity(0.5), // Optional overlay for better contrast
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Lottie.asset('assets/animations/cell.json', width: 300, height: 300),
                  SizedBox(height: 10),
                  Image.asset(
                    'assets/animations/cytodoro.png',
                    width: 250,
                    height: 250,
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      _playSound();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GameScreen()),
                      );
                    },
                    child: SvgPicture.asset(
                      'assets/animations/start_button.svg',
                      width: 200, // Adjust the size as needed
                      height: 200, // Adjust the size as needed
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final AssetsAudioPlayer _audioPlayer = AssetsAudioPlayer();

  void _playSound() async {
    await _audioPlayer.open(
      Audio('assets/animations/Tap.mp3'), // Use the correct case
      autoStart: true,
    );
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WELCOME TO CYTODORO'),
        backgroundColor: Colors.yellowAccent,
      ),
      body: Stack(
        children: <Widget>[
          Image.asset(
            'assets/animations/homescreen.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            color: Colors.yellow.withOpacity(0.5), // Optional overlay for better contrast
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'WELCOME TO CYTODORO',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 36, color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'CYTODORO is a mobile app that combines the excitement of gamified learning with the productivity-boosting Pomodoro technique. Dive into the cell life cycle through interactive games while managing your study time effectively with customizable timers. Make learning biology fun and efficient!',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24, color: Colors.black),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    ),
                    onPressed: () {
                      _playSound();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ThirdScreen()),
                      );
                    },
                    child: Text(
                      'NEXT',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ThirdScreen extends StatefulWidget {
  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  final int cellCount = 0; // Default cell count
  final AssetsAudioPlayer _audioPlayer = AssetsAudioPlayer();

  void _playSound() async {
    await _audioPlayer.open(
      Audio('assets/animations/Tap.mp3'), // Use the correct case
      autoStart: true,
    );
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HOME SCREEN'),
        backgroundColor: Colors.yellowAccent,
      ),
      body: Stack(
        children: <Widget>[
          Image.asset(
            'assets/animations/homescreen.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            color: Colors.yellow.withOpacity(0.5), // Optional overlay for better contrast
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Lottie.asset('assets/animations/cell.json', width: 250, height: 250),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    ),
                    onPressed: () {
                      _playSound();
                      // Add your desired action for the Begin button here.
                    },
                    child: Text(
                      'BEGIN',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 20,
            right: 20,
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'Cell Count: $cellCount',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}