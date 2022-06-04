import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:tune_hop_app/models/achievement_card.dart';
import 'package:tune_hop_app/models/instrument_card.dart';
import 'package:tune_hop_app/models/instrument_details.dart';
import 'package:tune_hop_app/models/user.dart';
import 'package:tune_hop_app/pages/game_difficulty_page.dart';
import 'package:tune_hop_app/pages/games_page.dart';
import 'package:tune_hop_app/pages/guess_the_sound_page.dart';
import 'package:tune_hop_app/pages/instrument_details_page.dart';
import 'package:tune_hop_app/pages/instruments_page.dart';
import 'package:tune_hop_app/pages/quiz_page.dart';
import 'package:tune_hop_app/pages/score_page.dart';
import 'package:tune_hop_app/pages/user_onboarding_page.dart';
import 'package:tune_hop_app/pages/wrapper.dart';
import 'package:tune_hop_app/services/auth.dart';
import 'package:tune_hop_app/services/database.dart';

import 'firebase_options.dart';
import 'models/game_card.dart';
import 'models/question.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(StartApp());
}

class StartApp extends StatelessWidget {
  StartApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthService _authService = AuthService();
    final DatabaseService _databaseService = DatabaseService(_authService.getCurrentUserUid());

    return MultiProvider(
      providers: [
        StreamProvider<TuneHopUser?>.value(value: _authService.user, initialData: TuneHopUser('', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)),
        StreamProvider<List<Question>>.value(value: _databaseService.questions, initialData: []),
        StreamProvider<List<InstrumentCard>>.value(value: _databaseService.instrumentCards, initialData: []),
        StreamProvider<List<InstrumentDetails>>.value(value: _databaseService.instrumentDetails, initialData: []),
        StreamProvider<List<GameCard>>.value(value: _databaseService.gameCards, initialData: []),
        StreamProvider<List<Achievement>>.value(value: _databaseService.achievementCards, initialData: []),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const Wrapper(),
          '/user': (context) => const UserOnboardingPage(),
          '/instruments': (context) => const InstrumentsPage(),
          '/instruments/details': (context) => const InstrumentDetailsPage(),
          '/games': (context) => const GamesPage(),
          '/difficulty': (context) => const GamesDifficultyPage(),
          '/difficulty/quiz': (context) => const QuizPage(),
          '/difficulty/guessTheSound': (context) => const GuessTheSoundPage(),
          '/score': (context) => const ScorePage(),
        },
      ),
    );
  }
}
