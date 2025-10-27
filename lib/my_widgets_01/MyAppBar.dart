import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Scaffold'),
        backgroundColor: Colors.greenAccent[100],
        elevation: 100,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              print("Settings Pressed");
            },
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              print("Search Pressed");
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              print("More Pressed");
            },
          ),
        ],
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hello, this is my custom AppBar!'),
            SizedBox(height: 20),
            Icon(Icons.star, size: 50, color: Colors.amber),
            Text('This is a star icon'),
            SizedBox(height: 20),
            Icon(Icons.favorite, size: 50, color: Colors.red),
            Text(
              'This is a favorite icon',
              style: TextStyle(
                color: Colors.red,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Icon(Icons.thumb_up, size: 50, color: Colors.blue),
            Text(
              'This is a thumb up icon',
              style: TextStyle(color: Colors.blue),
            ),
            SizedBox(height: 20),
            Icon(Icons.share, size: 50, color: Colors.green),
            Text('This is a share icon', style: TextStyle(color: Colors.green)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
          print("Floating Action Button Pressed");
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
