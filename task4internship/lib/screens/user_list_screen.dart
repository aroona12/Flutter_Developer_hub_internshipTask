import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task4internship/screens/user_profile.dart';
import '../providers/user_provider.dart';

import '../widgets/custom_loader.dart';

class UserListScreen extends StatefulWidget {
  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {

  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<UserProvider>(context, listen: false).loadUsers()
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Users")),
      body: Consumer<UserProvider>(
        builder: (context, provider, child) {

          if (provider.isLoading) {
            return CustomLoader();
          }

          if (provider.error.isNotEmpty) {
            return Center(child: Text(provider.error));
          }

          return ListView.builder(
            itemCount: provider.users.length,
            itemBuilder: (context, index) {

              final user = provider.users[index];

              return Card(
                margin: EdgeInsets.all(10),
                child: ListTile(
                  title: Text(user.firstName),
                  subtitle: Text(user.email),

                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            UserProfileScreen(user: user),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
