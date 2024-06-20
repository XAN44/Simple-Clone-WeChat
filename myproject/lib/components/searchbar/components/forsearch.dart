import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class Forsearch extends StatefulWidget {
  const Forsearch({super.key});

  @override
  State<Forsearch> createState() => _ForsearchState();
}

class _ForsearchState extends State<Forsearch> {
  final TextEditingController _searchController = TextEditingController();
  List<String> suggestion = [];
  void search(String query) async {
    if (query.isNotEmpty) {
      var url = Uri.parse('https://api.escuelajs.co/api/v1/users');
      try {
        var response = await http.get(url);
        if (response.statusCode == 200) {
          List<dynamic> jsondata = json.decode(response.body);
          List<String> allname =
              jsondata.map((json) => json['name'] as String).toList();

          List<String> susgestionList = allname
              .where((name) => name.toLowerCase().contains(query.toLowerCase()))
              .toList();

          setState(() {
            suggestion = susgestionList;
          });
        } else {
          throw Exception('Failed to fetch data');
        }
      } catch (e) {
        print('Error: $e');
      }
    } else {
      setState(() {
        suggestion.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: const Color.fromARGB(255, 209, 209, 209),
          automaticallyImplyLeading: false,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'ยกเลิก',
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  color: const Color.fromARGB(255, 91, 102, 186),
                ),
              ),
            ),
          ],
          title: TextField(
            autofocus: true,
            controller: _searchController,
            onChanged: (value) {
              search(value);
            },
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search),
              suffixIcon: Align(
                widthFactor: 1.0,
                heightFactor: 1.0,
                child: Icon(Icons.mic),
              ),
              filled: true,
              fillColor: Colors.white,
              hintText: 'ค้นหา',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                  borderSide: BorderSide.none),
            ),
            style: GoogleFonts.roboto(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: suggestion.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(suggestion[index]),
            );
          },
        ),
      ),
    );
  }
}
