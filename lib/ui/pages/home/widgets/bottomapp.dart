import 'package:chat_messager/constants/colors.dart';
import 'package:chat_messager/ui/widget/round_notchedRetangular.dart';
import 'package:flutter/material.dart';

class BottomAppHomePage extends StatefulWidget {
  const BottomAppHomePage({
    Key? key,
  }) : super(key: key);

  @override
  _BottomAppHomePageState createState() => _BottomAppHomePageState();
}

class _BottomAppHomePageState extends State<BottomAppHomePage> {
  int activeIndex = 2;
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: RoundNotchedRectangle(),
      clipBehavior: Clip.hardEdge,
      notchMargin: 8,
      elevation: 0,
      color: Color(kSecondaryColor),
      child: Container(
        child: Stack(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() => activeIndex = 0);
                        },
                        icon: Icon(Icons.phone),
                        color: activeIndex == 0
                            ? Color(kDestakColor)
                            : Color(kPrimaryColor),
                        iconSize: 32,
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() => activeIndex = 1);
                        },
                        icon: Icon(Icons.person),
                        color: activeIndex == 1
                            ? Color(kDestakColor)
                            : Color(kPrimaryColor),
                        iconSize: 32,
                      ),
                      SizedBox(width: 60),
                      IconButton(
                        onPressed: () {
                          setState(() => activeIndex = 2);
                        },
                        icon: Icon(Icons.chat),
                        color: activeIndex == 2
                            ? Color(kDestakColor)
                            : Color(kPrimaryColor),
                        iconSize: 32,
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() => activeIndex = 3);
                        },
                        icon: Icon(Icons.settings),
                        color: activeIndex == 3
                            ? Color(kDestakColor)
                            : Color(kPrimaryColor),
                        iconSize: 32,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(width: 30),
                Indicator(active: activeIndex == 0),
                SizedBox(width: 50),
                Indicator(active: activeIndex == 1),
                SizedBox(width: 150),
                Indicator(active: activeIndex == 2),
                SizedBox(width: 50),
                Indicator(active: activeIndex == 3),
                SizedBox(width: 30),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  const Indicator({Key? key, this.active}) : super(key: key);
  final bool? active;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      width: 25,
      decoration: this.active == true
          ? BoxDecoration(
              color: Color(kDestakColor),
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Color(kDestakColor),
                  blurRadius: 10,
                  offset: Offset(0, 10),
                ),
              ],
            )
          : null,
    );
  }
}
