import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tune_hop_app/models/instruction_page_model.dart';

Container introductionCard(context, InstructionPageModel instructionPageModel) {
  return Container(
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    color: const Color(0xFF8ab23b),
    child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 6,
            child: Image.asset(instructionPageModel.picturePath, height: double.infinity, width: double.infinity, fit: BoxFit.fill),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 5.0, top: 20.0),
              child: Text(instructionPageModel.title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold
                  )),
            ),
          ),
          Expanded(
          flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
              child: Text(instructionPageModel.content,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.normal
                  )),
            ),
          ),
        ]),
  );
}
