import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:chat_messager/constants/colors.dart';
import 'package:chat_messager/models/models.dart';
import 'package:chat_messager/ui/pages/chat/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key? key, required this.conversation}) : super(key: key);
  final ConversationModel conversation;

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  void initState() {
    super.initState();
    initiSatusBarColor();
  }
  
  Future<void> initiSatusBarColor() async {
    await FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
  }

  @override
  Widget build(BuildContext context) {
    final destinatary = widget.conversation.participants
        .firstWhere((element) => element.name != 'Iran Junior');
    
    return Scaffold(
      appBar: AppBarChatPage(
        title: destinatary.name,
        action: 'typing...',
        image: destinatary.image,

      ),
      backgroundColor: Color(kSecondaryColor),
      body: Stack(
        children: [
          MusicIndicator(),
          Positioned(
            top: 48,
            child: MessagesChatPage(
              message: widget.conversation.messages,
            ),
          ),
          Positioned(
            bottom: 24,
            child: SendContainer(),
          ),
        ],
      ),
    );
  }
}

