import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController professionController = TextEditingController();
  final List<Map<String, String>> students = [];

  void addStudent() {
    if (nameController.text.isNotEmpty && ageController.text.isNotEmpty && professionController.text.isNotEmpty) {
      setState(() {
        students.add({
          "name": nameController.text,
          "age": ageController.text,
          "profession": professionController.text,
        });
        nameController.clear();
        ageController.clear();
        professionController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Students Manager",
          style: TextStyle(color: Color.fromARGB(255, 68, 12, 96), fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      hintText: "Name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: ageController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "Age",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: professionController,
                    decoration: const InputDecoration(
                      hintText: "Profession",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: addStudent,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16),
                    shape: const CircleBorder(),
                    backgroundColor: const Color.fromARGB(255, 56, 22, 107),
                  ),
                  child: const Icon(Icons.add, color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: students.isEmpty
                  ? Center(
                      child: Image.network(
                        'https://static.vecteezy.com/system/resources/previews/006/736/566/non_2x/illustration-file-not-found-or-404-error-page-free-vector.jpg',
                        width: 150,
                        height: 150,
                      ),
                    )
                  : ListView.builder(
                      itemCount: students.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 4,
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                            title: Text("Name: ${students[index]['name']}", style: TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Text("Age: ${students[index]['age']} - Profession: ${students[index]['profession']}"),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}