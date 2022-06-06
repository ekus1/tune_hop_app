import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tune_hop_app/models/achievement_card.dart';

import '../../models/user.dart';
import '../../services/auth.dart';
import '../../services/database.dart';

class AchievementCard extends StatelessWidget {
  const AchievementCard({Key? key, required this.achievement})
      : super(key: key);

  final Achievement achievement;

  @override
  Widget build(BuildContext context) {
    final AuthService _authService = AuthService();
    final DatabaseService _databaseService =
        DatabaseService(_authService.getCurrentUserUid());

    var user = Provider.of<TuneHopUser?>(context);

    Color achievementColor = Colors.grey;
    Color letterColor = Colors.black87;

    if (achievement.isAchieved && achievement.isCollected) {
      achievementColor = Colors.white;
      letterColor = const Color(0xFF548000);
    } else if (achievement.isAchieved) {
      achievementColor = const Color(0xFFE8FFC2);
      letterColor = const Color(0xFF548000);
    } else {
      achievementColor = Colors.grey;
      letterColor = Colors.black87;
    }

    void collect() async {
      await _databaseService.collectAchievement(user!.uid, achievement.id);
      await _databaseService.collectReward(user!.uid, achievement.reward);
    }

    return Container(
      height: MediaQuery.of(context).size.height / 7,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      child: InkWell(
        onTap: () async => {
          if (achievement.isAchieved && !achievement.isCollected) {
              collect()
          }
        },
        child: Container(
          height: double.infinity,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
          decoration: BoxDecoration(
              color: achievementColor,
              borderRadius: BorderRadius.circular(10.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5.0),
                  child: Text(
                    achievement.name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: TextStyle(
                        fontFamily: "Open Sans",
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: letterColor),
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
                child: achievement.isCollected
                    ? (const Icon(Icons.check_circle,
                        size: 24.0, color: Color(0xFF548000)))
                    : (Text(
                        achievement.reward.toString(),
                        style: TextStyle(
                            fontFamily: "Open Sans",
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                            color: letterColor),
                      )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
