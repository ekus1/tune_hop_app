import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../models/user.dart';

class CongratulationsTitle extends StatelessWidget {
  const CongratulationsTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<TuneHopUser?>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50.0),
      child: Center(
          child: Text('Bravo ' + (user?.username ?? '') + '!',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: "Open Sans",
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              )
          )),
    );
  }
}
