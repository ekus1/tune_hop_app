import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:tune_hop_app/pages/frame_page.dart';
import 'package:tune_hop_app/pages/introduction_page.dart';

import '../models/user.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<TuneHopUser?>(context);
    if (user == null) {
      return const IntroductionPage();
    } else {
      return const FramePage();
    }
  }
}
