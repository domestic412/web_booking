import 'package:web_booking/utils/app_assets.dart';

class FirebaseMessage {
  String? notificationId;
  String id;
  String title;
  String payload;
  FirebaseMessageType type;
  DateTime? timestamp;
  String? officeId;
  bool isRead;

  FirebaseMessage({
    this.notificationId = "0",
    this.id = '',
    this.title = '',
    this.payload = '',
    this.type = FirebaseMessageType.RequestContainer,
    this.timestamp,
    this.officeId,
    this.isRead = true,
  });

  FirebaseMessage.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? '0',
        title = json['title'] ?? '',
        payload = json['payload'] ?? '',
        type = _parseMessageType(json['type']),
        timestamp = json['timestamp'] != null
            ? DateTime.parse(json['timestamp'])
            : null,
        isRead = json['isRead'] ?? true;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'payload': payload,
        'type': _getMessageTypeString(type),
        'timestamp': timestamp?.toIso8601String(),
        'isRead': isRead,
      };

  FirebaseMessage copyWith({
    String? id,
    String? title,
    String? payload,
    FirebaseMessageType? type,
    DateTime? timestamp,
    bool? isRead,
  }) {
    return FirebaseMessage(
      id: id ?? this.id,
      title: title ?? this.title,
      payload: payload ?? this.payload,
      type: type ?? this.type,
      timestamp: timestamp ?? this.timestamp,
      isRead: isRead ?? this.isRead,
    );
  }

  static FirebaseMessageType _parseMessageType(String value) {
    switch (value) {
      case 'RequestContainer':
        return FirebaseMessageType.RequestContainer;
      case 'ConfirmContainerCombine':
        return FirebaseMessageType.ConfirmContainerCombine;
      case 'ConfirmContainerUncombine':
        return FirebaseMessageType.ConfirmContainerUncombine;
      default:
        return FirebaseMessageType.RequestContainer;
    }
  }

  static String _getMessageTypeString(FirebaseMessageType type) {
    switch (type) {
      case FirebaseMessageType.RequestContainer:
        return 'RequestContainer';
      case FirebaseMessageType.ConfirmContainerCombine:
        return 'ConfirmContainerCombine';
      case FirebaseMessageType.ConfirmContainerUncombine:
        return 'ConfirmContainerUncombine';
      default:
        return 'RequestContainer';
    }
  }
}

enum FirebaseMessageType {
  ConfirmContainerCombine,
  ConfirmContainerUncombine,
  RequestContainer;

  String get image {
    switch (this) {
      case FirebaseMessageType.RequestContainer:
        return AppAssets.icons_send_request_svg;
      // return AppAssets.icons_attendance_svg;
      case FirebaseMessageType.ConfirmContainerUncombine:
        return AppAssets.icons_deny_svg;
      // case FirebaseMessageType.CheckInAcitvity:
      //   return AppAssets.icons_destination_svg;
      default:
        return AppAssets.icons_send_request_svg;
    }
  }
}
