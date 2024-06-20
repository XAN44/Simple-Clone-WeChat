import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myproject/components/searchbar/components/forsearch.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, CupertinoPageRoute(builder: (ctx) => const Forsearch()));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.search),
            Text(
              'ค้นหา',
              style: GoogleFonts.roboto(
                  fontWeight: FontWeight.normal, fontSize: 17),
            ),
          ],
        ),
      ),
    );
  }
}
