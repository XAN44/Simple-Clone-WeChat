import 'package:flutter/material.dart';

class Buttombar extends StatefulWidget {
  const Buttombar({super.key});

  @override
  State<Buttombar> createState() => _ButtombarState();
}

class _ButtombarState extends State<Buttombar> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: BottomAppBar(
        color: Color.fromARGB(255, 209, 209, 209),
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        height: 69,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Icon(Icons.chat_bubble_outline_sharp),
                Text('แชท'),
              ],
            ),
            Column(
              children: [
                Icon(Icons.person_add_alt_1_outlined),
                Text('แชท'),
              ],
            ),
            Column(
              children: [
                Icon(Icons.explore_outlined),
                Text('แชท'),
              ],
            ),
            Column(
              children: [
                Icon(Icons.person_outline),
                Text('แชท'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
