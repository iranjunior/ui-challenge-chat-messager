import 'package:chat_messager/ui/pages/home/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_messager/constants/colors.dart';

class AppBarChatPage extends StatelessWidget implements PreferredSizeWidget {
  const AppBarChatPage({
    Key? key,
    this.action,
    required this.title,
    required this.image,
  }) : super(key: key);
  final String title;
  final String image;
  final String? action;

  get preferredSize => Size.fromHeight(80.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(kSecondaryColor),
      centerTitle: false,
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: IconButton(
          onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => HomePage(),
                ),
              ),
          icon: Icon(Icons.arrow_back_ios)),
      title: Row(
        children: [
          CircleAvatar(
            foregroundImage: AssetImage(this.image),
            radius: 20,
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                this.title,
                style: Theme.of(context).textTheme.headline3,
              ),
              this.action != null
                  ? Text(
                      this.action!,
                      style: Theme.of(context).textTheme.overline,
                    )
                  : SizedBox.shrink(),
            ],
          ),
        ],
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Icon(
            Icons.more_horiz,
            color: Color(kPrimaryColor),
            size: 24,
          ),
        ),
      ],
    );
  }

  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
