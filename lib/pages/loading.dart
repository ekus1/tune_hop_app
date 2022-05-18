import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF548000),
      child: const Center(
        child: SpinKitFoldingCube(
          color: Colors.white,
          size: 50.0
        ),
      )
    );
  }
}
