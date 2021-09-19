import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/Constants.dart';
import 'package:spotify/Screens/SongDetail/SongDetailScreen.dart';
import 'package:spotify/helpers/page_routes.dart';
import 'package:spotify/models/playlist_model.dart';
import 'package:spotify/models/song_model.dart';

class SongItem extends StatelessWidget {
  SongItem({Key key, @required this.playlist, @required this.data})
      : super(key: key);
  final Playlist playlist;

  final Song data;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        final route = SharedAxisPageRoute(
          page: SongDetailScreen(
            playlist: playlist,
            data: data,
            issheet: false,
          ),
        );

        Navigator.of(context).push(route);
      },
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          horizontal: kSpacingUnit * 2,
          vertical: kSpacingUnit,
        ),
        child: Row(
          children: [
            Image.asset(
              data.image,
              height: kSpacingUnit * 5,
              width: kSpacingUnit * 5,
            ),
            SizedBox(width: kSpacingUnit),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.title,
                    overflow: TextOverflow.ellipsis,
                    style: kBodyTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      color: data.active ? kGreenColor : kTextColor,
                    ),
                  ),
                  Text(
                    data.artists.map((a) => a.name).join(', '),
                    overflow: TextOverflow.ellipsis,
                    style: kCaptionTextStyle,
                  ),
                ],
              ),
            ),
            // SizedBox(width: kSpacingUnit * 2),
            SvgPicture.asset(
              'assets/icons/heart.svg',
              height: 20.sp,
              width: 20.sp,
            ),
            SizedBox(width: kSpacingUnit),

            SvgPicture.asset(
              'assets/icons/minus_circle.svg',
              height: 20.sp,
              width: 20.sp,
            ),
            SizedBox(width: kSpacingUnit),

            SvgPicture.asset(
              'assets/icons/actions.svg',
              height: 20.sp,
              width: 20.sp,
            ),
          ],
        ),
      ),
    );
  }
}
