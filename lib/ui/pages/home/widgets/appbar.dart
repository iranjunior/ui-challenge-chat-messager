import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_messager/constants/colors.dart';

class AppBarHomePage extends StatelessWidget implements PreferredSizeWidget {
  const AppBarHomePage({Key? key}) : super(key: key);

  get preferredSize => Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(kPrimaryColor),
      centerTitle: false,
      elevation: 0,
      title: Text(
        'Chat',
        style: Theme.of(context).textTheme.headline1,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Icon(
            CupertinoIcons.search,
            color: Colors.black,
            size: 32,
          ),
        ),
      ],
    );
  }

  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
