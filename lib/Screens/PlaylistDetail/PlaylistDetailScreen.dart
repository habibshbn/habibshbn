import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/Constants.dart';
import 'package:spotify/Screens/Home/MusicSheet/MusicSheet.dart';
import 'package:spotify/models/playlist_model.dart';
import 'package:spotify/models/song_model.dart';
import 'package:spotify/widgets/SongItem.dart';
import 'package:spotify/widgets/Button.dart';

class PlaylistDetailScreen extends StatelessWidget {
  PlaylistDetailScreen({Key key, this.data}) : super(key: key);
  final Playlist data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlackColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment(0.0, 0.2),
              colors: [
                const Color(0xFF4A7BA1),
                const Color.fromRGBO(158, 196, 209, 0),
              ],
            ),
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  PlaylistDetailHeader(),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: kSpacingUnit * 5),
                          PlaylistDetailCoverImageSection(data: data),
                          SizedBox(height: kSpacingUnit * 2),
                          PlaylistDetailSongs(playlist: data, data: data.songs),
                          SizedBox(height: kSpacingUnit * 17),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              MusicSheet(),
            ],
          ),
        ),
      ),
    );
  }
}

class PlaylistDetailHeader extends StatelessWidget {
  const PlaylistDetailHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(kSpacingUnit * 2),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: SvgPicture.asset(
              'assets/icons/arrow_left.svg',
              height: 20.sp,
              width: 20.sp,
            ),
          ),
          const Spacer(),
          SvgPicture.asset(
            'assets/icons/heart.svg',
            height: 20.sp,
            width: 20.sp,
          ),
          SizedBox(width: kSpacingUnit * 2),
          SvgPicture.asset(
            'assets/icons/actions.svg',
            height: 20.sp,
            width: 20.sp,
          ),
        ],
      ),
    );
  }
}

class PlaylistDetailCoverImageSection extends StatelessWidget {
  PlaylistDetailCoverImageSection({Key key, this.data}) : super(key: key);
  final Playlist data;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          data.image,
          height: kSpacingUnit * 22,
          width: kSpacingUnit * 22,
        ),
        SizedBox(height: kSpacingUnit * 3),
        Text(
          data.title,
          style: kHeadingTextStyle,
        ),
        SizedBox(height: kSpacingUnit),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'BY SPOTIFY',
              style: kCaptionTextStyle.copyWith(
                color: kTextColor,
              ),
            ),
            SizedBox(width: kSpacingUnit * 0.5),
            SvgPicture.asset(
              'assets/icons/dot.svg',
              height: 3.sp,
              width: 3.sp,
            ),
            SizedBox(width: kSpacingUnit * 0.5),
            Text(
              '${data.likes} LIKES',
              style: kCaptionTextStyle.copyWith(
                color: kTextColor,
              ),
            ),
          ],
        ),
        SizedBox(height: kSpacingUnit),
        Button(title: 'PLAY'),
      ],
    );
  }
}

class PlaylistDetailSongs extends StatelessWidget {
  PlaylistDetailSongs({Key key, @required this.playlist, @required this.data})
      : super(key: key);

  final Playlist playlist;

  final List<Song> data;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: data
          .map((song) => SongItem(
                playlist: playlist,
                data: song,
              ))
          .toList(),
    );
  }
}
