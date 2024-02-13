import 'package:flutter/cupertino.dart';

class Song {
  final String songName;
  final String artistName;
  final String albulmArtImagePath;
  final String audioPath;

  Song({
    required this.songName,
    required this.artistName,
    required this.albulmArtImagePath,
    required this.audioPath,
  });
}
