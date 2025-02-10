import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoadingScreen(),
    );
  }
}

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Navigate to the new screen after a delay of 3 seconds
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });

    return Scaffold(
      backgroundColor: Colors.white, // White background
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(const Color.fromARGB(255, 108, 189, 255)), // Blue spinner color
              strokeWidth: 6.0, // Custom stroke width for the spinner
            ),
            SizedBox(height: 20), // 
          ],
        ),
      ),
    );
  }
}

// New screen to navigate to after the delay
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Not Whatsapp"),
      ),
      body: Center(
        child: Text(
          "Alo !",
          style: TextStyle(fontSize: 24, color: const Color.fromARGB(255, 0, 0, 0)),
        ),
      ),
    );
  }
}
