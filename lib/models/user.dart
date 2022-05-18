import 'package:cloud_firestore/cloud_firestore.dart';

class TuneHopUser {
  final String uid;
  final String? username;
  final int guessTheSoundScore, quizScore, halfAndHalfJockerCount, doubleValueJockerCount, additionalTimeJockerCount, diamonds;

  TuneHopUser(this.uid, this.guessTheSoundScore, this.quizScore, this.halfAndHalfJockerCount, this.doubleValueJockerCount, this.additionalTimeJockerCount, this.diamonds, [this.username]);

  TuneHopUser.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options
      ) :
        uid = snapshot.data()?["uid"],
        guessTheSoundScore = snapshot.data()?["guessTheSoundScore"],
        quizScore = snapshot.data()?["quizScore"],
        username = snapshot.data()?["username"],
        diamonds = snapshot.data()?["diamonds"],
        halfAndHalfJockerCount = snapshot.data()?["halfAndHalfJockerCount"],
        doubleValueJockerCount = snapshot.data()?["doubleValueJockerCount"],
        additionalTimeJockerCount = snapshot.data()?["additionalTimeJockerCount"];

  Map<String, dynamic> toFirestore() {
    return {
      if (uid != null) "uid": uid,
      if (guessTheSoundScore != null) "guessTheSoundScore": guessTheSoundScore,
      if (quizScore != null) "quizScore": quizScore,
      if (username != null) "username": username,
      if (diamonds != null) "diamonds": diamonds,
      if (halfAndHalfJockerCount != null) "halfAndHalfJockerCount": halfAndHalfJockerCount,
      if (doubleValueJockerCount != null) "doubleValueJockerCount": doubleValueJockerCount,
      if (additionalTimeJockerCount != null) "additionalTimeJockerCount": additionalTimeJockerCount,
    };
  }
}
