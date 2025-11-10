import 'package:flutter/material.dart';
import 'package:flutter_komorebi/src/core/domain/history_entity.dart';

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
