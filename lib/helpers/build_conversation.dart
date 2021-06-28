import 'package:chat_messager/models/conversation.dart';
import 'package:chat_messager/models/message.dart';
import 'package:chat_messager/models/user.dart';
import 'dart:math';

List<Map<String, String>> users = [
  {'name': 'Tulio Marques', 'image': 'assets/avatar2.png'},
  {'name': 'Gustavo Magalhaes', 'image': 'assets/avatar1.png'},
  {
    'name': 'Luiz Fernandes',
    'image': 'assets/avatar3.png',
  },
  {'name': 'Dr Mauro Lucena', 'image': 'assets/avatar4.jpeg'},
  {'name': 'Wellington', 'image': 'assets/avatar5.png'},
];

List<String> messages = [
  'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
  'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
  'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.'
      'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
  'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.'
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
  'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
  'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
      'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
  'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
  'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
  'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
  'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.'
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
  'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
  'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
];

List<MessageModel> buildMessages(List<UserModel> participants) {
  messages.shuffle();
  var generatedList = List.generate(
    messages.length,
    (index) => MessageModel(
      message: messages[index],
      author: index % 2 == 0 ? participants.last.name : participants.first.name,
      time: DateTime.now().subtract(
        Duration(
          minutes: Random().nextInt(59),
        ),
      ),
      isRead: Random().nextInt(2) == 1 ? true : false,
    ),
  );
  generatedList.sort((a, b) {
    if (a.time.isAfter(b.time)) {
      return 1;
    }

    if (a.time.isBefore(b.time)) {
      return -1;
    }
    return 0;
  });
  return generatedList;
}

List<ConversationModel> buildConversations() {
  users.shuffle();
  var generatedList = List.generate(
    users.length,
    (index) {
      final participants = [
        UserModel.me(),
        UserModel(
          name: users[index]['name']!,
          image: users[index]['image']!,
          lastLogin: DateTime.now().subtract(
            Duration(
              minutes: Random().nextInt(45),
            ),
          ),
        )
      ];
      return ConversationModel(
        participants: participants,
        messages: buildMessages(participants),
      );
    },
  );
  generatedList.sort((a, b) {
    if (a.messages.last.time.isAfter(b.messages.last.time)) {
      return -1;
    }
    if (a.messages.last.time.isBefore(b.messages.last.time)) {
      return 1;
    }
    return 0;
  });
  return generatedList;
}
