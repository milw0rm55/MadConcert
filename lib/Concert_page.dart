import 'package:flutter/material.dart';
import 'package:spotify/spotify_io.dart';
class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
 static var credentials = new SpotifyApiCredentials("dd2dc7d7347449a2a3b56fe3b0c09d1c", "a16e2ee4f3ba4e4b8bf345a323458e67");
 static var spotify = new SpotifyApi(credentials);
 static var artist = spotify.artists.get('0OdUWJ0sBjDrqHygGUXeCF');
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Second Screen"),),
        body: ListView.builder(itemBuilder: (context, position){
          return ListTile(
            leading: Icon(Icons.account_circle),
            title: Text("Element $position"),
            subtitle: Text("Subtitle $position"),
            onTap: (){
            },
          );
        },
          itemCount: 20,
          reverse: true,)
    );
  }
}