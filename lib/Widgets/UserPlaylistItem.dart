import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify/Constants.dart';
import 'package:spotify/Screens/PlaylistDetail/PlaylistDetailScreen.dart';
import 'package:spotify/helpers/page_routes.dart';
import 'package:spotify/models/playlist_model.dart';
import 'package:spotify/widgets/ShuffleButton.dart';

class UserPlaylistItem extends StatelessWidget {
  UserPlaylistItem({Key key, this.data}) : super(key: key);
  final Playlist data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final route = SharedAxisPageRoute(
          page: PlaylistDetailScreen(data: data),
        );

        Navigator.of(context).push(route);
      },
      child: Container(
        margin: EdgeInsets.all(kSpacingUnit * 0.5),
        height: kSpacingUnit * 6,
        width: double.infinity,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4.w),
          child: Container(
            decoration: BoxDecoration(
              color: kDarkGreyColor,
            ),
            child: Row(
              children: [
                Image.asset(
                  data.image,
                  height: kSpacingUnit * 6,
                  width: kSpacingUnit * 6,
                ),
                SizedBox(width: kSpacingUnit),
                Expanded(
                  child: Text(
                    data.title,
                    style: kSubTitleTextStyle,
                    softWrap: true,
                  ),
                ),
                SizedBox(width: kSpacingUnit),
                if (data.shuffle) ...[
                  ShuffleButton(),
                  SizedBox(width: kSpacingUnit),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}
