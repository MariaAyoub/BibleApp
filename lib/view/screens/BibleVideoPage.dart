import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class BibleVideoPage extends StatefulWidget {
  final String videoUrl;
  final String title;

  BibleVideoPage({required this.videoUrl, required this.title});

  @override
  _BibleVideoPageState createState() => _BibleVideoPageState();
}

class _BibleVideoPageState extends State<BibleVideoPage> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    // Initialize the controller
    _controller = VideoPlayerController.network(widget.videoUrl);
    _initializeVideoPlayerFuture = _controller.initialize();

    // Optionally, set the video to loop
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    // Dispose the controller when the widget is disposed
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: FutureBuilder<void>(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: VideoPlayer(_controller),
                ),
                VideoProgressIndicator(
                  _controller,
                  allowScrubbing: true,
                ),
                SizedBox(height: 20),
                IconButton(
                  icon: Icon(
                    _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                    size: 40,
                  ),
                  onPressed: () {
                    setState(() {
                      _controller.value.isPlaying ? _controller.pause() : _controller.play();
                    });
                  },
                ),
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
