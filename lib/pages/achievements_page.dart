import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tune_hop_app/models/achievement_card.dart';

import '../components/card/achievement_card.dart';

class AchievementsPage extends StatefulWidget {
  const AchievementsPage({Key? key}) : super(key: key);

  @override
  State<AchievementsPage> createState() => _AchievementsPageState();
}

class _AchievementsPageState extends State<AchievementsPage> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> achievements = [];

    final tuneHopUser = Provider.of<List<Achievement>>(context);
    for (var element in tuneHopUser) {
      achievements.add(AchievementCard(achievement: element));
    }

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: achievements,
      ),
    );
  }
}
