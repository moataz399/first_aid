
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class VideoBubble extends StatefulWidget {
  final String url;
  VideoBubble({required this.url});
  @override
  _VideoBubbleState createState() => _VideoBubbleState();
}

class _VideoBubbleState extends State<VideoBubble>  {


  VideoPlayerController? _controller;
  FlickManager? flickManager;

  @override
  void initState() {

    _controller = (VideoPlayerController.network(widget.url))
      ..initialize().then((_) {
        if(this.mounted)
          setState(() {});
        flickManager = FlickManager(
          videoPlayerController: _controller!,
          autoPlay: false,
          autoInitialize: true,
        );
      });
    super.initState();
  }

  @override
  void dispose() {
    flickManager?.dispose();
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: _controller != null && flickManager != null && _controller!.value.isInitialized ? FlickVideoPlayer(
            flickManager: flickManager!,
            preferredDeviceOrientationFullscreen: [
              DeviceOrientation.portraitUp,
            ],
          ) : null,
        ),
        if(_controller == null || flickManager == null || !_controller!.value.isInitialized && !_controller!.value.hasError)
          const Positioned(
            top: 0,left: 0,
            bottom: 0,right: 0,
            child: CupertinoActivityIndicator(),
          ),
      ],
    );
  }

}