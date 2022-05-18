import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tune_hop_app/models/user.dart';
import 'package:tune_hop_app/services/auth.dart';

class HomePageHeader extends StatelessWidget {
  const HomePageHeader({required Key key, required this.title})
      : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    AuthService _authService = AuthService();
    final user = Provider.of<TuneHopUser?>(context);

    return Row(children: [
      Expanded(
        flex: 5,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text("Bok " + (user?.username ?? '') + '!',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: "Open Sans",
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              )),
        ),
      ),
      Expanded(
          flex: 5,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Image.asset(
              'assets/images/header_tiger.png',
              fit: BoxFit.contain,
            ),
          )),
    ]);
  }
}
