import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:yaru/yaru.dart' as yaru;
import 'package:audioplayers/audioplayers.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.themeChanged}) : super(key: key);

  final void Function(String themeName) themeChanged;

  @override
  // ignore: no_logic_in_create_state
  _HomePageState createState() => _HomePageState(themeChanged);
}

class _HomePageState extends State<HomePage> {
  _HomePageState(this.themeChanged);

  var themeName = 'Yaru-light';
  final void Function(String themeName) themeChanged;

  void playSound(int soundNumber) {
    final player = AudioCache();
    player.play('algo$soundNumber.mp3');
}

  Expanded buildKey({String? text, int? soundNumber}) {
    return Expanded(
      child: TextButton(
        child: Text(text!, style: Theme.of(context).textTheme.bodyText1),
        onPressed: () {
          playSound(soundNumber!);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Algorithm'),
          centerTitle: true,
          leading: TextButton(
            child: Icon(themeName.contains('-light')
                ? Icons.dark_mode
                : Icons.light_mode),
            onPressed: () => {
              setState(() {
                if (themeName.contains('-light')) {
                  themeName = 'Yaru-dark';
                } else if (themeName.contains('-dark')) {
                  themeName = 'Yaru-light';
                }
                themeChanged(themeName);
              })
            },
          ),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildKey(text: 'Comb', soundNumber: 1),
              buildKey(text: 'Cocktail', soundNumber: 2),
              buildKey(text: 'Bubble', soundNumber: 3),
              buildKey(text: 'Bogo', soundNumber: 4),
              buildKey(text: 'Quick', soundNumber: 5),
              buildKey(text: 'Oddeven', soundNumber: 6),
              buildKey(text: 'Insert', soundNumber: 7),
              buildKey(text: 'Heap', soundNumber: 8),
              buildKey(text: 'Selection', soundNumber: 9),
            ],
          ),
        ));
  }
}

@override
Widget build(BuildContext context) {
  // TODO: implement build
  throw UnimplementedError();
}
