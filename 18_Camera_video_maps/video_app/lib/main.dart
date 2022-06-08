import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late VideoPlayerController _videoPlayerController;
  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset('assets/01.mp4');
    // _videoPlayerController = VideoPlayerController.network(
    //     'https://www.youtube.com/watch?v=JRuTofOvhiE' /*, closedCaptionFile: _loadCaptions()*/);

    _videoPlayerController.addListener(() {
      setState(() {});
    });
    _videoPlayerController.setLooping(true);
    _videoPlayerController.initialize().then((value) => setState(() {}));
    _videoPlayerController.play();
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: LayoutBuilder(
        builder: ((context, constraints) {
          return SizedBox(
              height: 200,
              child: Stack(
                children: [
                  VideoPlayer(_videoPlayerController),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: VideoProgressIndicator(
                      _videoPlayerController,
                      allowScrubbing: false,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      bottom: 16,
                    ),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white.withOpacity(0.5),
                        ),
                        child: Row(mainAxisSize: MainAxisSize.min, children: [
                          IconButton(
                            onPressed: () {
                              _videoPlayerController.pause();
                            },
                            icon: const Icon(Icons.pause),
                          ),
                          IconButton(
                            onPressed: () {
                              _videoPlayerController.play();
                            },
                            icon: const Icon(Icons.play_arrow),
                          ),
                        ]),
                      ),
                    ),
                  ),
                ],
              ));
        }),
      ),
    );
  }
}
