import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:music/models/song.dart';

class PlayListProvider extends ChangeNotifier {
  //playlists of songs

  final List<Song> _playList = [
    //song 1
    Song(
      songName: "killbill",
      artistName: "SZA",
      albulmArtImagePath: "assets/images/album3.jpg",
      audioPath: "audio/killbill.mp3",
    ),

    //song 2
    Song(
      songName: "Never Broke",
      artistName: "Nba Yongboy",
      albulmArtImagePath: "assets/images/album.jpg",
      audioPath: "audio/youngboy.mp3",
    ),

    //song 3
    Song(
      songName: "One of the girls",
      artistName: "The weekend",
      albulmArtImagePath: "assets/images/album2.jpg",
      audioPath: "audio/the weekend.mp3",
    ),
  ];

  //current song playing index
  int? _currentSongIndex;

  /*
     A U D I O P L A Y E R 



  */

  // audio player
  final AudioPlayer _audioPlayer = AudioPlayer();

  // durations
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  // constructor
  PlayListProvider() {
    ListenToDuration();
  }

  // initially not playing
  bool _isPlaying = false;

  // play the song
  void play() async {
    final String path = _playList[currentSongIndex!].audioPath;
    await _audioPlayer.stop(); // stop current song
    await _audioPlayer.play(AssetSource(path)); // play the new song
    _isPlaying = true;
    notifyListeners();
  }

  // pause current song
  void pause() async {
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  // resume playing
  void resume() async {
    await _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

  // pause or resume
  void pauseorResume() async {
    if (_isPlaying) {
      pause();
    } else {
      resume();
    }
    notifyListeners();
  }

  // seek to a specific position in the current song
  void seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

  // play next song
  void playNextSong() {
    if (_currentSongIndex != null) {
      if (currentSongIndex! < playlist.length - 1) {
        //got to the next song if it's not the last song
        currentSongIndex = _currentSongIndex! + 1;
      } else {
        //if it's the last song. loop back to the first
        currentSongIndex = 0;
      }
    }
  }

  // play previous song
  void playPreviousSong() async {
    //if more than two seconds have passed restart the current song
    if (_currentDuration.inSeconds > 2) {
    }
    // if it is within first 2 seconds of the song, go to the previous song
    else {
      if (currentSongIndex! > 0) {
        currentSongIndex = _currentSongIndex! + 1;
      } else {
        //if it is the first song , loop back to last song
        currentSongIndex = _playList.length - 1;
      }
    }
  }

  // listen to durations
  void ListenToDuration() {
    // listen for total duration
    _audioPlayer.onDurationChanged.listen((newDuration) {
      _currentDuration = newDuration;
      notifyListeners();
    });

    // listen for current duration
    _audioPlayer.onPositionChanged.listen((newPosition) {
      _currentDuration = newPosition;
      notifyListeners();
    });

    //listen for song completion
    _audioPlayer.onPlayerComplete.listen((event) {
      playNextSong();
    });
  }

  // dispose audio player

  /*

   G E T T E R S
  

  */

  List<Song> get playlist => _playList;
  int? get currentSongIndex => _currentSongIndex;
  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _currentDuration;

  /*
    
    S E T T E R S 

  */
  set currentSongIndex(int? newIndex) {
    //update current song index
    _currentSongIndex = newIndex;
    if(newIndex != null){
      play();
    }

    //update the UI
    notifyListeners();
  }
}
