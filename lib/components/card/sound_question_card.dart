import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

Expanded soundQuestionCard(BuildContext context, {required String sound}) {
  final player = AudioCache();
  player.play(sound);

  return Expanded(
    child: Container(
        margin: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 40.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.0)
        ),
        width: MediaQuery.of(context).size.width - 40,
        child: ElevatedButton(
          child: const Icon(Icons.volume_up, color: Colors.white, size: 80),
            onPressed: () { player.play(sound); },
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(100, 100),
              shape: const CircleBorder(),
              primary: const Color(0xFF8ab23b),
          ),
      ),
    ),
  );
}
