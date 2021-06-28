import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_messager/constants/colors.dart';

class TabBarHomePage extends StatefulWidget {
  TabBarHomePage({Key? key}) : super(key: key);

  @override
  _TabBarHomePageState createState() => _TabBarHomePageState();
}

class _TabBarHomePageState extends State<TabBarHomePage> {
  int activeIndex = 1;
  final List<String> tabs = [
    'All',
    'Personal',
    'Design',
    'Work',
    'Favorite',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.only(left: 16),
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Container(
        decoration: BoxDecoration(
          color: Color(kBallonBackgroundColor),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            bottomLeft: Radius.circular(50),
          ),
        ),
        child: ListView.builder(
          itemCount: tabs.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final isActive = activeIndex == index;
            return GestureDetector(
              onTap: () => setState(() => activeIndex = index),
              child: Container(
                margin: const EdgeInsets.all(8),
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: BoxDecoration(
                  color: isActive ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: isActive
                      ? [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: Offset(8, 4),
                          ),
                        ]
                      : null,
                ),
                child: Text(
                  tabs[index],
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        fontWeight: isActive ? FontWeight.w700 : null,
                      ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
