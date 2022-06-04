import 'package:flutter/material.dart';
import 'package:tune_hop_app/models/game_card.dart';

SizedBox gameCard(BuildContext context, {required GameCard gameCard, required int highScore}) {
  return SizedBox(
      height: double.infinity,
      width: MediaQuery.of(context).size.width / 2 - 20,
      child: InkWell(
        onTap: () => {
          Navigator.pushNamed(context, '/difficulty',
              arguments: gameCard.gameType.name)
        },
        child: Container(
          height: double.infinity,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 7,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      gameCard.picturePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 1.0),
                      child: Text(gameCard.name,
                          style: const TextStyle(
                            fontFamily: "Open Sans",
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 4.0),
                      child: Row(mainAxisSize: MainAxisSize.min, children: [
                        const Icon(
                          Icons.diamond_outlined,
                          size: 16.0,
                        ),
                        Text(highScore.toString(),
                            style: const TextStyle(
                              fontFamily: "Open Sans",
                              fontSize: 16.0,
                            )),
                      ])),
                  ]),
              )
            ],
          ),
        ),
      ));
}
