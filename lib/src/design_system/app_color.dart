import 'package:flutter/material.dart';
import 'package:flutter_komorebi/src/core/domain/history_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appColorSchemeSeedProvider = StateProvider<MaterialColor>((ref) => Colors.deepOrange);

extension HistoryItemColorExtension on HistoryExpandedEntity {
  Color get tileBackgroundColor {
    switch (historyType) {
      case HistoryType.unidentified:
        return Colors.white;
      case HistoryType.addNote:
      case HistoryType.updateNote:
      case HistoryType.addCollection:
      case HistoryType.updateCollection:
        return Colors.blue.shade100;
      case HistoryType.deleteNote:
      case HistoryType.deleteCollection:
      case HistoryType.removeConnection:
        return Colors.red.shade100;
      case HistoryType.addConnection:
        return Colors.green.shade100;
    }
  }
}

/// extensions
///
///
extension ColorExtension on Color {
  // return a hex representation of the color with opacity information
  String get hex {
    return toARGB32().toRadixString(16).toUpperCase();
  }
}
