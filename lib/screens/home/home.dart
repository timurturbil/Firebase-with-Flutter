import 'package:firebasee/models/Brew.dart';
import 'package:firebasee/screens/home/brew_list.dart';
import 'package:firebasee/screens/home/drop_down.dart';
import 'package:firebasee/services/auth.dart';
import 'package:firebasee/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthServices _auth = AuthServices();

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return SingleChildScrollView(
                          reverse: true,
                          child: Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
                child: SettingsForm(),
              ),
            );
          });
    }

    return Container(
      child: StreamProvider<List<Brews>>.value(
        value: DataBaseService().brews,
        child: Scaffold(
          backgroundColor: Colors.brown[50],
          appBar: AppBar(
            title: Text('Brew Crew'),
            backgroundColor: Colors.brown[400],
            elevation: 0.0,
            actions: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.person),
                label: Text('logout'),
                onPressed: () async {
                  await _auth.signOutt();
                },
              ),
              FlatButton.icon(
                icon: Icon(Icons.settings),
                label: Text('settings'),
                onPressed: () => _showSettingsPanel(),
              ),
            ],
          ),
          body: BrewList(),
        ),
      ),
    );
  }
}
