import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key});

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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Hello, this is my custom Button!'),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: null, child: Text('Disabled Button')),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print("Enabled Button Pressed");
              },
              child: const Text('Enabled Button'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            IconButton(
              icon: const Icon(Icons.thumb_up),
              onPressed: () {
                print("Icon Button Pressed");
              },
            ),
            const SizedBox(height: 20),
            FloatingActionButton(
              onPressed: () {
                print("Floating Action Button Pressed");
              },
              child: const Icon(Icons.add),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                print("InkWell Tapped");
              },
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'InkWell Button',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
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
