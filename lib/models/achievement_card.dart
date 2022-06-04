import 'achievement_type.dart';

class Achievement {
  final String name;
  final int id, reward;
  final bool isAchieved, isCollected;
  final AchievementType achievementType;
  final int conditionNumber;

  Achievement(this.id, this.name, this.reward, this.isAchieved, this.isCollected, this.achievementType, this.conditionNumber);
}
