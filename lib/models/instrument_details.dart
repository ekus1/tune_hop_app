import 'instrument_category.dart';

class InstrumentDetails {
  final String uid;
  final String name, picturePath, dateInvented, placeInvented, history, funFacts, audioPath;
  final InstrumentCategory instrumentCategory;

  InstrumentDetails(this.uid, this.name, this.picturePath, this.instrumentCategory, this.dateInvented, this.placeInvented, this.history, this.funFacts, this.audioPath);
}