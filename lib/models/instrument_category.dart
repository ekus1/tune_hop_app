enum InstrumentCategory {
  brass,
  keyboards,
  orchestra,
  percussion,
  strings,
  woodwind
}

extension InstrumentCategoryExtension on InstrumentCategory {
  String get nameDescription {
    switch (this) {
      case InstrumentCategory.brass:
        return 'Limeni puhački instrument';
      case InstrumentCategory.keyboards:
        return 'Klavijature';
      case InstrumentCategory.orchestra:
        return 'Orkestarski instrument';
      case InstrumentCategory.percussion:
        return 'Udaraljke';
      case InstrumentCategory.strings:
        return 'Žičani instrument';
      default:
        return 'Drveni puhački instrumenti';
    }
  }
}

InstrumentCategory getInstrumentCategory(String iC) {
  if (iC == "brass") {
    return InstrumentCategory.brass;
  } else if (iC == "keyboards") {
    return InstrumentCategory.keyboards;
  } else if (iC == "orchestra") {
    return InstrumentCategory.orchestra;
  } else if (iC == "percussion") {
    return InstrumentCategory.percussion;
  } else if (iC == "strings") {
    return InstrumentCategory.strings;
  } else {
    return InstrumentCategory.woodwind;
  }
}
