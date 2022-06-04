import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tune_hop_app/models/store_card.dart';

import '../../models/user.dart';
import '../../services/auth.dart';
import '../../services/database.dart';

class StoreCard extends StatelessWidget {
  const StoreCard({Key? key, required this.storeData}) : super(key: key);

  final JokerDetails storeData;

  @override
  Widget build(BuildContext context) {
    final AuthService _authService = AuthService();
    final DatabaseService _databaseService =
    DatabaseService(_authService.getCurrentUserUid());

    var user = Provider.of<TuneHopUser?>(context);

    return Container(
        height: MediaQuery.of(context).size.height / 5,
        width: MediaQuery.of(context).size.width,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
          child: Column(
            children: [
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                          left: 20.0, right: 10.0, top: 20.0, bottom: 10.0),
                      child: const Icon(Icons.check_circle,
                          size: 24.0, color: Color(0xFF548000)),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 20.0, bottom: 10.0),
                      child: Text(
                        storeData.name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: const TextStyle(
                            fontFamily: "Open Sans",
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.black54),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(
                            top: 10.0, left: 20.0, right: 20.0, bottom: 20.0),
                        child: Text(
                          storeData.description,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: TextStyle(
                              fontFamily: "Open Sans",
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black54),
                        ),
                      ),
                    ),
                    Container(
                      height: 40.0,
                      margin: const EdgeInsets.only(
                          top: 10.0, left: 10.0, right: 20.0, bottom: 20.0),
                      decoration: BoxDecoration(boxShadow: const [
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0, 2),
                            blurRadius: 5.0)
                      ]),
                      child: TextButton(
                        child: Text(
                          "Kupi",
                          style: const TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w500),
                        ),
                        style: TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: const Color(0xFF8ab23b),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            padding: const EdgeInsets.only(
                                left: 20.0, right: 20.0, top: 5.0, bottom: 5.0)),
                        onPressed: () async {
                          if (user!.diamonds - storeData.price >= 0) {
                            await _databaseService.buyJoker(storeData.name, storeData.price);
                            await _databaseService.checkForAchievements(user);
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
