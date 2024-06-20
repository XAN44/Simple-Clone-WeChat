import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myproject/components/buttombar/buttombar.dart';
import 'package:myproject/components/mainapp/mainapp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "WeChat",
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 209, 209, 209),
          centerTitle: true,
          title: Column(
            children: [
              Text(
                'WeChat',
                style: GoogleFonts.roboto(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: IconButton(
                onPressed: () {
                  null;
                },
                icon: const Icon(Icons.add_circle_outline_rounded),
              ),
            ),
          ],
        ),
        body: const MainApp(),
        bottomNavigationBar: const Buttombar(),
      ),
    );
  }
}
