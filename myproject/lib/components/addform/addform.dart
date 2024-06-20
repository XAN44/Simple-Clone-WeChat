import 'package:flutter/material.dart';
import 'package:myproject/components/model/person.dart';
import 'package:myproject/main.dart';

class AddForm extends StatefulWidget {
  const AddForm({super.key});

  @override
  State<AddForm> createState() => _AddFormState();
}

class _AddFormState extends State<AddForm> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  int _age = 20;
  Job _job = Job.doctor;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Title",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("บันทึกข้อมูล"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(40),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                OverflowBar(
                  spacing: 30,
                  overflowSpacing: 20,
                  alignment: MainAxisAlignment.center,
                  overflowAlignment: OverflowBarAlignment.center,
                  children: [
                    TextFormField(
                      maxLength: 20,
                      decoration: const InputDecoration(
                        label: Text("Name"),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "กรุณาป้อนชื่อของคุณ";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _name = value!;
                      },
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      maxLength: 20,
                      decoration: const InputDecoration(
                        label: Text("Age"),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "กรุณาป้อนอายุ";
                        }
                        final n = num.tryParse(value);
                        if (n == null) {
                          return 'กรุณากรอกตัวเลขเท่านั้น';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _age = int.parse(value.toString());
                      },
                    ),
                    DropdownButtonFormField(
                      value: _job,
                      validator: (value) {
                        if (value == null) {
                          return "กรุณาเลือกอาชีพ";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        label: Text("Job"),
                      ),
                      items: Job.values.map((key) {
                        return DropdownMenuItem(
                          value: key,
                          child: Text(key.title),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _job = value!;
                        });
                      },
                    ),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.black,
                            iconColor: Colors.blue),
                        onPressed: () {
                          _formKey.currentState!.validate();
                          _formKey.currentState!.save();
                          data.add(
                            Person(name: _name, age: _age, job: _job),
                          );
                          _formKey.currentState!.reset();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (ctx) => const MyApp()),
                          );
                        },
                        label: const Text('SAVE'),
                        iconAlignment: IconAlignment.start,
                        icon: const Icon(Icons.save),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
