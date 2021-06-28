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
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              width: MediaQuery.of(context).size.width - 32,
              decoration: BoxDecoration(
                color: Color(kBallonBackgroundColor),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: Color(kDestakColor),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Color(kDestakColor),
                              blurRadius: 8,
                              spreadRadius: 1,
                              offset: Offset(0, 4),
                            ),
                          ]),
                      child: Icon(
                        Icons.add,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    flex: 6,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Message...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Icon(
                      Icons.photo_camera,
                      size: 32,
                      color: Color(kDisableColor),
                    ),
                  ),
                  Expanded(
                    child: Icon(
                      Icons.mood,
                      size: 32,
                      color: Color(kDisableColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
