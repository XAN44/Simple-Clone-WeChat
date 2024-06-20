import 'package:flutter/material.dart';
import 'package:myproject/components/model/user.dart';
import 'package:myproject/components/searchbar/searchbar.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List<User> data = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    var url = Uri.parse('https://api.escuelajs.co/api/v1/users');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      List<dynamic> tenData = jsonData.take(3).toList();
      setState(() {
        data = tenData.map((json) => User.fromJson(json)).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const MySearchBar(),
        backgroundColor: const Color.fromARGB(255, 209, 209, 209),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Image.network(
                  data[index].avatar,
                  width: 50,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 13),
                child: Text(data[index].name),
              )
            ],
          );
        },
      ),
    );
  }
}
