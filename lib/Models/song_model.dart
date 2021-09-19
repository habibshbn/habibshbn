import 'package:spotify/models/ArtistModel.dart';

class Song {
  final String title;
  final String image;
  final List<Artist> artists;
  final bool active;

  Song({this.title, this.image, this.artists, this.active = false});
}
