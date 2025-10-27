import 'package:flutter/material.dart';

class Mygestures extends StatelessWidget {
  const Mygestures({super.key});

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
            GestureDetector(
              child: Container(
                color: Colors.blue,
                width: 200,
                height: 100,
                child: Center(
                  child: Text(
                    'Tap Me',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              onPanUpdate: (details) {
                print("Container Panned: ${details.delta}");
              },
            ),
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
