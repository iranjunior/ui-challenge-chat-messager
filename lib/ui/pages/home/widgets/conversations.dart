import 'package:chat_messager/models/models.dart';
import 'package:chat_messager/ui/pages/chat/chat_page.dart';
import 'package:chat_messager/ui/pages/home/widgets/conversation_tile.dart';
import 'package:flutter/material.dart';

class Conversations extends StatelessWidget {
  const Conversations({Key? key, required this.conversation}) : super(key: key);
  final List<ConversationModel> conversation;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: conversation.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          child: ConversationTile(
            conversation: conversation[index],
          ),
        );
      },
    );
  }
}
