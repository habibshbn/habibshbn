import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotify/Controllers/HomeController.dart';
import 'package:spotify/Screens/SongDetail/SongDetailScreen.dart';

import 'package:spotify/data/playlists.dart';
import 'package:spotify/widgets/PlayingNavigation.dart';

import '../../../Constants.dart';

class MusicSheet extends StatelessWidget {
  final Color foreGroundColor = Color(0xff354753);
  final GlobalKey expandKey = GlobalKey();
  final HomeController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return NotificationListener<DraggableScrollableNotification>(
      onNotification: (notification) {
        final dragRatio = (notification.extent - notification.minExtent) /
            (notification.maxExtent - notification.minExtent);
        if (dragRatio <= 0.2) {
          homeController.playingNavigationheight.value = (kSpacingUnit * 7);
          return false;
        } else {
          homeController.playingNavigationheight.value = 0.0;

          return true;
        }
      },
      child: DraggableScrollableSheet(
        expand: true,
        initialChildSize: 0.09,
        minChildSize: 0.09,
        maxChildSize: 1.0,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            decoration: BoxDecoration(
              color: Color(0xff242A33),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8), topRight: Radius.circular(8)),
            ),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  PlayingNavigation(
                    currentSong: defaultSong,
                  ),
                  Container(
                    height: Get.height * 0.87,
                    child: SongDetailScreen(
                      data: defaultSong,
                      playlist: userLeftPlaylistData.first,
                      issheet: true,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
