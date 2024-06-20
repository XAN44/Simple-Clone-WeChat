import 'package:flutter/material.dart';

enum Job {
  doctor(
      title: "หมอ", image: "assets/images/pic2.png", colourJob: Colors.green),
  teacher(
      title: "ครู", image: "assets/images/pic6.png", colourJob: Colors.purple),
  nurse(
      title: "พยาบาล", image: "assets/images/pic3.png", colourJob: Colors.pink),
  police(
      title: "ตำรวจ", image: "assets/images/pic4.png", colourJob: Colors.red);

  const Job(
      {required this.title, required this.image, required this.colourJob});
  final String title;
  final String image;
  final Color colourJob;
}

class Person {
  Person({required this.name, required this.age, required this.job});
  String name;
  int age;
  Job job;
}

List<Person> data = [
  Person(name: 'Yin', age: 10, job: Job.doctor),
  Person(name: 'Xan', age: 20, job: Job.nurse),
  Person(name: 'Mike', age: 10, job: Job.police)
];
