import 'achievement_type.dart';

class AchievementExpanded {
  final String uid, name;
  final int id, reward;
  final bool isAchieved, isCollected;
  final AchievementType achievementType;
  final int conditionNumber;

  AchievementExpanded(this.uid, this.id, this.name, this.reward, this.isAchieved, this.isCollected, this.achievementType, this.conditionNumber);
}
