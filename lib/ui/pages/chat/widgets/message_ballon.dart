import 'package:flutter/material.dart';
import 'package:chat_messager/constants/colors.dart';

class BallonMessage extends StatelessWidget {
  const BallonMessage({
    Key? key,
    required this.message,
    required this.date,
    required this.isMe,
    required this.isRead,
  }) : super(key: key);
  final String message;
  final String date;
  final bool isMe;
  final bool isRead;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
      margin: EdgeInsets.only(
        left: isMe ? MediaQuery.of(context).size.width * 0.25 : 0,
        right: !isMe ? MediaQuery.of(context).size.width * 0.25 : 0,
        top: 16,
        bottom: 16,
      ),
      constraints:
          BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.5),
      decoration: BoxDecoration(
        color: this.isMe ? Color(kDestakColor) : Color(kBallonBackgroundColor),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
          bottomLeft: Radius.circular(isMe ? 32 : 8),
          bottomRight: Radius.circular(isMe ? 8 : 32),
        ),
      ),
      child: Column(
        children: [
          Text(
            this.message,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: isMe ? Color(kPrimaryColor) : Color(kSecondaryColor),
                ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                this.date,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color:
                          isMe ? Color(kPrimaryColor) : Color(kSecondaryColor),
                    ),
              ),
              isMe && isRead
                  ? Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Icon(
                        Icons.done_all,
                        size: 16,
                        color: Color(kPrimaryColor),
                      ),
                    )
                  : SizedBox.shrink()
            ],
          )
        ],
      ),
    );
  }
}

class BallonDayMessage extends StatelessWidget {
  const BallonDayMessage({
    Key? key,
    required this.message,
  }) : super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width / 3,
        vertical: 16
      ),
      decoration: BoxDecoration(
        color: Color(kBallonBackgroundColor),
        borderRadius: BorderRadius.circular(32),
      ),
      alignment: Alignment.center,
      child: Text(
        this.message,
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
              color: Color(kSecondaryColor),
            ),
      ),
    );
  }
}
