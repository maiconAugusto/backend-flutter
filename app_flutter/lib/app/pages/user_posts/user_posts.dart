import 'package:flutter/material.dart';

class UserPosts extends StatefulWidget {
  const UserPosts({
    super.key,
    required this.userName,
    required this.userId,
  });
  final String userName;
  final int userId;

  @override
  State<UserPosts> createState() => _UserPostsState();
}

class _UserPostsState extends State<UserPosts> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
