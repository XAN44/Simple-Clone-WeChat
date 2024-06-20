import 'package:flutter/material.dart';
import 'package:myproject/components/home/components/home_btn.dart';

// * Main home widget
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              OverflowBar(
                spacing: 10,
                overflowSpacing: 20,
                alignment: MainAxisAlignment.center,
                overflowAlignment: OverflowBarAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/images/Flutter.png",
                    width: 300,
                  ),
                  const HomeBtn()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
