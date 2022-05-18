import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tune_hop_app/components/navigation/bottom_navigation.dart';
import 'package:tune_hop_app/models/user.dart';
import 'package:tune_hop_app/pages/store_page.dart';
import 'package:tune_hop_app/services/auth.dart';
import 'package:tune_hop_app/services/database.dart';

import '../components/header/header.dart';
import 'home_page.dart';

class FramePage extends StatefulWidget {
  const FramePage({Key? key}) : super(key: key);

  @override
  _FramePageState createState()
  {
    return _FramePageState();
  }
}

class _FramePageState extends State<FramePage> {
  static const List<Widget> _pages = <Widget>[
    HomePage(),
    StorePage(),
    StorePage()
  ];

  int _selectedIndex = 0;
  String _headerTitle = 'Dobro došla nazad!';
  String _headerSubtitle = 'Ana Marija Jurić Katrunđić Mišić';
  bool _isHomePage = true;

  void _onTap(int index)
  {
    _selectedIndex = index;
    setState(() { });

    if (_selectedIndex == 0) {
      _headerTitle = 'Dobro došla nazad!';
      _headerSubtitle = 'Ana Marija Jurić Katrunđić Mišić';
      _isHomePage = true;
    } else {
      _isHomePage = false;
      _headerSubtitle = '';
      if (_selectedIndex == 1) {
        _headerTitle = 'Trgovina';
      } else {
        _headerTitle = 'Postignuća';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final AuthService _authService = AuthService();
    final DatabaseService _databaseService = DatabaseService(_authService.getCurrentUserUid());

    return MultiProvider(
      providers: [
        StreamProvider<TuneHopUser?>.value(value: _databaseService.userData, initialData: TuneHopUser('', 0, 0, 0, 0, 0, 0)),
      ],
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80.0),
            child: header(context,
                isHomePage: _isHomePage,
                title: _headerTitle,
                subtitle: _headerSubtitle)
        ),
        body: Container(
          color: const Color(0xFFF6F3EE),
          child: Center(
            child: IndexedStack(
                index: _selectedIndex,
                children: _pages
            ),
          ),
        ),
        bottomNavigationBar: bottomNavigation(
            context,
            selectedIndex: _selectedIndex,
            onTap: _onTap),
      )
    );
  }
}

