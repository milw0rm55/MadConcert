import 'package:flutter/material.dart';
import 'package:mad_concert/Concert_page.dart';
import 'package:mad_concert/Login/auth.dart';

class HomePage extends StatelessWidget {
  HomePage({this.auth, this.onSignOut});
  final BaseAuth auth;
  final VoidCallback onSignOut;

  @override
  Widget build(BuildContext context) {

    void _signOut() async {
      try {
        await auth.signOut();
        onSignOut();
      } catch (e) {
        print(e);
      }

    }

    return new Scaffold(
      appBar: new AppBar(
        actions: <Widget>[
          new FlatButton(
              onPressed: _signOut,
              child: new Text('Logout', style: new TextStyle(fontSize: 17.0, color: Colors.white))
          )
        ],
      ),
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