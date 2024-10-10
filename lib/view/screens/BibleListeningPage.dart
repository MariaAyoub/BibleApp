import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audioplayers.dart' as audioplayers;

class BibleListeningPage extends StatefulWidget {
  final String bookName;
  final int chapterNumber;

  BibleListeningPage({required this.bookName, required this.chapterNumber});

  @override
  _BibleListeningPageState createState() => _BibleListeningPageState();
}

class _BibleListeningPageState extends State<BibleListeningPage> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration totalDuration = Duration();
  Duration currentPosition = Duration();

  @override
  void initState() {
    super.initState();
    _audioPlayer.onDurationChanged.listen((duration) {
      setState(() {
        totalDuration = duration;
      });
    });
    _audioPlayer.onPositionChanged.listen((position) {
      setState(() {
        currentPosition = position;
      });
    });
  }

  Future<void> _playAudio() async {
    // Replace with your audio file URL or local asset
    await _audioPlayer.play(UrlSource('https://st-takla.org/Multimedia/audio-bible/www.St-Takla.org--1_1.ogg'));
    setState(() {
      isPlaying = true;
    });
  }

  Future<void> _pauseAudio() async {
    await _audioPlayer.pause();
    setState(() {
      isPlaying = false;
    });
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
        title: Text('${widget.bookName} ${widget.chapterNumber}'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.fullscreen),
            onPressed: () {
              // Action for fullscreen (not implemented here)
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            decoration: BoxDecoration(
              color: Colors.green[300],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Text(
                  widget.bookName,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${widget.chapterNumber}',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 20),
                Icon(
                  Icons.play_arrow,
                  size: 50,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Total Duration: ${totalDuration.inMinutes}:${(totalDuration.inSeconds % 60).toString().padLeft(2, '0')}",
            style: TextStyle(fontSize: 16),
          ),
          Text(
            "Current Position: ${currentPosition.inMinutes}:${(currentPosition.inSeconds % 60).toString().padLeft(2, '0')}",
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.stop),
                onPressed: () {
                  _audioPlayer.stop();
                  setState(() {
                    isPlaying = false;
                  });
                },
              ),
              IconButton(
                icon: isPlaying ? Icon(Icons.pause) : Icon(Icons.play_arrow),
                onPressed: isPlaying ? _pauseAudio : _playAudio,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
