import 'package:flutter/material.dart';
import 'package:spotify/Constants.dart';
import 'package:spotify/models/playlist_model.dart';
import 'package:spotify/widgets/PlaylistItem.dart';

class PlaylistSection extends StatelessWidget {
  PlaylistSection({Key key, @required this.title, @required this.playlists})
      : super(key: key);

  final String title;

  final List<Playlist> playlists;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: kSpacingUnit * 2),
          child: Text(title, style: kHeadingTextStyle),
        ),
        SizedBox(height: kSpacingUnit * 2),
        Container(
          height: kSpacingUnit * 18,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: playlists.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(
                  left: index == 0 ? kSpacingUnit * 2 : kSpacingUnit,
                  right: index == playlists.length - 1
                      ? kSpacingUnit * 2
                      : kSpacingUnit,
                ),
                child: PlaylistItem(data: playlists[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}
