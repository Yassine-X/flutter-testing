import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 85, 20, 150),
          centerTitle: true,
          title: const Text(
            "Students Manager",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: const Row(
          children: [
            SimpleTextField(hintText: "Name",),
            SimpleTextField(hintText: "Age", textInputType: TextInputType.number,),
            SimpleTextField(hintText: "Branch",),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 152, 205, 17),
          onPressed: () {},
          child: const Icon(Icons.add),
        ));
  }
}

class SimpleTextField extends StatelessWidget {
 
  final TextInputType? textInputType;
  final String? hintText;
  const SimpleTextField({
    this.textInputType,
    required this.hintText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        keyboardType: textInputType,
        decoration: InputDecoration(
          hintText: hintText,
        ),
      ),
    );
  }
}
