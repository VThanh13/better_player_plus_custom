import 'package:better_player_plus/better_player_plus.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter/services.dart';

class TestLivePlayerPage extends StatefulWidget {
  const TestLivePlayerPage({super.key});

  @override
  State<TestLivePlayerPage> createState() => _TestLivePlayerPageState();
}

class _TestLivePlayerPageState extends State<TestLivePlayerPage> {
  late BetterPlayerController _betterPlayerController;
  late BetterPlayerDataSource _betterPlayerDataSource;

  @override
  void initState() {
    const BetterPlayerConfiguration betterPlayerConfiguration = BetterPlayerConfiguration(
      autoPlay: true,
      autoDispose: true,
      fit: BoxFit.fill,
      allowedScreenSleep: false,
      aspectRatio: 16 / 9,
      fullScreenAspectRatio: 16 / 9,
      autoDetectFullscreenDeviceOrientation: false,
      autoDetectFullscreenAspectRatio: true,
      deviceOrientationsOnFullScreen: [
        DeviceOrientation.portraitUp,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ],
      deviceOrientationsAfterFullScreen: [DeviceOrientation.portraitUp],
      handleLifecycle: false,
      controlsConfiguration: BetterPlayerControlsConfiguration(
        showControls: true,
        showControlsOnInitialize: true,
        enablePlaybackSpeed: false,
        enableQualities: true,
        enableSkips: false,
        enableProgressBar: false,
        enableProgressText: false,
        controlBarColor: Color.fromARGB(105, 0, 0, 0),
      ),
    );
    _betterPlayerDataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      "https://streamvm350.vietmap.io/live/862798050405402/hls.m3u8",
      liveStream: true,
      videoFormat: BetterPlayerVideoFormat.hls,
    );
    _betterPlayerController = BetterPlayerController(betterPlayerConfiguration);
    _betterPlayerController.setupDataSource(_betterPlayerDataSource);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Test Live player page')),
    body: Column(
      children: [
        const SizedBox(height: 8),
        AspectRatio(
          aspectRatio: 16 / 9,
          child: BetterPlayer(controller: _betterPlayerController),
        ),
      ],
    ),
  );
}
