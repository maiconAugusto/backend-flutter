import 'package:app_flutter/app/models/user_post_model.dart';
import 'package:app_flutter/app/services/api_service.dart';
import 'package:app_flutter/app/utils/snack.dart';
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
  bool loading = false;
  List<UserPostModel> _userPosts = [];
  final ApiService _apiService = ApiService();

  @override
  void initState() {
    super.initState();
    loadUserPosts();
  }

  void loadUserPosts() async {
    try {
      setState(() {
        loading = true;
      });
      List<UserPostModel> userPostsResponse = await _apiService.fetchUserPosts(
        userId: widget.userId,
      );
      setState(() {
        _userPosts = userPostsResponse;
      });
    } catch (e) {
      showError(
        context: context,
        message: 'Erro ao listar posts',
      );
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.indigo,
        centerTitle: true,
        title: const Text(
          "Posts",
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 6,
              ),
              Visibility(
                visible: !loading,
                child: Container(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'Nome: ${widget.userName}',
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: !loading,
                replacement: Container(
                  margin: const EdgeInsets.only(top: 40),
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: Colors.indigo,
                    ),
                  ),
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _userPosts.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(_userPosts[index].title),
                            Text(_userPosts[index].body),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
