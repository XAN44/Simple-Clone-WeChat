import 'package:flutter/material.dart';

class HomeBtn extends StatelessWidget {
  const HomeBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton.icon(
        label: const Text(
          "ENTER",
        ),
        icon: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.black,
          size: 18,
        ),
        iconAlignment: IconAlignment.end,
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.fromLTRB(
                20, 10, 10, 10), // ปรับ padding ตามที่ต้องการ
            backgroundColor: Colors.blue[200],
            foregroundColor: Colors.black),
      ),
    );
  }
}
