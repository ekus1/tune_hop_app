import 'package:flutter/material.dart';
import 'package:tune_hop_app/components/header/header_default_page.dart';
import 'package:tune_hop_app/components/header/header_home_page.dart';

AppBar header(context, {bool isHomePage = false, required String title, required String subtitle}) {
  return AppBar(
    title: isHomePage ? homePageHeader(title: title, subtitle: subtitle)
        : defaultPageHeader(context, title: title),
    centerTitle: false,
    toolbarHeight: 80.0,
    backgroundColor: const Color(0xFF8ab23b),
    shape: const ContinuousRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(50.0),
        bottomLeft: Radius.circular(50.0)
      )
    ),
  );
}