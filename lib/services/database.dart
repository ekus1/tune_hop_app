import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tune_hop_app/models/game_card.dart';
import 'package:tune_hop_app/models/game_type.dart';
import 'package:tune_hop_app/models/instrument_card.dart';
import 'package:tune_hop_app/models/instrument_category.dart';
import 'package:tune_hop_app/models/instrument_details.dart';
import 'package:tune_hop_app/models/question_difficulty.dart';
import 'package:tune_hop_app/models/user.dart';

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
      'additionalTimeJockerCount': additionalTimeJockerCount
    });
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
        data['username'] ?? '',
      );
    }).then((value) {
      int newDiamonds = value.diamonds + score;
      int newGuessTheSoundScore = gameType == GameType.guessTheSound && score > value.guessTheSoundScore
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
        .withConverter(
            fromFirestore: TuneHopUser.fromFirestore,
            toFirestore: (TuneHopUser tuneHopUser, _) =>
                tuneHopUser.toFirestore())
        .snapshots()
        .map((event) => _tuneHopUserFromSnapshot(event));
  }

  TuneHopUser? _tuneHopUserFromSnapshot(
      DocumentSnapshot<TuneHopUser> snapshot) {
    return snapshot.data();
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
}
