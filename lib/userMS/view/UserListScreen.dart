import 'package:flutter/material.dart';

import '../db/UserDatabaseHelper.dart';
import '../model/User.dart';
import 'UserDetailScreen.dart';
import 'UserListItem.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final UserDatabaseHelper dbHelper = UserDatabaseHelper();
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  Future<void> _loadUsers() async {
    final fetchedUsers = await dbHelper.getAllUsers();
    setState(() {
      users = fetchedUsers;
    });
  }

  Future<void> _navigateToUserDetail(User user) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UserDetailScreen(user: user)),
    );
    _loadUsers();
  }

  // method xóa user
  Future<void> _deleteUser(User user) async {
    await dbHelper.deleteUser(user.id!);
    _loadUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: _loadUsers),
        ],
      ),
      body: FutureBuilder(
        future: dbHelper.getAllUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final users = snapshot.data as List<User>;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return UserListItem(
                  user: user,
                  onUserUpdated: () => _navigateToUserDetail(user),
                  onUserDeleted: () => _deleteUser(user),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await dbHelper.createSampleData();
          _loadUsers();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
