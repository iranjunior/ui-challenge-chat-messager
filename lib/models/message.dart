import 'dart:convert';

class MessageModel {
  String message;
  String author;
  DateTime time;
  bool isRead;

  MessageModel({
    required this.message,
    required this.author,
    required this.time,
    required this.isRead,
  });

  MessageModel copyWith({
    String? message,
    String? author,
    DateTime? time,
    bool? isRead,
  }) {
    return MessageModel(
      message: message ?? this.message,
      author: author ?? this.author,
      time: time ?? this.time,
      isRead: isRead ?? this.isRead,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'author': author,
      'time': time.millisecondsSinceEpoch,
      'isRead': isRead,
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      message: map['message'],
      author: map['author'],
      time: DateTime.fromMillisecondsSinceEpoch(map['time']),
      isRead: map['isRead'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageModel.fromJson(String source) =>
      MessageModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MessageModel(message: $message, author: $author, time: $time, isRead: $isRead)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is MessageModel &&
      other.message == message &&
      other.author == author &&
      other.time == time &&
      other.isRead == isRead;
  }

  @override
  int get hashCode {
    return message.hashCode ^
      author.hashCode ^
      time.hashCode ^
      isRead.hashCode;
  }
}
