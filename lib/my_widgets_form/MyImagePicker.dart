import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyImagePicker extends StatefulWidget {
  const MyImagePicker({super.key});

  @override
  State<MyImagePicker> createState() => _MyImagePickerState();
}

class _MyImagePickerState extends State<MyImagePicker> {
  File? _imageFile; // để lưu hình được chọn hoặc chụp

  // Hàm chọn ảnh từ thư viện
  Future<void> _pickImageFromGallery() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  // Hàm chụp ảnh bằng camera
  Future<void> _pickImageFromCamera() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chọn ảnh từ Camera hoặc Gallery')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Hiển thị hình ảnh nếu có
            _imageFile != null
                ? Image.file(
                    _imageFile!,
                    width: 250,
                    height: 250,
                    fit: BoxFit.cover,
                  )
                : const Icon(Icons.image, size: 120, color: Colors.grey),

            const SizedBox(height: 20),

            ElevatedButton.icon(
              onPressed: _pickImageFromGallery,
              icon: const Icon(Icons.photo),
              label: const Text('Chọn ảnh từ thư viện'),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: _pickImageFromCamera,
              icon: const Icon(Icons.camera_alt),
              label: const Text('Chụp ảnh từ camera'),
            ),
          ],
        ),
      ),
    );
  }
}
