
import 'package:flutter/material.dart';
import 'package:music/components/my_drawer.dart';
import 'package:music/models/playlist_provider.dart';
import 'package:music/models/song.dart';
import 'package:music/pages/song_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //get the playlist provider 
  late final dynamic playlistProvider;
  @override
  void initState() {
    
    super.initState();
    playlistProvider = Provider.of<PlayListProvider>(context, listen: false);
  
    
  }
  void goToSong(int songIndex){
    //update current song index 
    playlistProvider.currentSongIndex = songIndex;

    //navigate to song page 
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context) => SongPage(), 
        ),
      );
    
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text("P L A Y L I S T"),
      ),
      drawer: const MyDrawer(),
      body: Consumer<PlayListProvider>(
        builder: (context, playlistProvider, child) {
          final List<Song> playlist = playlistProvider.playlist;
          return ListView.builder(
            itemCount: playlist.length,
            itemBuilder: (context, index) {
              final Song song = playlist[index];
              return ListTile(
                title: Text(song.songName),
                subtitle: Text(song.artistName),
                leading: Image.asset(song.albulmArtImagePath),
                onTap: () {
                  // You can access the provider instance directly here
                  playlistProvider.currentSongIndex = index;
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SongPage()),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

