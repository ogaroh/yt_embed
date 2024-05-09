import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:yt_test/l10n/l10n.dart';

class YTEmbedPage extends StatefulWidget {
  const YTEmbedPage({super.key});

  @override
  State<YTEmbedPage> createState() => _YTEmbedPageState();
}

class _YTEmbedPageState extends State<YTEmbedPage> {
  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'z-3GSbW5w2k',
  );
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.ytEmbedAppBarTitle)),
      body: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.amber,
        progressColors: const ProgressBarColors(
          playedColor: Colors.amber,
          handleColor: Colors.amberAccent,
        ),
        onReady: () {
          _controller.addListener( () {
            log('YouTube Video Listener');
          });
        },
      ),
    );
  }
}
