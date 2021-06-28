import 'package:chat_messager/helpers/build_conversation.dart';
import 'package:chat_messager/models/models.dart';
import 'package:chat_messager/ui/pages/home/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final conversation = buildConversations();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarHomePage(),
      body: Column(
        children: [
          Flexible(
            child: TabBarHomePage(),
          ),
          Flexible(
            flex: 6,
            child: Conversations(
              conversation: conversation,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppHomePage(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingButtonHomePage(),
    );
  }
}
