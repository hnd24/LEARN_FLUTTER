import 'package:flutter/material.dart';

class MyCheckbox extends StatefulWidget {
  const MyCheckbox({super.key});

  @override
  State<MyCheckbox> createState() => _MyCheckboxState();
}

class _MyCheckboxState extends State<MyCheckbox> {
  // tạo danh sách dài để test cuộn
  final List<String> _options = List.generate(30, (i) => 'Option ${i + 1}');
  final List<String> _selectedOptions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkbox + Scroll View')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // 👇 Bọc nội dung bằng SingleChildScrollView để có thể cuộn
        child: SingleChildScrollView(
          // physics: luôn có hiệu ứng cuộn mượt
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Chọn các tùy chọn bạn muốn:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),

              // Danh sách checkbox
              for (final option in _options)
                CheckboxListTile(
                  title: Text(option),
                  value: _selectedOptions.contains(option),
                  onChanged: (isChecked) {
                    setState(() {
                      if (isChecked == true) {
                        _selectedOptions.add(option);
                      } else {
                        _selectedOptions.remove(option);
                      }
                    });
                  },
                ),

              const SizedBox(height: 20),

              Center(
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Bạn đã chọn: ${_selectedOptions.join(', ')}',
                        ),
                      ),
                    );
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
