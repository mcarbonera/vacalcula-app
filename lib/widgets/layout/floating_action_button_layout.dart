import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FloatingActionButtonLayout extends StatefulWidget {
  const FloatingActionButtonLayout({super.key});
  
  @override
  State<StatefulWidget> createState() => _FloatingActionButtonLayout();
}

class _FloatingActionButtonLayout extends State<FloatingActionButtonLayout> {
  static const platform = MethodChannel('samples.flutter.dev/playMp3');

  Future<void> playMuuOnButtonPress() async {
    try {
      await platform.invokeMethod<int>('playMuuOnButtonPress');
    } on PlatformException catch(e) {
      // deu ruim
    }
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      child: Container(
        padding: const EdgeInsets.only(right: 5),
        child: Icon(
          FontAwesomeIcons.cloudArrowUp,
          color: Theme.of(context).colorScheme.primary,
          size: 23.0
        ),
      ),
      onPressed: () {playMuuOnButtonPress();}
    );
  }
}