import 'package:app_flutter/app/models/user_model.dart';
import 'package:app_flutter/app/pages/user_posts/user_posts.dart';
import 'package:app_flutter/app/pages/users_page/widgets/user_card.dart';
import 'package:app_flutter/app/services/api_service.dart';
import 'package:app_flutter/app/utils/snack.dart';
import 'package:flutter/material.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  final ApiService _apiService = ApiService();
  bool loading = false;
  List<UserModel> users = [];

  @override
  void initState() {
    super.initState();
    loadUsers();
  }

  void loadUsers() async {
    try {
      setState(() {
        loading = true;
      });
      List<UserModel> usersResponse = await _apiService.fetchUsers();
      setState(() {
        users = usersResponse;
      });
    } catch (e) {
      showError(
        context: context,
        message: 'Erro ao listar os usuários',
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
        backgroundColor: Colors.indigo,
        centerTitle: true,
        title: const Text(
          "Usuários",
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Visibility(
                visible: !loading,
                replacement: const Center(
                  child: CircularProgressIndicator(
                    color: Colors.indigo,
                  ),
                ),
                child: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    return UserCard(
                      onPressed: () {
                        Navigator.of(context).push<void>(
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => UserPosts(
                              userId: users[index].id,
                              userName: users[index].name,
                            ),
                          ),
                        );
                      },
                      user: users[index],
                    );
                  },
                ),
              ),
            ),
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      WidgetStateProperty.all<Color>(Colors.indigo),
                ),
                onPressed: () => loadUsers(),
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  width: MediaQuery.sizeOf(context).width,
                  child: const Text(
                    'Atualizar',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
