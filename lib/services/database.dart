import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tune_hop_app/data/achievement_data.dart';
import 'package:tune_hop_app/models/achievement_card.dart';
import 'package:tune_hop_app/models/achievement_type.dart';
import 'package:tune_hop_app/models/game_card.dart';
import 'package:tune_hop_app/models/game_type.dart';
import 'package:tune_hop_app/models/instrument_card.dart';
import 'package:tune_hop_app/models/instrument_category.dart';
import 'package:tune_hop_app/models/instrument_details.dart';
import 'package:tune_hop_app/models/question_difficulty.dart';
import 'package:tune_hop_app/models/user.dart';

import '../models/achievement_expanded.dart';
import '../models/question.dart';
import '../models/question_type.dart';

class DatabaseService {
  final String? uid;

  DatabaseService(this.uid);

  final CollectionReference questionCollection =
      FirebaseFirestore.instance.collection("questions");

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");

  final CollectionReference instrumentsCollection =
      FirebaseFirestore.instance.collection("instruments");

  final CollectionReference instrumentDetailsCollection =
      FirebaseFirestore.instance.collection("instrumentDetails");

  final CollectionReference gamesCollection =
      FirebaseFirestore.instance.collection("games");

  final CollectionReference achievementsCollection =
      FirebaseFirestore.instance.collection("achievements");

  Future updateUserData(
      String username,
      int guessTheSoundScore,
      int quizScore,
      int diamonds,
      halfAndHalfJockerCount,
      doubleValueJockerCount,
      additionalTimeJockerCount) async {
    return await userCollection.doc(uid).set({
      'uid': uid,
      'username': username,
      'guessTheSoundScore': guessTheSoundScore,
      'quizScore': quizScore,
      'diamonds': diamonds,
      'halfAndHalfJockerCount': halfAndHalfJockerCount,
      'doubleValueJockerCount': doubleValueJockerCount,
      'additionalTimeJockerCount': additionalTimeJockerCount,
      'correctAnswersGuessTheSound': 0,
      'correctAnswersQuiz': 0,
      'gamesPlayed': 0,
      'jokersBought': 0
    }).then((value) {
      achievementData.forEach((element) {
        FirebaseFirestore.instance
            .collection('users/${uid}/achievements')
            .doc()
            .set({
          'id': element.id,
          'name': element.name,
          'reward': element.reward,
          'isAchieved': element.isAchieved,
          'isCollected': element.isCollected,
          'achievementType': element.achievementType.name,
          'conditionNumber': element.conditionNumber
        });
      });
    });
  }

  Stream<List<Achievement>> get achievementCards {
    return FirebaseFirestore.instance
        .collection('users/${uid}/achievements')
        .snapshots()
        .map((event) => _achievementCardListFromSnapshot(event));
  }

  List<Achievement> _achievementCardListFromSnapshot(
      QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;
      return Achievement(
          data["id"] ?? 0,
          data['name'] ?? '',
          data['reward'] ?? 0,
          data['isAchieved'] ?? false,
          data['isCollected'] ?? false,
          getAchievementType(data['achievementType']),
          data['conditionNumber'] ?? 0);
    }).toList();
  }

  Future updateScores(TuneHopUser user, GameType gameType, int score) async {
    await userCollection.doc(uid).get().then((value) {
      Map<String, dynamic> data = value.data()! as Map<String, dynamic>;

      return TuneHopUser(
          data['uid'] ?? '',
          data['guessTheSoundScore'],
          data['quizScore'],
          data['halfAndHalfJockerCount'],
          data['doubleValueJockerCount'],
          data['additionalTimeJockerCount'],
          data['diamonds'],
          data['correctAnswersGuessTheSound'],
          data['correctAnswersQuiz'],
          data['gamesPlayed'],
          data['jokersBought'],
          data['username'] ?? '');
    }).then((value) {
      int newDiamonds = value.diamonds + score;
      int newGuessTheSoundScore =
          gameType == GameType.guessTheSound && score > value.guessTheSoundScore
              ? score
              : value.guessTheSoundScore;
      int newQuizScore = gameType == GameType.quiz && score > value.quizScore
          ? score
          : value.quizScore;

      return userCollection.doc(uid).update({
        'guessTheSoundScore': newGuessTheSoundScore,
        'quizScore': newQuizScore,
        'diamonds': newDiamonds,
      });
    });
  }

  Stream<TuneHopUser?> get userData {
    return userCollection
        .doc(uid)
        .snapshots()
        .map((event) => _tuneHopUserFromSnapshot(event));
  }

  TuneHopUser _tuneHopUserFromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data()! as Map<String, dynamic>;

    return TuneHopUser(
        data['uid'],
        data['guessTheSoundScore'],
        data['quizScore'],
        data['halfAndHalfJockerCount'],
        data['doubleValueJockerCount'],
        data['additionalTimeJockerCount'],
        data['diamonds'],
        data['correctAnswersQuiz'],
        data['correctAnswersGuessTheSound'],
        data['gamesPlayed'],
        data['jokersBought'],
        data['username']);
  }

  Stream<List<Question>> get questions {
    return questionCollection
        .snapshots()
        .map((event) => _questionListFromSnapshot(event));
  }

  List<Question> _questionListFromSnapshot(QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;
      return Question(
          data['question'] ?? '',
          data['answer'] ?? 0,
          List<String>.from(data['options'].map((item) {
            return item;
          })),
          getQuestionType(data['questionType']),
          getQuestionDifficulty(data['questionDifficulty']),
          data['soundPath'] ?? '');
    }).toList();
  }

  Stream<List<InstrumentCard>> get instrumentCards {
    return instrumentsCollection
        .snapshots()
        .map((event) => _instrumentCardListFromSnapshot(event));
  }

  List<InstrumentCard> _instrumentCardListFromSnapshot(
      QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;
      return InstrumentCard(
          data['uid'] ?? '',
          data['name'] ?? '',
          data['picturePath'] ?? '',
          getInstrumentCategory(data['instrumentCategory']));
    }).toList();
  }

  Stream<List<GameCard>> get gameCards {
    return gamesCollection
        .snapshots()
        .map((event) => _gameCardListFromSnapshot(event));
  }

  List<GameCard> _gameCardListFromSnapshot(QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;
      return GameCard(data['name'] ?? '', data['highScore'] ?? 0,
          data['picturePath'] ?? '', getGameType(data['gameType']));
    }).toList();
  }

  Stream<List<InstrumentDetails>> get instrumentDetails {
    return instrumentDetailsCollection
        .snapshots()
        .map((event) => _instrumentDetailsListFromSnapshot(event));
  }

  List<InstrumentDetails> _instrumentDetailsListFromSnapshot(
      QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;
      return InstrumentDetails(
          data['uid'] ?? '',
          data['name'] ?? '',
          data['picturePath'] ?? '',
          getInstrumentCategory(data['instrumentCategory']),
          data['dateInvented'] ?? '',
          data['placeInvented'] ?? '',
          data['history'] ?? '',
          data['funFacts'] ?? '',
          data['audioPath'] ?? '');
    }).toList();
  }

  Future updateGameStats(
      TuneHopUser user, GameType gameType, int correctAnswers) async {
    await userCollection.doc(uid).get().then((value) {
      Map<String, dynamic> data = value.data()! as Map<String, dynamic>;

      return TuneHopUser(
          data['uid'] ?? '',
          data['guessTheSoundScore'],
          data['quizScore'],
          data['halfAndHalfJockerCount'],
          data['doubleValueJockerCount'],
          data['additionalTimeJockerCount'],
          data['diamonds'],
          data['correctAnswersGuessTheSound'],
          data['correctAnswersQuiz'],
          data['gamesPlayed'],
          data['jokersBought'],
          data['username'] ?? '');
    }).then((value) {
      int gamesPlayed = value.gamesPlayed + 1;
      int correctAnswersGuessTheSound = gameType == GameType.guessTheSound
          ? value.correctAnswersGuessTheSound + correctAnswers
          : value.correctAnswersGuessTheSound;
      int correctAnswersQuiz = gameType == GameType.quiz
          ? value.correctAnswersQuiz + correctAnswers
          : value.correctAnswersQuiz;

      return userCollection.doc(uid).update({
        'correctAnswersGuessTheSound': correctAnswersGuessTheSound,
        'correctAnswersQuiz': correctAnswersQuiz,
        'gamesPlayed': gamesPlayed,
      });
    });
  }

  List<AchievementExpanded> _achievementExpandedListFromSnapshot(
      QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;
      return AchievementExpanded(
          doc.id,
          data["id"] ?? 0,
          data['name'] ?? '',
          data['reward'] ?? 0,
          data['isAchieved'] ?? false,
          data['isCollected'] ?? false,
          getAchievementType(data['achievementType']),
          data['conditionNumber'] ?? 0);
    }).toList();
  }

  Future checkForAchievements(TuneHopUser user) async {
    TuneHopUser tuneHopUser = TuneHopUser(uid!, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    await userCollection.doc(uid).get().then((value) {
      Map<String, dynamic> data = value.data()! as Map<String, dynamic>;

      return TuneHopUser(
          data['uid'] ?? '',
          data['guessTheSoundScore'],
          data['quizScore'],
          data['halfAndHalfJockerCount'],
          data['doubleValueJockerCount'],
          data['additionalTimeJockerCount'],
          data['diamonds'],
          data['correctAnswersGuessTheSound'],
          data['correctAnswersQuiz'],
          data['gamesPlayed'],
          data['jokersBought'],
          data['username'] ?? '');
    }).then((value) {
      tuneHopUser = value;
    });

    Stream<List<AchievementExpanded>> achievements = FirebaseFirestore.instance
        .collection('users/${uid}/achievements')
        .snapshots()
        .map((event) => _achievementExpandedListFromSnapshot(event));

    achievements.forEach((element) {
      element.forEach((element) async {
        if (!element.isCollected) {
          if (element.achievementType == AchievementType.correctAnswerQuiz) {
            if (element.conditionNumber < tuneHopUser.correctAnswersQuiz) {
              await FirebaseFirestore.instance
                  .collection('users/${uid}/achievements')
                  .doc(element.uid)
                  .update({
                'isAchieved': true,
              });
            }
          } else if (element.achievementType ==
              AchievementType.correctAnswerGuessTheSound) {
            if (element.conditionNumber < tuneHopUser.correctAnswersGuessTheSound) {
              await FirebaseFirestore.instance
                  .collection('users/${uid}/achievements')
                  .doc(element.uid)
                  .update({
                'isAchieved': true,
              });
            }
          } else if (element.achievementType == AchievementType.gamesPlayed) {
            if (element.conditionNumber < tuneHopUser.gamesPlayed) {
              await FirebaseFirestore.instance
                  .collection('users/${uid}/achievements')
                  .doc(element.uid)
                  .update({
                'isAchieved': true,
              });
            }
          } else {
            if (element.conditionNumber < tuneHopUser.jokersBought) {
              await FirebaseFirestore.instance
                  .collection('users/${uid}/achievements')
                  .doc(element.uid)
                  .update({
                'isAchieved': true,
              });
            }
          }
        }
      });
    });
  }

  Future collectAchievement(String userUid, int achievementUid) async {
    Stream<List<AchievementExpanded>> achievements = FirebaseFirestore.instance
        .collection('users/${uid}/achievements')
        .snapshots()
        .map((event) => _achievementExpandedListFromSnapshot(event));

    achievements.forEach((element) {
      element.forEach((element) async {
        if (element.id == achievementUid) {
          if (!element.isCollected) {
            await FirebaseFirestore.instance
                .collection('users/${uid}/achievements')
                .doc(element.uid)
                .update({
              'isCollected': true,
            });
          }
        }
      });
    });
  }

  Future collectReward(String userUid, int reward) async {
    await userCollection.doc(uid).get().then((value) {
      Map<String, dynamic> data = value.data()! as Map<String, dynamic>;

      return TuneHopUser(
          data['uid'] ?? '',
          data['guessTheSoundScore'],
          data['quizScore'],
          data['halfAndHalfJockerCount'],
          data['doubleValueJockerCount'],
          data['additionalTimeJockerCount'],
          data['diamonds'],
          data['correctAnswersGuessTheSound'],
          data['correctAnswersQuiz'],
          data['gamesPlayed'],
          data['jokersBought'],
          data['username'] ?? '');
    }).then((value) {
      int diamonds = value.diamonds + reward;

      return userCollection.doc(uid).update({
        'diamonds': diamonds,
      });
    });
  }

  Future buyJoker(String name, int price) async {
    await userCollection.doc(uid).get().then((value) {
      Map<String, dynamic> data = value.data()! as Map<String, dynamic>;

      return TuneHopUser(
          data['uid'] ?? '',
          data['guessTheSoundScore'],
          data['quizScore'],
          data['halfAndHalfJockerCount'],
          data['doubleValueJockerCount'],
          data['additionalTimeJockerCount'],
          data['diamonds'],
          data['correctAnswersGuessTheSound'],
          data['correctAnswersQuiz'],
          data['gamesPlayed'],
          data['jokersBought'],
          data['username'] ?? '');
    }).then((value) {
      if (value.diamonds - price >= 0) {
        int diamonds = value.diamonds - price;
        int additionalTimeJockerCount = name == "+ 20 sek."
            ? value.additionalTimeJockerCount + 1
            : value.additionalTimeJockerCount;
        int halfAndHalfJockerCount = name == "Pola - pola"
            ? value.halfAndHalfJockerCount + 1
            : value.halfAndHalfJockerCount;
        int doubleValueJockerCount = name == "Udvostručenje vrijednost"
            ? value.doubleValueJockerCount + 1
            : value.doubleValueJockerCount;
        int jokersBought = value.jokersBought + 1;

        return userCollection.doc(uid).update({
          'diamonds': diamonds,
          'additionalTimeJockerCount': additionalTimeJockerCount,
          'halfAndHalfJockerCount': halfAndHalfJockerCount,
          'doubleValueJockerCount': doubleValueJockerCount,
          'jokersBought': jokersBought
        });
      }
    });
  }

  Future updateAdditionalTimeJoker() async {
    await userCollection.doc(uid).get().then((value) {
      Map<String, dynamic> data = value.data()! as Map<String, dynamic>;

      return TuneHopUser(
          data['uid'] ?? '',
          data['guessTheSoundScore'],
          data['quizScore'],
          data['halfAndHalfJockerCount'],
          data['doubleValueJockerCount'],
          data['additionalTimeJockerCount'],
          data['diamonds'],
          data['correctAnswersGuessTheSound'],
          data['correctAnswersQuiz'],
          data['gamesPlayed'],
          data['jokersBought'],
          data['username'] ?? '');
    }).then((value) {
      int additionalTimeJockerCount = value.additionalTimeJockerCount - 1;

      return userCollection.doc(uid).update({
        'additionalTimeJockerCount': additionalTimeJockerCount,
      });
    });
  }

  Future updateDoubleScoreJoker() async {
    await userCollection.doc(uid).get().then((value) {
      Map<String, dynamic> data = value.data()! as Map<String, dynamic>;

      return TuneHopUser(
          data['uid'] ?? '',
          data['guessTheSoundScore'],
          data['quizScore'],
          data['halfAndHalfJockerCount'],
          data['doubleValueJockerCount'],
          data['additionalTimeJockerCount'],
          data['diamonds'],
          data['correctAnswersGuessTheSound'],
          data['correctAnswersQuiz'],
          data['gamesPlayed'],
          data['jokersBought'],
          data['username'] ?? '');
    }).then((value) {
      int doubleValueJockerCount = value.doubleValueJockerCount - 1;

      return userCollection.doc(uid).update({
        'doubleValueJockerCount': doubleValueJockerCount,
      });
    });
  }

}
