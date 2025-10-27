import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../db/UserDatabaseHelper.dart';
import '../model/User.dart';

class UserDetailScreen extends StatefulWidget {
  final User user;

  const UserDetailScreen({super.key, required this.user});

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

// hiển thị thông tin user (email,name, password, avatar,DateTime ) và có thể thay đổi và có nút cập nhật lại thông tin
class _UserDetailScreenState extends State<UserDetailScreen> {
  final UserDatabaseHelper dbHelper = UserDatabaseHelper();
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _dateOfBirthController;
  String? _avatarPath;
  DateTime? _selectedDate;
  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.user.name);
    _emailController = TextEditingController(text: widget.user.email);
    _passwordController = TextEditingController(text: widget.user.password);
    _dateOfBirthController = TextEditingController(
      text: widget.user.dateOfBirth.toIso8601String(),
    );
    _avatarPath = widget.user.avatar;
    _selectedDate = widget.user.dateOfBirth;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _dateOfBirthController.dispose();
    super.dispose();
  }

  Future<void> _updateUser() async {
    final updatedUser = widget.user.copyWith(
      name: _nameController.text,
      email: _emailController.text,
      password: _passwordController.text,
      avatar: _avatarPath,
    );
    await dbHelper.updateUser(updatedUser);
    Navigator.pop(context, true); // Trả về true để báo hiệu đã cập nhật
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // có nút refresh để load lại dữ liệu và nút trả lại màn hình danh sách user
      appBar: AppBar(
        title: const Text('User Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              setState(() {});
            },
          ),
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Avatar thay đổi bằng cách chọn từ gallery hoặc chụp ảnh mới
              _avatarPath != null
                  ? CircleAvatar(
                      radius: 50,
                      backgroundImage: FileImage(File(_avatarPath!)),
                    )
                  : const CircleAvatar(
                      radius: 50,
                      child: Icon(Icons.person, size: 50),
                    ),
              TextButton(
                onPressed: () async {
                  // Chọn ảnh từ gallery hoặc chụp ảnh mới
                  final pickedFile = await showDialog<File>(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Select Image Source'),
                      actions: [
                        TextButton(
                          onPressed: () async {
                            final picked = await ImagePicker().pickImage(
                              source: ImageSource.gallery,
                            );
                            Navigator.pop(
                              context,
                              picked != null ? File(picked.path) : null,
                            );
                            if (picked != null) {
                              setState(() {
                                _avatarPath = picked.path;
                              });
                            }
                          },
                          child: const Text('Gallery'),
                        ),
                        TextButton(
                          onPressed: () async {
                            final picked = await ImagePicker().pickImage(
                              source: ImageSource.camera,
                            );
                            Navigator.pop(
                              context,
                              picked != null ? File(picked.path) : null,
                            );
                            if (picked != null) {
                              setState(() {
                                _avatarPath = picked.path;
                              });
                            }
                          },
                          child: const Text('Camera'),
                        ),
                      ],
                    ),
                  );
                  if (pickedFile != null) {
                    setState(() {
                      _avatarPath = pickedFile.path;
                    });
                  }
                },
                child: const Text('Change Avatar'),
              ),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              // chuyển kiểu Date từ _dateOfBirthController sang hiển thị (dd/MM/YYYY) để chọn ngày sinh
              TextField(
                controller: TextEditingController(
                  text: _selectedDate != null
                      ? DateFormat('dd/MM/yyyy').format(_selectedDate!)
                      : '',
                ),
                decoration: const InputDecoration(labelText: 'Date of Birth'),
                readOnly: true,
                onTap: () async {
                  final pickedDate = await showDatePicker(
                    context: context,
                    initialDate: _selectedDate ?? DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      _selectedDate = pickedDate;
                      _dateOfBirthController.text =
                          '${pickedDate.day}/${pickedDate.month}/${pickedDate.year}';
                    });
                  }
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _updateUser,
                child: const Text('Update User'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
