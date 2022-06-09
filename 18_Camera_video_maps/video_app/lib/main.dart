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
  double _value = 0.0;
  int position = 0;
  @override
  void initState() {
    super.initState();
    //_videoPlayerController = VideoPlayerController.asset('assets/01.mp4');
    _videoPlayerController = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4');

    _videoPlayerController.addListener(() {
      setState(() {
        position = _videoPlayerController.value.position.inMilliseconds;
        _value = double.parse(position.toString());
        print('Позиция ${_value.round().toString()}');
      });
    });

    //_videoPlayerController.setLooping(true);
    _videoPlayerController.initialize().then((value) => setState(() {}));
    //_videoPlayerController.play();
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
  }

  String convertMillis(int millis) {
    double sec = (millis / 1000) % 60;
    String seconds = sec < 10 ? '0${sec.round()}' : sec.round().toString();
    double min = (millis / (1000 * 60)) % 60;
    String minutes = min < 10 ? '0${min.round()}' : min.round().toString();
    String str = '$minutes:$seconds';
    return str;
  }

  @override
  Widget build(BuildContext context) {
    Widget videoPlayer(VideoPlayerController _videoPlayerController) {
      return Stack(
        children: [
          GestureDetector(
              onTap: () {
                _videoPlayerController.value.isPlaying
                    ? _videoPlayerController.pause()
                    : _videoPlayerController.play();
              },
              child: VideoPlayer(_videoPlayerController)),
          Align(
            alignment: Alignment.center,
            child: _videoPlayerController.value.isPlaying
                ? const SizedBox() //Icon(Icons.pause)
                : IconButton(
                    icon: const Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 40,
                    ),
                    onPressed: () => _videoPlayerController.play(),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.black.withOpacity(0.3),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.replay_10, color: Colors.white),
                      onPressed: () => _videoPlayerController.seekTo(
                          Duration(milliseconds: position.round() - 10000)),
                    ),
                    _videoPlayerController.value.isPlaying
                        ? IconButton(
                            icon: const Icon(Icons.pause, color: Colors.white),
                            onPressed: () => _videoPlayerController.pause(),
                          )
                        : IconButton(
                            icon: const Icon(Icons.play_arrow,
                                color: Colors.white),
                            onPressed: () => _videoPlayerController.play(),
                          ),
                    IconButton(
                      icon: const Icon(Icons.forward_10, color: Colors.white),
                      onPressed: () => _videoPlayerController.seekTo(
                          Duration(milliseconds: position.round() + 10000)),
                    ),
                    Text(
                      convertMillis(
                          _videoPlayerController.value.position.inMilliseconds),
                      style: const TextStyle(fontSize: 10, color: Colors.white),
                    ),
                    Expanded(
                      child: Slider(
                        autofocus: true,
                        min: 0.0,
                        max: double.parse(_videoPlayerController
                            .value.duration.inMilliseconds
                            .toString()),
                        inactiveColor: Colors.blue.withOpacity(0.3),
                        value: _value,
                        onChanged: (value) {
                          setState(() {
                            _value = value;

                            //_videoPlayerController.setVolume(volume) = 6;
                            _videoPlayerController
                                .seekTo(Duration(milliseconds: value.round()));
                          });
                        },
                      ),
                    ),
                    Text(
                      convertMillis(_videoPlayerController
                          .value.duration.inMilliseconds) /*.substring(0, 2)*/,
                      style: const TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    }

    return LayoutBuilder(
      builder: ((context, constraints) {
        if (constraints.maxWidth < 400) {
          return Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
            ),
            body: SizedBox(
                height: 200, child: videoPlayer(_videoPlayerController)),
          );
        } else {
          return Scaffold(
            body: videoPlayer(_videoPlayerController),
          );
        }
        // return const SizedBox();
      }),
    );
  }
}
