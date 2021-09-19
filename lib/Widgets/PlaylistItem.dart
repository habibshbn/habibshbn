import 'package:flutter/material.dart';
import 'package:spotify/Constants.dart';
import 'package:spotify/Screens/PlaylistDetail/PlaylistDetailScreen.dart';
import 'package:spotify/helpers/page_routes.dart';
import 'package:spotify/models/playlist_model.dart';
import 'package:spotify/widgets/ShuffleButton.dart';

class PlaylistItem extends StatelessWidget {
  PlaylistItem({Key key, @required this.data}) : super(key: key);
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            data.image,
            height: kSpacingUnit * 15,
            width: kSpacingUnit * 15,
          ),
          SizedBox(height: kSpacingUnit),
          Row(
            children: [
              if (data.shuffle) ...[
                ShuffleButton(),
                SizedBox(width: kSpacingUnit * 0.5),
              ],
              Text(data.title, style: kSubTitleTextStyle),
            ],
          ),
        ],
      ),
    );
  }
}
