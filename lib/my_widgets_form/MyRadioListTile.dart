import 'package:flutter/material.dart';

class MyRadioListTile extends StatefulWidget {
  const MyRadioListTile({super.key});

  @override
  State<MyRadioListTile> createState() => _MyRadioListTileState();
}

class _MyRadioListTileState extends State<MyRadioListTile> {
  String? _selectedOption;
  final List<String> _options = ['Option 1', 'Option 2', 'Option 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Basic Form')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 🔥 Gói cả nhóm radio bằng RadioGroup
            RadioGroup<String>(
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value;
                  print('Selected: $_selectedOption');
                });
              },
              // RadioGroup nhận đúng 1 widget con: child:
              child: Column(
                children: [
                  for (final option in _options)
                    RadioListTile<String>(
                      title: Text(option),
                      value: option,
                      // KHÔNG truyền groupValue / onChanged ở đây nữa
                    ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                if (_selectedOption != null) {
                  print('Selected Option: $_selectedOption');
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Form Submitted: $_selectedOption')),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please select an option first'),
                    ),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
