import 'dart:io';

import 'package:flutter/material.dart';

import '../db/UserDatabaseHelper.dart';
import '../model/User.dart';
import 'UserDetailScreen.dart';

// Hiển thị từng đối tượng user được truyền vào và có nút cập nhật dẫn đến màn hình chi tiết và xóa
class UserListItem extends StatelessWidget {
  final User user;
  final VoidCallback onUserUpdated;
  final VoidCallback onUserDeleted;

  const UserListItem({
    super.key,
    required this.user,
    required this.onUserUpdated,
    required this.onUserDeleted,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: user.avatar != null
          ? CircleAvatar(backgroundImage: FileImage(File(user.avatar!)))
          : const CircleAvatar(child: Icon(Icons.person)),
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserDetailScreen(user: user),
                ),
              );
              if (result == true) {
                onUserUpdated();
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () async {
              final dbHelper = UserDatabaseHelper();
              await dbHelper.deleteUser(user.id!);
              onUserDeleted();
            },
          ),
        ],
      ),
    );
  }
}
