import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BoardingScreen(),
    );
  }
}

class BoardingScreen extends StatefulWidget {
  @override
  _BoardingScreenState createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  final PageController _pageController = PageController();
  double _currentPage = 0; // Track current page index manually

  @override
  void initState() {
    super.initState();
    // Add listener to track page changes
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page ?? 0;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          BoardingPage(
            image: 'https://cdn.dribbble.com/userupload/19419993/file/original-0e3c74b00f3549aff59f909b30e7f3d3.png?resize=1024x768&vertical=center',
            title: 'Welcome to My App',
            description: 'Discover new features and improve your productivity.',
          ),
          BoardingPage(
            image: 'https://cdn.dribbble.com/userupload/18438410/file/original-1fba7aaee2996097d618b07a41c16957.png?resize=1024x768&vertical=center',
            title: 'Easy Navigation',
            description: 'Navigate through the app easily and find everything you need.',
          ),
          BoardingPage(
            image: 'https://example.com/image3.png',
            title: 'Get Started Now!',
            description: 'Join now and experience all the exciting features we offer!',
          ),
        ],
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {
                // Here you can navigate to your app's main screen
                print("Skip pressed");
              },
              child: Text('Skip'),
            ),
            Row(
              children: List.generate(3, (index) {
                return AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  height: 10.0,
                  width: _currentPage == index ? 20.0 : 10.0,
                  decoration: BoxDecoration(
                    color: _currentPage == index ? Colors.blue : Colors.grey,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                );
              }),
            ),
            ElevatedButton(
              onPressed: () {
                if (_currentPage == 2) {
                  // Navigate to the home screen
                  print("Get Started pressed");
                } else {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                }
              },
              child: Text(_currentPage == 2 ? 'Get Started' : 'Next'),
            ),
          ],
        ),
      ),
    );
  }
}

class BoardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  BoardingPage({
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.network(
          image,
          height: 300, // Adjust size as needed
          width: double.infinity,
          fit: BoxFit.contain, // Prevents distortion
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return Icon(Icons.broken_image, size: 100, color: Colors.red);
          },
        ),
        SizedBox(height: 30),
        Text(
          title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}