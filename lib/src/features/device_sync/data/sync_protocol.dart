/// Wire protocol messages exchanged between two Kiritori devices over a
/// local WebSocket connection, as JSON-encodable maps.
library;

class HelloMessage {
  HelloMessage({required this.deviceId, required this.deviceName});

  final String deviceId;
  final String deviceName;

  Map<String, dynamic> toJson() => {'type': 'hello', 'deviceId': deviceId, 'deviceName': deviceName};

  static HelloMessage fromJson(Map<String, dynamic> json) =>
      HelloMessage(deviceId: json['deviceId'] as String, deviceName: json['deviceName'] as String);
}

class ChangesRequestMessage {
  ChangesRequestMessage({required this.sinceId});

  final int sinceId;

  Map<String, dynamic> toJson() => {'type': 'changes-request', 'sinceId': sinceId};

  static ChangesRequestMessage fromJson(Map<String, dynamic> json) =>
      ChangesRequestMessage(sinceId: json['sinceId'] as int);
}

class ChangeEntry {
  ChangeEntry({
    required this.id,
    required this.entityType,
    required this.uuid,
    required this.operation,
    required this.payload,
    required this.updatedAt,
    required this.deviceId,
  });

  final int id;
  final String entityType;
  final String uuid;
  final String operation;
  final Map<String, dynamic>? payload;
  final DateTime updatedAt;
  final String deviceId;

  Map<String, dynamic> toJson() => {
        'id': id,
        'entityType': entityType,
        'uuid': uuid,
        'operation': operation,
        'payload': payload,
        'updatedAt': updatedAt.toIso8601String(),
        'deviceId': deviceId,
      };

  static ChangeEntry fromJson(Map<String, dynamic> json) => ChangeEntry(
        id: json['id'] as int,
        entityType: json['entityType'] as String,
        uuid: json['uuid'] as String,
        operation: json['operation'] as String,
        payload: json['payload'] as Map<String, dynamic>?,
        updatedAt: DateTime.parse(json['updatedAt'] as String),
        deviceId: json['deviceId'] as String,
      );
}

class ChangesBatchMessage {
  ChangesBatchMessage({required this.entries});

  final List<ChangeEntry> entries;

  Map<String, dynamic> toJson() =>
      {'type': 'changes-batch', 'entries': entries.map((e) => e.toJson()).toList()};

  static ChangesBatchMessage fromJson(Map<String, dynamic> json) => ChangesBatchMessage(
        entries: (json['entries'] as List)
            .map((e) => ChangeEntry.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}

class AckMessage {
  AckMessage({required this.receivedUpTo});

  final int receivedUpTo;

  Map<String, dynamic> toJson() => {'type': 'ack', 'receivedUpTo': receivedUpTo};

  static AckMessage fromJson(Map<String, dynamic> json) => AckMessage(receivedUpTo: json['receivedUpTo'] as int);
}

class DoneMessage {
  Map<String, dynamic> toJson() => {'type': 'done'};
}
