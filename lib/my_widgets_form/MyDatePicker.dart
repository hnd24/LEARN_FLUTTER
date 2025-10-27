import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyDatePicker extends StatefulWidget {
  const MyDatePicker({super.key});

  @override
  State<MyDatePicker> createState() => _MyDatePickerState();
}

class _MyDatePickerState extends State<MyDatePicker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Basic Form')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                final DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (pickedDate != null) {
                  String formattedDate = DateFormat(
                    'dd/MM/yyyy',
                  ).format(pickedDate);
                  print('Selected date: $formattedDate');
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Selected date: $formattedDate')),
                  );
                }
              },
              child: const Text('Pick a Date'),
            ),
          ],
        ),
      ),
    );
  }
}
