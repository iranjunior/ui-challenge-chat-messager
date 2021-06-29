import 'package:flutter/material.dart';
import 'package:chat_messager/constants/colors.dart';

class SendContainer extends StatelessWidget {
  const SendContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
