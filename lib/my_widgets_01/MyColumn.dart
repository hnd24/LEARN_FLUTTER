import 'package:flutter/material.dart';

class MyColumn extends StatelessWidget {
  const MyColumn({super.key});

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
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.star, size: 50, color: Colors.amber),
                SizedBox(width: 20),
                Icon(Icons.favorite, size: 50, color: Colors.red),
                SizedBox(width: 20),
                Icon(Icons.thumb_up, size: 50, color: Colors.blue),
                SizedBox(width: 20),
                Icon(Icons.share, size: 50, color: Colors.green),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'This is my custom column with icons in a row!',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.home, size: 50, color: Colors.purple),
                SizedBox(width: 20),
                Icon(Icons.work, size: 50, color: Colors.orange),
                SizedBox(width: 20),
                Icon(Icons.school, size: 50, color: Colors.teal),
              ],
            ),
            const SizedBox(height: 20),
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
