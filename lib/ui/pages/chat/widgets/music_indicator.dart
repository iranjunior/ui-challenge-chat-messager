import 'package:chat_messager/constants/colors.dart';
import 'package:flutter/material.dart';

class MusicIndicator extends StatelessWidget {
  const MusicIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(kDestakColor),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          )),
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: 28,
            width: 28,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(kPrimaryColor),
            ),
            child: Icon(
              Icons.pause,
              size: 16,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Text.rich(
              TextSpan(
                text: 'She wants Revenge',
                style: Theme.of(context).textTheme.caption,
                children: [
                  TextSpan(
                    text: '  Tear You Apart',
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Color(kPrimaryColor),
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 28,
            width: 28,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(kPrimaryColor),
            ),
            child: Icon(
              Icons.close,
              size: 16,
            ),
          ),
        ],
      ),
    );
  }
}
