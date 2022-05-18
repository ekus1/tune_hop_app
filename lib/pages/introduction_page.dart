import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tune_hop_app/data/instruction_page_data.dart';
import 'package:tune_hop_app/models/instruction_page_model.dart';
import 'package:tune_hop_app/pages/user_onboarding_page.dart';

import '../components/card/introduction_card.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {

  List<InstructionPageModel> instructions = <InstructionPageModel>[];
  int slideIndex = 0;
  late PageController controller;

  Widget _buildPageIndicator(bool isCurrentPage){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Colors.white : Colors.white30,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    instructions = instructionPageModelData;
    controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controller,
          onPageChanged: (val) {
            setState(() {
              slideIndex = val;
            });
          },
          children: [
            introductionCard(context, instructions[0]),
            introductionCard(context, instructions[1]),
            introductionCard(context, instructions[2]),
            const UserOnboardingPage(),
          ],
        ),
      ),
      bottomSheet: Container(
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        color: const Color(0xFF8ab23b),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            TextButton(
              onPressed: (){
                controller.animateToPage(3, duration: Duration(milliseconds: 400), curve: Curves.linear);
              },
              child: Text(
                slideIndex != 3 ? 'Preskoči' : '',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              child: Row(
                children: [
                  for (int i = 0; i < 4 ; i++) i == slideIndex ? _buildPageIndicator(true): _buildPageIndicator(false),
                ],),
            ),
            TextButton(
              onPressed: (){
                controller.animateToPage(slideIndex + 1, duration: Duration(milliseconds: 500), curve: Curves.linear);
              },
              child: Text(
                slideIndex != 3 ? 'Dalje' : '',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      )
    );
  }
}
