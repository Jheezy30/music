import 'package:flutter/material.dart';
import 'package:music/pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          // we will have the logo of the app
          DrawerHeader(
            child: Center(
              child: Icon(
                Icons.music_note,
                size: 40,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 25 , top: 25),
            child: ListTile(
              title: const Text("H O M E"),
              leading:const Icon(Icons.home),
              onTap: () => Navigator.pop(context),
            ),
          ),

          // the second one is settings
           Padding(
            padding: const EdgeInsets.only(left: 25 , top: 0),
            child: ListTile(
              title: const Text("S E T T I N G S"),
              leading: const Icon(Icons.settings),
              onTap: (){
                //pop drawer 
                Navigator.pop(context);
                //Navigate to the settings page 
                Navigator.push(context,
                 MaterialPageRoute(
                  builder: (context) => SettingsPage(),
                  ),
                );
              },
            ),
          ),

        ],
      ),
    );
  }
}
