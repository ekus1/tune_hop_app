import 'package:cloud_firestore/cloud_firestore.dart';

import 'instrument_category.dart';

class InstrumentCard {
  final String uid;
  final String name, picturePath;
  final InstrumentCategory instrumentCategory;

  InstrumentCard(this.uid, this.name, this.picturePath, this.instrumentCategory);

  InstrumentCard.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options
      ) :
        uid = snapshot.data()?["uid"],
        name = snapshot.data()?["name"],
        picturePath = snapshot.data()?["picturePath"],
        instrumentCategory = getInstrumentCategory(snapshot.data()?["instrumentCategory"]);

  Map<String, dynamic> toFirestore() {
    return {
      if (uid != null) "uid": uid,
      if (name != null) "name": name,
      if (picturePath != null) "picturePath": picturePath,
      if (instrumentCategory != null) "instrumentCategory": instrumentCategory
    };
  }

}
