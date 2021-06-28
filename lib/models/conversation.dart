import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:chat_messager/models/message.dart';
import 'package:chat_messager/models/user.dart';

class ConversationModel {
  List<UserModel> participants;
  List<MessageModel> messages;
  
  ConversationModel({
    required this.participants,
    required this.messages,
  });

  ConversationModel copyWith({
    List<UserModel>? participants,
    List<MessageModel>? messages,
  }) {
    return ConversationModel(
      participants: participants ?? this.participants,
      messages: messages ?? this.messages,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'participants': participants.map((x) => x.toMap()).toList(),
      'messages': messages.map((x) => x.toMap()).toList(),
    };
  }

  factory ConversationModel.fromMap(Map<String, dynamic> map) {
    return ConversationModel(
      participants: List<UserModel>.from(
          map['participants']?.map((x) => UserModel.fromMap(x))),
      messages: List<MessageModel>.from(
          map['messages']?.map((x) => MessageModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ConversationModel.fromJson(String source) =>
      ConversationModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'ConversationModel(participants: $participants, messages: $messages)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ConversationModel &&
        listEquals(other.participants, participants) &&
        listEquals(other.messages, messages);
  }

  @override
  int get hashCode => participants.hashCode ^ messages.hashCode;
}
