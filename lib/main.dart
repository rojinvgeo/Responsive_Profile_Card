import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ProfileCardPage(),
    );
  }
}

class ProfileCardPage extends StatelessWidget {
  const ProfileCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      appBar: AppBar(
        title: const Text('Responsive Profile Card'),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: const ProfileCard(),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    // ✅ Step 1: Get screen width
    double screenWidth = MediaQuery.of(context).size.width;

    // ✅ Step 2: Make responsive decisions
    bool isMobile = screenWidth < 600;

    return Center(
      child: Container(
        width: isMobile ? double.infinity : 600,
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 2),
          ],
        ),

        // ✅ Step 3: Use Row for large screens, Column for small
        child: isMobile
            ? Column(
                children: _buildCardContent(),
              )
            : Row(
                children: _buildCardContent(),
              ),
      ),
    );
  }

  // ✅ Step 4: Extract shared content (image + text)
  List<Widget> _buildCardContent() {
    return [
      // Profile Image
      ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image.network(
          'https://i.pravatar.cc/150?img=3',
          width: 120,
          height: 120,
          fit: BoxFit.cover,
        ),
      ),
      const SizedBox(width: 20, height: 20),

      // Profile Info
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Rojin V George',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Flutter Developer',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 12),
            Text(
              'Passionate about building beautiful and functional mobile applications with Flutter. Experienced in Dart, Firebase, and RESTful APIs.',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    ];
  }
}

