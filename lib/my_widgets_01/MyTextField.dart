import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  const MyTextField({super.key});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Builder(
          builder: (context) {
            // These variables are captured by the StatefulBuilder below and will persist
            // for the lifetime of this widget instance.
            final TextEditingController _controller = TextEditingController();
            String _submitted = '';

            return StatefulBuilder(
              builder: (context, setState) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        filled: true,
                        fillColor: Colors.amberAccent[400],
                        labelText: 'Enter Text',
                        prefixIcon: const Icon(Icons.text_fields),
                      ),
                      onSubmitted: (value) {
                        setState(() {
                          _submitted = value;
                          _controller.clear();
                        });
                      },
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _submitted = _controller.text;
                          _controller.clear();
                        });
                      },
                      child: const Text('Enter'),
                    ),
                    const SizedBox(height: 16),
                    if (_submitted.isNotEmpty)
                      Text(_submitted, style: const TextStyle(fontSize: 16)),
                  ],
                );
              },
            );
          },
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
