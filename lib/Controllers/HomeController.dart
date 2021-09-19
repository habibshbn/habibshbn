import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var currentIndex = 0.obs;
  var playing = false.obs;
  Rx<IconData> playBtn = Icons.play_arrow.obs;
  AudioPlayer advancedPlayer;
  AudioCache audioCache;
  var playingNavigationheight = 90.0.obs;
  Rx<Duration> position = Duration(seconds: 0).obs;
  Rx<Duration> musicLength = Duration(seconds: 115).obs;
  var scrollController = ScrollController().obs;

  void seekToSec(int sec) {
    Duration newPos = Duration(seconds: sec);
    print('$sec');
    advancedPlayer.seek(newPos);
  }

  onTabChanged(int index) {
    currentIndex.value = index;
  }

  void onScrollMethod() {
    scrollController.value.addListener(
      () async {
        if (scrollController.value.position.maxScrollExtent ==
            scrollController.value.position.pixels) {
          print('hgabib');
        }
      },
    );
  }

// player.onDurationChanged.listen((Duration d) {
//     print('Max duration: $d');
//     setState(() => duration = d);
//   });

  play() {
    audioCache.play("memories.mp3");
  }

  @override
  void onInit() {
    onScrollMethod();

    advancedPlayer = AudioPlayer();
    audioCache = AudioCache(fixedPlayer: advancedPlayer);
    advancedPlayer.onDurationChanged.listen((Duration d) {
      print('Max duration: $d');
      musicLength.value = d;
    });

    advancedPlayer.onAudioPositionChanged.listen((Duration p) {
      position.value = p;
    });

    super.onInit();
  }

  @override
  void dispose() {
    scrollController.value.dispose();
    super.dispose();
  }
}
