import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myproject/components/addform/addform.dart';
import 'package:myproject/components/model/person.dart';

class Item extends StatefulWidget {
  const Item({super.key});

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: data.isEmpty
              ? const Center(
                  child: Text(
                    'ไม่มีข้อมูลใดๆ',
                    style: TextStyle(fontSize: 20),
                  ),
                )
              : ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: data[index].job.colourJob,
                      ),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 5),
                      padding: const EdgeInsets.all(40),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data[index].name,
                                  style: GoogleFonts.aboreto(
                                    textStyle: const TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                Text(
                                  "Age ${data[index].age} ปี / อาชีพ ${data[index].job.title}",
                                  style: GoogleFonts.prompt(
                                      fontSize: 14, color: Colors.white),
                                ),
                              ],
                            ),
                            Image.asset(data[index].job.image,
                                width: 90, fit: BoxFit.cover)
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
        SizedBox(
          width: 100,
          height: 100,
          child: IconButton(
            icon: const Icon(
              Icons.add,
              size: 40,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => const AddForm(),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
