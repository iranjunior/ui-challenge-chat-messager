import 'package:chat_messager/constants/colors.dart';
import 'package:chat_messager/ui/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'package:chat_messager/models/conversation.dart';

class ConversationTile extends StatelessWidget {
  const ConversationTile({
    Key? key,
    required this.conversation,
  }) : super(key: key);
  final ConversationModel conversation;
  @override
  Widget build(BuildContext context) {
    final image = conversation.participants
        .firstWhere((element) => element.name != 'Iran Junior')
        .image;
    final unReadMessagesCount = conversation.messages.fold<int>(
        0,
        (currentValue, element) =>
            !element.isRead ? currentValue + 1 : currentValue);
    final lastMessage = conversation.messages.last;
    return ListTile(
      isThreeLine: true,
      onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  ChatPage(conversation: conversation),
            ),
          ),
      leading: CircleAvatar(
        foregroundImage: AssetImage(image),
        radius: 32,
      ),
      title: Text(
        conversation.participants
            .firstWhere((element) => element.name != 'Iran Junior')
            .name,
        style: Theme.of(context).textTheme.headline2,
      ),
      subtitle: Text(
        lastMessage.message,
        style: Theme.of(context).textTheme.bodyText1,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            timeago.format(
                DateTime.now().subtract(
                  DateTime.now().difference(lastMessage.time),
                ),
                locale: 'en_short'),
          ),
          unReadMessagesCount > 0
              ? Container(
                  height: 24,
                  width: 24,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color(kDestakColor),
                      boxShadow: [
                        BoxShadow(
                          color: Color(kDestakColor),
                          blurRadius: 4,
                        ),
                      ]),
                  child: Text(
                    '$unReadMessagesCount',
                    style: Theme.of(context).textTheme.caption,
                  ),
                )
              : SizedBox.shrink()
        ],
      ),
    );
  }
}
