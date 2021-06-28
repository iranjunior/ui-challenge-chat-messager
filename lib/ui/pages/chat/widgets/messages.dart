import 'package:chat_messager/constants/colors.dart';
import 'package:chat_messager/models/message.dart';
import 'package:chat_messager/ui/pages/chat/widgets/message_ballon.dart';
import 'package:flutter/material.dart';

import 'package:chat_messager/extensions/datetime.dart';

class MessagesChatPage extends StatelessWidget {
  const MessagesChatPage({
    Key? key,
    required this.message,
  }) : super(key: key);

  final List<MessageModel> message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: MediaQuery.of(context).size.height - 180,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Color(kPrimaryColor),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.15),
        child: _buildMessages(),
      ),
    );
  }

  ListView _buildMessages() {
    return ListView.builder(
      itemCount: message.length + 2,
      reverse: true,
      itemBuilder: (context, index) {
        final newIndex = index - 1;

        if (newIndex == message.length) {
          return BallonDayMessage(message: 'Today');
        }
        if (index == 0) {
          return SizedBox(height: 60);
        }
        return BallonMessage(
          message: message[newIndex].message,
          date: message[newIndex].time.toFormatHourAndMinutes(),
          isMe: message[newIndex].author == 'Iran Junior',
          isRead: message[newIndex].isRead,
        );
      },
    );
  }
}
