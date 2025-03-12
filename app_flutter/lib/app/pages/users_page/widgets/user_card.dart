import 'package:app_flutter/app/models/user_model.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
    required this.user,
    required this.onPressed,
  });
  final UserModel user;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(6.0),
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nome: ${user.name}',
              ),
              const SizedBox(
                height: 4.0,
              ),
              Text(
                'User name: ${user.username}',
              ),
              const SizedBox(
                height: 4.0,
              ),
              Text(
                'Email: ${user.email}',
              ),
              const SizedBox(
                height: 4.0,
              ),
              Text(
                'Cidade: ${user.address.city}',
              ),
              const SizedBox(
                height: 4.0,
              ),
              Text(
                'Rua: ${user.address.street} - ${user.address.suite}',
              ),
              const SizedBox(
                height: 4.0,
              ),
              Text(
                'Cep: ${user.address.zipcode}',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
