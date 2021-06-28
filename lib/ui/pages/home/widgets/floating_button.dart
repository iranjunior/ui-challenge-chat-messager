import 'package:chat_messager/constants/colors.dart';
import 'package:flutter/material.dart';

class FloatingButtonHomePage extends StatelessWidget {
  const FloatingButtonHomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Color(kDestakColor),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Color(kDestakColor),
              blurRadius: 8,
              spreadRadius: 1,
              offset: Offset(0, 4)
            )
          ]
        ),
        child: Icon(
          Icons.add,
          size: 32,
          color: Colors.white,
        ),
      ),
    );
  }
}
