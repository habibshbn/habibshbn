import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:spotify/Controllers/HomeController.dart';
import 'package:spotify/Constants.dart';
import 'package:spotify/Widgets/PlaylistSection.dart';
import 'package:spotify/Widgets/UserPlaylistItem.dart';
import 'package:spotify/data/playlists.dart';
import 'package:spotify/models/playlist_model.dart';

import 'MusicSheet/MusicSheet.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key key}) : super(key: key);
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(414, 896), allowFontScaling: true);
    homeController.playingNavigationheight.value = (kSpacingUnit * 7);
    return Scaffold(
      backgroundColor: kBlackColor,
      bottomNavigationBar: Obx(
        () => Theme(
          data: Theme.of(context).copyWith(
            // sets the background color of the `BottomNavigationBar`
            canvasColor: kBottomNavColor,
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: 0.0,
            currentIndex: homeController.currentIndex.value,
            onTap: (int index) {
              homeController.onTabChanged(index);
            },
            backgroundColor: kBottomNavColor,
            selectedItemColor: kTextColor,
            unselectedItemColor: kSecondaryTextColor,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/home.svg',
                  height: 20.sp,
                  width: 20.sp,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/search.svg',
                  height: 20.sp,
                  width: 20.sp,
                ),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/library.svg',
                  height: 20.sp,
                  width: 20.sp,
                ),
                label: 'Library',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/spotify.svg',
                  height: 20.sp,
                  width: 20.sp,
                ),
                label: 'Premium',
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(0.0, -0.5),
              colors: [
                const Color.fromRGBO(235, 238, 227, 0.3),
                const Color.fromRGBO(255, 255, 255, 0),
              ],
            ),
          ),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: kSpacingUnit * 2),
                    Container(
                      margin: EdgeInsets.only(right: kSpacingUnit * 2),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: SvgPicture.asset(
                          'assets/icons/gear.svg',
                          height: 24.sp,
                          width: 24.sp,
                        ),
                      ),
                    ),
                    HomePreferredPlaylistSection(),
                    PlaylistSection(
                      title: 'Recenty Played',
                      playlists: recentlyPlayed,
                    ),
                    SizedBox(height: kSpacingUnit * 5),
                    PlaylistSection(
                      title: 'Jump back in',
                      playlists: jumpBackIn,
                    ),
                    SizedBox(height: kSpacingUnit * 17),
                  ],
                ),
              ),
              MusicSheet(),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePreferredPlaylistSection extends StatelessWidget {
  const HomePreferredPlaylistSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: kSpacingUnit * 2),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: kSpacingUnit * 2),
          child: Text('Good evening', style: kHeadingTextStyle),
        ),
        SizedBox(height: kSpacingUnit * 1.5),
        Container(
          margin: EdgeInsets.symmetric(horizontal: kSpacingUnit * 1.5),
          child: Row(
            children: [
              HomeUserPlaylist(playlist: userLeftPlaylistData),
              HomeUserPlaylist(playlist: userRightPlaylistData),
            ],
          ),
        ),
        SizedBox(height: kSpacingUnit * 4.5),
      ],
    );
  }
}

class HomeUserPlaylist extends StatelessWidget {
  HomeUserPlaylist({Key key, @required this.playlist}) : super(key: key);
  final List<Playlist> playlist;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: playlist.map((item) => UserPlaylistItem(data: item)).toList(),
      ),
    );
  }
}
